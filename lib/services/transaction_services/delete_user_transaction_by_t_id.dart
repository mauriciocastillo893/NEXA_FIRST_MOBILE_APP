import 'package:dio/dio.dart';
import 'package:moviles_app/presentation/widgets/assistance/alert_assistance.dart';
import 'package:moviles_app/services/transaction_services/get_transaction_by_user_id.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> deleteUserTransactionByTransactionIdController({
  required String transactionId,
}) async {
  final dio = Dio();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final token = sharedPreferences.getString('token');

  if (transactionId.isEmpty) {
    return Future.error("Transaction ID is empty");
  }
      
  try {
    final response = await dio.delete(
      'https://hacorp-api.vercel.app/api/transaction/$transactionId',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200) {
      final responseData = response.data as Map<String, dynamic>;
      print(
          "Response Data got in deleteUserTransactionByTransactionIdController: $responseData");
    } else {
      throw Exception('Failed to load user data');
    }

    return Future.value();
  } catch (e) {
    print("Error detected in: $e");
    return Future.error(e);
  }
}
