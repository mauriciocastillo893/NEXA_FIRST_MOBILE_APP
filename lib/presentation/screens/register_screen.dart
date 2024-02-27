import 'package:flutter/material.dart';
import 'package:moviles_app/presentation/screens/login_screen.dart';
import 'package:moviles_app/presentation/screens/main_screen.dart';
import 'package:moviles_app/presentation/widgets/shared/message_field_box.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Iniciar Sesión")),
      body: _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: Image.asset(
                'assets/images/LoginImage.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Color(0xFF202020)])),
              ),
            ),
            Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreen()));
                    },
                    // tooltip: "Regresar",
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Color(0xFFFFFDFD),
                    ),
                  ),
                ))
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Text("HACOP",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: MediaQuery.of(context).size.width * 0.045,
            )),
        // SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Text("REGISTRATE",
            style: TextStyle(
              color: const Color(0xFF8AFF10),
              fontWeight: FontWeight.w900,
              fontSize: MediaQuery.of(context).size.width * 0.08,
            )),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const MessageFieldBox(placeholder: "Correo Eléctronico"),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const MessageFieldBox(placeholder: "Usuario"),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const MessageFieldBox(placeholder: "Contraseña"),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFFDFD),
            minimumSize: const Size(150, 45),
          ),
          child: Text("Registrarse",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04)),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.008),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF202020),
              minimumSize: const Size(150, 45),
              shadowColor: Colors.transparent),
          child: Text("¿Ya tienes una cuenta? \nInicia Sesión",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFFFFFDFD),
                fontSize: MediaQuery.of(context).size.width * 0.03,
              )),
        )
      ]),
    );
  }
}
