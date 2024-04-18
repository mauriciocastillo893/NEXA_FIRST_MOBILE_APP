import 'package:flutter/material.dart';
import 'package:moviles_app/presentation/screens/login_screen.dart';
import 'package:moviles_app/presentation/screens/main_screen.dart';
import 'package:moviles_app/presentation/widgets/shared/elevated_button_box.dart';
import 'package:moviles_app/presentation/widgets/shared/message_field_box.dart';
import 'package:moviles_app/presentation/widgets/assistance/alert_assistance.dart';
import 'package:moviles_app/services/user_services/sign_up_service_user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterView();
  }
}

class _RegisterView extends State<RegisterScreen> {
  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  final focusNode3 = FocusNode();
  String username = "";
  String email = "";
  String password = "";

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
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
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: Image.asset(
                'assets/images/LoginImage.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
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
        SizedBox(height: MediaQuery.of(context).size.height * 0.018),
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
        SizedBox(height: MediaQuery.of(context).size.height * 0.018),
        MessageFieldBox(
          title: "Correo electrónico",
          placeholder: "myuser@example.com",
          typeOfIcon: const Icon(Icons.email),
          borderRadiusOf: 12,
          actualFocusNode: focusNode1,
          nextFocusNode: focusNode2,
          onChanged: (value) {
            setState(() {
              email = value;
            });
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.018),
        MessageFieldBox(
          title: "Nombre de Usuario",
          placeholder: "hacopUser123",
          typeOfIcon: const Icon(Icons.person),
          borderRadiusOf: 12,
          actualFocusNode: focusNode2,
          nextFocusNode: focusNode3,
          onChanged: (value) {
            setState(() {
              username = value;
            });
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.018),
        MessageFieldBox(
          title: "Contraseña",
          placeholder: "",
          typeOfIcon: const Icon(Icons.password),
          borderRadiusOf: 12,
          actualFocusNode: focusNode3,
          onChanged: (value) {
            setState(() {
              password = value;
            });
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        ElevatedButtonBox(
          onPressed: () {
            username.isEmpty || email.isEmpty || password.isEmpty
                ? showAlertAssistance(context,
                    title: "Campos vacíos",
                    content: "Por favor, llena todos los campos",
                    onPressedAccept: () => Navigator.pop(context),
                    colorAcceptButton: const Color(0xFF8AFF10),
                    onCancelButtonActive: false)
                : signUpUserController(
                        username: username, email: email, password: password)
                    .then((_) {
                    // showAlertAssistance(context,
                    //     title: "Registro completado",
                    //     content: "Por favor, inicia sesión para continuar.",
                    //     onPressedAccept: () => Navigator.pop(context),
                    //     colorAcceptButton: const Color(0xFF8AFF10),
                    //     onCancelButtonActive: false);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
                    }));
                  }).catchError((onError) {
                    showAlertAssistance(
                      context,
                      title: "Registro Fallido",
                      content:
                          "El email ya existe, por favor intente con otro correo.",
                      onCancelButtonActive: false,
                    );
                  });
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
          text: "Registarse",
          borderRadiusOf: 12,
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
    ));
  }
}
