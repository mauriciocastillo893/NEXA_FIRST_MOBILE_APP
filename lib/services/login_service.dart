import 'package:dio/dio.dart';

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

    final responseData = response.data as Map<String, dynamic>;
    final userId = responseData['user']['_id'];
    final token = responseData['token'];

    print("Response [ID]: $userId");
    print("Response [Token]: $token");

    return Future.value();
  } catch (e) {
    print("Error detected in: $e");
    return Future.error(e);
  }
}
