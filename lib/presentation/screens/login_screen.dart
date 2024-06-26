import 'package:flutter/material.dart';
import 'package:moviles_app/presentation/screens/lobby_user_screen.dart';
import 'package:moviles_app/presentation/screens/main_screen.dart';
import 'package:moviles_app/presentation/screens/register_screen.dart';
import 'package:moviles_app/presentation/widgets/assistance/alert_assistance.dart';
import 'package:moviles_app/presentation/widgets/shared/elevated_button_box.dart';
import 'package:moviles_app/presentation/widgets/shared/message_field_box.dart';
import 'package:moviles_app/services/user_services/login_service_user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginView();
  }
}

class _LoginView extends State<LoginScreen> {
  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  String email = "";
  String password = "";

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
        Text("BIENVENIDO",
            style: TextStyle(
              color: const Color(0xFF8AFF10),
              fontWeight: FontWeight.w900,
              fontSize: MediaQuery.of(context).size.width * 0.08,
            )),
        SizedBox(height: MediaQuery.of(context).size.height * 0.0175),
        MessageFieldBox(
            title: "Email",
            placeholder: "",
            typeOfIcon: const Icon(Icons.email),
            borderRadiusOf: 12,
            actualFocusNode: focusNode1,
            nextFocusNode: focusNode2,
            onChanged: (value) {
              setState(() {
                email = value;
              });
            }),
        SizedBox(height: MediaQuery.of(context).size.height * 0.0175),
        MessageFieldBox(
          title: "Contraseña",
          placeholder: "",
          typeOfIcon: const Icon(Icons.password),
          borderRadiusOf: 12,
          actualFocusNode: focusNode2,
          // nextFocusNode: focusNode3,
          onChanged: (value) {
            setState(() {
              password = value;
            });
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.0275),
        ElevatedButtonBox(
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return const LobbyUserScreen();
            // }));

            email.isEmpty || password.isEmpty
                ? showAlertAssistance(context,
                    title: "Inicio de Sesión Fallido",
                    content: "¡Debes llenar todos los campos!",
                    colorAcceptButton: const Color(0xFF8AFF10),
                    onCancelButtonActive: false)
                : loginUserController(email: email, password: password)
                    .then((_) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const LobbyUserScreen();
                    }));
                  }).catchError((onError) {
                    showAlertAssistance(
                      context,
                      title: "Inicio de Sesión Fallido",
                      content: "¡Usuario o contraseña incorrectos!",
                      onCancelButtonActive: false,
                    );
                  });
          },
          text: "Iniciar Sesión",
          borderRadiusOf: 12,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.005),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegisterScreen()));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF202020),
              minimumSize: const Size(150, 45),
              shadowColor: Colors.transparent),
          child: Text("¿No tienes una cuenta? \nRegístrate",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFFFFFDFD),
                fontSize: MediaQuery.of(context).size.width * 0.03,
              )),
        )
      ]),
    ));
  }
}
