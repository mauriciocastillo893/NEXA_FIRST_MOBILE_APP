import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> createTddByUserIdController(
    {required String debitCardName, required double amount}) async {
  final dio = Dio();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final token = sharedPreferences.getString('token');
  final userId = sharedPreferences.getString('userId');

  try {
    final response = await dio.post(
      'https://hacorp-api.vercel.app/api/tdd',
      data: {
        'name': debitCardName,
        'amount': amount,
        'userId': userId,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = response.data as Map<String, dynamic>;
      print("Response Data got in createTddByUserIdController: $responseData");
    } else {
      throw Exception('Failed to load user data');
    }

    return Future.value();
  } catch (e) {
    print("Error detected in: $e");
    return Future.error(e);
  }
}
