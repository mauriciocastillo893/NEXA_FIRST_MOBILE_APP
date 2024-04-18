import 'package:dio/dio.dart';

Future<void> signUpUserController(
    {required String username,
    required String email,
    required String password}) async {
  final dio = Dio();
  try {
    final response = await dio.post(
      'https://hacorp-api.vercel.app/api/user',
      data: {
        'name': username,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = response.data as Map<String, dynamic>;
      final responseName = responseData['name'];
      final responseEmail = responseData['email'];
      final responsePassword = responseData['password'];

      print("Response [Name]: $responseName");
      print("Response [Email]: $responseEmail");
      print("Response [Password]: $responsePassword");
    } else {
      throw Exception('Failed to sign up');
    }
    return Future.value();
  } catch (e) {
    print("Error detected in: $e");
    return Future.error(e);
  }
}
