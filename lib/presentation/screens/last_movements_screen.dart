import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moviles_app/presentation/providers/last_movements_provider.dart';
import 'package:moviles_app/presentation/screens/add_last_movement_screen.dart';
import 'package:moviles_app/presentation/screens/lobby_user_screen.dart';
import 'package:moviles_app/presentation/widgets/shared/last_movements_box.dart';
import 'package:moviles_app/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class LastMovementsScreen extends StatelessWidget {
  const LastMovementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: const Text("Últimos Movimientos"),
          backgroundColor: const Color(0xFF202020),
          leading: IconButton(
              icon: const Icon(Icons
                  .arrow_back_ios_new_rounded), // Cambia este icono por el que desees
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LobbyUserScreen();
                }));
              }),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ],
        ),
        body: ChangeNotifierProvider(
          create: (context) => LastMovementsProvider(),
          child: _LastMovementsView(),
        ));
  }
}

class _LastMovementsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lastMovementProvider = context.watch<LastMovementsProvider>();

    return Column(
      children: [
        Text("ÚLTIMOS \nMOVIMIENTOS",
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.15,
              color: const Color(0xFF8AFF10),
              fontWeight: FontWeight.w900,
              fontSize: MediaQuery.of(context).size.width * 0.08,
            )),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        const MessageFieldBox(
          placeholder: "Buscar",
          typeOfIcon: Icon(Icons.search_sharp),
          horizontalPadding: 20,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        SizedBox(
          // height: MediaQuery.of(context).size.height * 0.3,
          height: lastMovementProvider.lastMovements.isEmpty
              ? MediaQuery.of(context).size.height * 0.05
              : min(
                  MediaQuery.of(context).size.height *
                      0.075 *
                      lastMovementProvider.lastMovements.length,
                  MediaQuery.of(context).size.height * 0.3),
          child: lastMovementProvider.lastMovements.isEmpty
              ? const Center(
                  child: Text(
                    "No se encontraron movimientos",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: lastMovementProvider.lastMovements.length,
                  itemBuilder: (context, item) {
                    final message = lastMovementProvider.lastMovements[item];
                    List<Widget> elements = [
                      LastMovementsBox(lastMovement: message),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015),
                    ];
                    return Column(children: elements);
                  },
                ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.005),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AddLastMovementScreen();
            }));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFFDFD),
            minimumSize: const Size(150, 45),
          ),
          child: Text("Agregar Movimiento",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04)),
        ),
      ],
    );
  }
}
