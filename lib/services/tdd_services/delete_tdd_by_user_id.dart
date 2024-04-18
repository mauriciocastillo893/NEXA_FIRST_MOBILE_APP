import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> deleteTddByUserIdController(
    {required String newDebitCardName, required double amount}) async {
  final dio = Dio();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final token = sharedPreferences.getString('token');
  final userId = sharedPreferences.getString('userId');

  try {
    final response = await dio.delete(
      'https://hacorp-api.vercel.app/api/tdd/$userId',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200) {
      final responseData = response.data as Map<String, dynamic>;
      print("Response Data got in deleteTddByUserIdController: $responseData");
    } else {
      throw Exception('Failed to load user data');
    }

    return Future.value();
  } catch (e) {
    print("Error detected in: $e");
    return Future.error(e);
  }
}
