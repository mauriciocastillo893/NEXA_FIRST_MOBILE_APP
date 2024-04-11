import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> loginController(
    {required String email, required String password}) async {
  final dio = Dio();
  try {
    final response = await dio.post(
      'https://hacorp-api.vercel.app/api/user/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final responseData = response.data as Map<String, dynamic>;
      // final userId = responseData['user']['_id'];
      // final token = responseData['token'];

      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('userId', responseData['user']['_id']);
      sharedPreferences.setString('token', responseData['token']);

      // print("Response [ID]: $userId");
      // print("Response [Token]: $token");
      print("userID saved: ${sharedPreferences.getString('userId')}");
      print("Token saved: ${sharedPreferences.getString('token')}");
    } else {
      throw Exception('Failed to login');
    }

    return Future.value();
  } catch (e) {
    print("Error detected in: $e");
    return Future.error(e);
  }
}
