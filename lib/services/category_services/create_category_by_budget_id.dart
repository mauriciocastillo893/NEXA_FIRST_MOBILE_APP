import 'package:dio/dio.dart';
import 'package:moviles_app/domain/entities/last_movement.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> createCategoryByBudgetIdController(
    {required String categoryDescription,
    required double allocatedAmount,
    required OperationType operationType,
    required String budgetId}) async {
  final dio = Dio();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final token = sharedPreferences.getString('token');

  try {
    final response = await dio.post(
      'https://hacorp-api.vercel.app/api/category',
      data: {
        'description': categoryDescription,
        'planned': allocatedAmount,
        'type': operationType,
        'budgetId': budgetId,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = response.data as Map<String, dynamic>;
      print(
          "Response Data got in createCategoryByBudgetIdController: $responseData");
    } else {
      throw Exception('Failed to load user data');
    }

    return Future.value();
  } catch (e) {
    print("Error detected in: $e");
    return Future.error(e);
  }
}
