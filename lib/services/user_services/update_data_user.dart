import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> updateDataUserByIdController(
    {required String username,
    required String password}) async {
  
  final dio = Dio();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final token = sharedPreferences.getString('token');
  final userId = sharedPreferences.getString('userId');

  try {
    final response = await dio.patch(
      'https://hacorp-api.vercel.app/api/user/$userId',
      data: {
        'name': username,
        'password': password,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200) {
      final responseData = response.data as Map<String, dynamic>;
      print("Response Data got in updateDataUserByIdController: $responseData");
    } else {
      throw Exception('Failed to load user data');
    }

    return Future.value();
  } catch (e) {
    print("Error detected in: $e");
    return Future.error(e);
  }
}
