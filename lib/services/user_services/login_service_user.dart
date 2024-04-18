import 'package:dio/dio.dart';
import 'package:moviles_app/services/user_services/get_data_user_by_user_id.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> loginUserController(
    {required String email, required String password}) async {
  final dio = Dio();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  try {
    final response = await dio.post(
      'https://hacorp-api.vercel.app/api/user/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final responseData = response.data as Map<String, dynamic>;
      // final userId = responseData['user']['_id'];
      // final token = responseData['token'];

      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('userId', responseData['user']['_id']);
      sharedPreferences.setString('token', responseData['token']);

      // print("Response [ID]: $userId");
      // print("Response [Token]: $token");
      // print("userID saved: ${sharedPreferences.getString('userId')}");
      // print("Token saved: ${sharedPreferences.getString('token')}");
      final dataUser = await getDataUserByUserIdController();
      // print("dataUser: $dataUser");
      List<dynamic> budgets = dataUser['budgets'];
      for (var budget in budgets) {
        // Acceder al email y al _id de cada budget
        String email = dataUser['email'];
        String id = budget['_id'];
        sharedPreferences.setString('email', email);
        sharedPreferences.setString('idBudget', id);
        // print('Email del budget: $email');
        // print('ID del budget: $id');
      }
    } else {
      throw Exception('Failed to login');
    }

    return Future.value();
  } catch (e) {
    print("Error detected in: $e");
    return Future.error(e);
  }
}
