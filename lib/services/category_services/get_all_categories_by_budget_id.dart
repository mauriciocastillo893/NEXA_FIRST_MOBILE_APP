import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> getAllCategoriesByBudgetIdController(
    {required String budgetId}) async {
  final dio = Dio();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final token = sharedPreferences.getString('token');

  try {
    final response = await dio.get(
      'https://hacorp-api.vercel.app/api/category/$budgetId',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200) {
      final responseData = response.data as Map<String, dynamic>;
      print("Response Data got in getAllCategoriesByBudgetId: $responseData");
    } else {
      throw Exception('Failed to load user data');
    }

    return Future.value();
  } catch (e) {
    print("Error detected in: $e");
    return Future.error(e);
  }
}
