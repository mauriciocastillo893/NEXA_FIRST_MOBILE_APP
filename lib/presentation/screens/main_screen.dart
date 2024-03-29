import 'package:flutter/material.dart';
import 'package:moviles_app/presentation/screens/login_screen.dart';
import 'package:moviles_app/presentation/screens/register_screen.dart';
import 'package:moviles_app/presentation/widgets/shared/elevated_button_box.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Menú de Inicio")),
      body: _MainView(),
    );
  }
}

class _MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.64,
            width: double.infinity,
            child:
                Image.asset('assets/images/LoginImage.png', fit: BoxFit.cover),
          ),
          Positioned(
              child: Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.transparent,
                  Color(0xFF202020),
                  // Colors.black87.withOpacity(0.7),
                ])),
          ))
        ],
      ),
      const SizedBox(height: 30),
      Row(
        children: [
          Expanded(
            child: Text(
              "CONTROLA TUS \nGASTOS",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF8AFF10),
                fontWeight: FontWeight.w900,
                fontSize: MediaQuery.of(context).size.width * 0.08,
                height: 1,
                // backgroundColor: Colors.red,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
      Row(children: [
        Expanded(
          child: Text(
            "Empieza a tomar control de tu \ndinero digitalizado",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: MediaQuery.of(context).size.width * 0.04,
                height: 1.2),
          ),
        )
      ]),
      const SizedBox(height: 40),
      Row(
        mainAxisAlignment:
            MainAxisAlignment.center, // Alinea los botones al centro de la fila
        children: [
          ElevatedButtonBox(
            text: "Registrarse",
            darkMode: true,
            borderRadiusOf: 12,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreen()));
            },
          ),
          const SizedBox(width: 20),
          ElevatedButtonBox(
            text: "Iniciar sesión",
            borderRadiusOf: 12,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
          ),
        ],
      )
    ]);
  }
}
