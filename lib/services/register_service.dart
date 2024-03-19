import 'package:dio/dio.dart';

Future<void> signUpController(
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

    final responseData = response.data as Map<String, dynamic>;
    final responseName = responseData['name'];
    final responseEmail = responseData['email'];
    final responsePassword = responseData['password'];

    print("Response [Name]: $responseName");
    print("Response [Email]: $responseEmail");
    print("Response [Password]: $responsePassword");

    return Future.value();
  } catch (e) {
    print("Error detected in: $e");
    return Future.error(e);
  }
}
