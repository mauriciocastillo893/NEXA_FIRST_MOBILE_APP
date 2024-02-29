import 'package:flutter/material.dart';
import 'package:moviles_app/presentation/screens/add_last_movement_screen.dart';
import 'package:moviles_app/presentation/screens/lobby_user_screen.dart';
import 'package:moviles_app/presentation/widgets/shared/last_movements_box.dart';
import 'package:moviles_app/presentation/widgets/shared/message_field_box.dart';

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
      body: _LastMovementsView(),
    );
  }
}

class _LastMovementsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                const LastMovementsBox(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0125),
                const LastMovementsBox(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0125),
                const LastMovementsBox(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0125),
                const LastMovementsBox(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0125),
                const LastMovementsBox(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0125),
                const LastMovementsBox(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0125),
                const LastMovementsBox(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0125),
                const LastMovementsBox(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0125),
                const LastMovementsBox(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0125),
                const LastMovementsBox(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0125),
                const LastMovementsBox(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0125),
                const LastMovementsBox(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0125),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
