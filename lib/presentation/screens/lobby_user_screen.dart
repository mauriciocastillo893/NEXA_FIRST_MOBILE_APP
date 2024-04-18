import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moviles_app/presentation/providers/last_movements_provider.dart';
import 'package:moviles_app/presentation/screens/last_movements_screen.dart';
import 'package:moviles_app/presentation/screens/my_money_screen.dart';
import 'package:moviles_app/presentation/widgets/shared/app_bar_box.dart';
import 'package:moviles_app/presentation/widgets/shared/last_movements_box.dart';
import 'package:provider/provider.dart';

class LobbyUserScreen extends StatelessWidget {
  const LobbyUserScreen({super.key});
  final String user = "Usuario";

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) =>
                  LastMovementsProvider()..getDataTransactionByUserId())
        ],
        child: Scaffold(
          appBar: AppBarBox(
            title: " ¡Hola, $user!",
            deactiveLeadingIcon: true,
          ),
          body: _LobbyUserView(),
        ));
  }
}

class _LobbyUserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lastMovementProvider = context.watch<LastMovementsProvider>();

    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 176, 255, 91),
                        // color: const Color(0xFF8AFF10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.8),
                            offset: const Offset(0, 9),
                            blurRadius: 5,
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
                  top: MediaQuery.of(context).size.height * 0.08,
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
                  top: MediaQuery.of(context).size.height * 0.2,
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
                  top: MediaQuery.of(context).size.height * 0.185,
                  right: MediaQuery.of(context).size.width * 0.07,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyMoneyScreen()));
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    child: Text(
                      "Ver dinero",
                      style: TextStyle(
                        shadows: [
                          Shadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(0, 3),
                              blurRadius: 3)
                        ],
                      ),
                    ),
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
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width *
                      0.055), // Agrega el relleno deseado aquí
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LastMovementsScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF202020),
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  shadowColor: Colors.transparent,
                ),
                child: Text(
                  "Últimos movimientos",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(0, 3),
                          blurRadius: 5,
                        ),
                      ]),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          // height: MediaQuery.of(context).size.height * 0.3,
          height: lastMovementProvider.lastMovements.isEmpty
              ? MediaQuery.of(context).size.height * 0.07
              : min(
                  MediaQuery.of(context).size.height *
                      0.085 *
                      min(4, lastMovementProvider.lastMovements.length),
                  MediaQuery.of(context).size.height * 0.25),
          child: lastMovementProvider.lastMovements.isEmpty
              ? const Center(
                  child: Text(
                    "No se encontraron movimientos",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : ListView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: min(4, lastMovementProvider.lastMovements.length),
                  itemBuilder: (context, item) {
                    final message = lastMovementProvider.lastMovements[item];
                    List<Widget> elements = [
                      LastMovementsBox(
                        lastMovement: message,
                        containerWidth: MediaQuery.of(context).size.width * 1,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015),
                    ];
                    return Column(children: elements);
                  },
                ),
        ),
        // Otros widgets aquí

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width *
                      0.055), // Agrega el relleno deseado aquí
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF202020),
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  shadowColor: Colors.transparent,
                ),
                child: Text(
                  "Presupuestos",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(0, 3),
                          blurRadius: 5,
                        ),
                      ]),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Column(
          children: [
            // const LastMovementsBox(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            // const LastMovementsBox(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            // const LastMovementsBox(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            // const LastMovementsBox(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
      ],
    ));
  }
}
