import 'package:flutter/material.dart';

class LobbyUserScreen extends StatelessWidget {
  const LobbyUserScreen({super.key});
  final String user = "Usuario";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("¡Hola, $user!"),
        backgroundColor: const Color(0xFF202020),
        leading: IconButton(
          icon: const Icon(Icons.menu), // Cambia este icono por el que desees
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: _LobbyUserView(),
    );
  }
}

class _LobbyUserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.275,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 176, 255, 91),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.8),
                            offset: const Offset(0, 5),
                            blurRadius: 3,
                          ),
                        ])),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.025,
                  left: MediaQuery.of(context).size.width * 0.07,
                  child: Text(
                    "Saldo global",
                    style: TextStyle(
                        color: const Color(0xFF171717),
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontWeight: FontWeight.w900,
                        shadows: [
                          Shadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(0, 3),
                              blurRadius: 3)
                        ]),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.095,
                  left: MediaQuery.of(context).size.width * 0.07,
                  child: Text(
                    "\$5000",
                    style: TextStyle(
                      color: const Color(0xFF171717),
                      fontSize: MediaQuery.of(context).size.width * 0.13,
                      fontWeight: FontWeight.w900,
                      shadows: [
                        Shadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(0, 5),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.22,
                  left: MediaQuery.of(context).size.width * 0.07,
                  child: Text(
                    "Mauricio Castillo",
                    style: TextStyle(
                        color: const Color(0xFF171717),
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.w400,
                        shadows: [
                          Shadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(0, 3),
                              blurRadius: 3)
                        ]),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.22,
                  right: MediaQuery.of(context).size.width * 0.07,
                  child: Text(
                    "Ver dinero",
                    style: TextStyle(
                        color: const Color(0xFF171717),
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.w900,
                        shadows: [
                          Shadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(0, 3),
                              blurRadius: 3)
                        ]),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.025,
                  right: MediaQuery.of(context).size.width * 0.07,
                  child: Text(
                    "HACOP",
                    style: TextStyle(
                        color: const Color(0xFF171717),
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontWeight: FontWeight.w900,
                        shadows: [
                          Shadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(0, 3),
                              blurRadius: 3)
                        ]),
                  ),
                ),
              ],
            )
// Utilizando el constructor de Color.fromRGBO con valores de rojo, verde, azul y opacidad
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const Text("Últimos movimientos"),
      ],
    );
  }
}
