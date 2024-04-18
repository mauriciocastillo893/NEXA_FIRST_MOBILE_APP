import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moviles_app/presentation/widgets/shared/app_bar_box.dart';
import 'package:moviles_app/presentation/widgets/shared/elevated_button_box.dart';

class TempFileRN extends StatefulWidget {
  const TempFileRN({super.key});

  @override
  State<StatefulWidget> createState() => _TempFileRNState();
}

class _TempFileRNState extends State<TempFileRN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarBox(
          title: "Temp File RN",
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButtonBox(
                  text: "Felicidad",
                  onPressed: () {
                    rnController(forcedResult: "Felicidad");
                  }),
              const SizedBox(height: 10),
              ElevatedButtonBox(
                  text: "Tristeza",
                  onPressed: () {
                    rnController(forcedResult: "Tristeza");
                  }),
              const SizedBox(height: 10),
              ElevatedButtonBox(
                  text: "Enojo",
                  onPressed: () {
                    rnController(forcedResult: "Enojo");
                  }),
              const SizedBox(height: 10),
              ElevatedButtonBox(
                  text: "Sorpresa",
                  onPressed: () {
                    rnController(forcedResult: "Sorpresa");
                  }),
              const SizedBox(height: 10),
              ElevatedButtonBox(
                  text: "Miedo",
                  onPressed: () {
                    rnController(forcedResult: "Miedo");
                  }),
              const SizedBox(height: 10),
              ElevatedButtonBox(
                  text: "Disgusto",
                  onPressed: () {
                    rnController(forcedResult: "Disgusto");
                  }),
              const SizedBox(height: 10),
              ElevatedButtonBox(
                  text: "Confusión",
                  onPressed: () {
                    rnController(forcedResult: "Confusion");
                  }),
              const SizedBox(height: 10),
              ElevatedButtonBox(
                  text: "Neutralidad",
                  onPressed: () {
                    rnController(forcedResult: "Neutralidad");
                  }),
              const SizedBox(height: 10),
              ElevatedButtonBox(
                  text: "Verguenza",
                  onPressed: () {
                    rnController(forcedResult: "Verguenza");
                  }),
              const SizedBox(height: 10),
              ElevatedButtonBox(
                  text: "Alegría",
                  onPressed: () {
                    rnController(forcedResult: "Alegria");
                  }),
            ],
          ),
        ));
  }
}

Future<void> rnController({required String forcedResult}) async {
  final dio = Dio();
  print("Sending $forcedResult");
  try {
    final response = await dio.post(
      'https://localhost:5000',
      data: {
        'forced_result': forcedResult,
      },
    );

    if (response.statusCode == 200) {
      final responseData = response.data as Map<String, dynamic>;
      print("Response: $responseData");
      // final userId = responseData['user']['_id'];
      // print("Response [ID]: $userId");
    } else {
      throw Exception('Failed to rn result');
    }

    // return Future.value();
  } catch (e) {
    print("Error detected in: $e");
    // return Future.error(e);
  }
}
