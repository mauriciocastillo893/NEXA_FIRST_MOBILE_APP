import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

// No se puede crear más de 2 en un mismo mes, el identificador es la fecha
Future<void> createBudgetByUserIdController() async {
  final dio = Dio();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final token = sharedPreferences.getString('token');
  final userId = sharedPreferences.getString('userId');

  try {
    // Crear una instancia de DateTime con la fecha deseada
    DateTime creationDate = DateTime(2022, 4, 1);
    String formattedDate = DateFormat('yyyy-MM-dd').format(creationDate);
    print('creationDate: "$formattedDate"');

    final response = await dio.post(
      'https://hacorp-api.vercel.app/api/budget',
      data: {
        'creationDate': creationDate,
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
      print(
          "Response Data got in createBudgetByUserIdController: $responseData");
    } else {
      throw Exception('Failed to load user data');
    }

    return Future.value();
  } catch (e) {
    print("Error detected in: $e");
    return Future.error(e);
  }
}
