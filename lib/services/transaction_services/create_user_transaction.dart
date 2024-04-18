import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

Future<void> createUserTransactionController({
  required double amount,
  required String description,
  required String categoryId,
  required String tddId,
}) async {
  final dio = Dio();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final token = sharedPreferences.getString('token');

  try {
    // Crear una instancia de DateTime con la fecha deseada
    DateTime creationDate = DateTime(2022, 4, 1);
    String formattedDate = DateFormat('yyyy-MM-dd').format(creationDate);
    print('creationDate: "$formattedDate"');

    print(
        "Sending: date $formattedDate, amount $amount, description $description, categoryId $categoryId, tddId $tddId");
    final response = await dio.post(
      'https://hacorp-api.vercel.app/api/transaction',
      data: {
        'date': formattedDate,
        'amount': amount,
        'description': description,
        'categoryId': "66184d619f9b17bba603bbc7",
        'tddId': "661835dcc07f897fc9b228b2",
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(
          "Response Data got in createUserTransactionController: ${response.data}");
    } else {
      throw Exception('Failed to load user data');
    }

    return Future.value();
  } catch (e) {
    print("Error detected in: $e");
    return Future.error(e);
  }
}
