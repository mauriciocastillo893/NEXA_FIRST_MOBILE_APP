import 'package:flutter/material.dart';
import 'package:moviles_app/presentation/screens/edit_font_screen.dart';
import 'package:moviles_app/presentation/screens/new_font_screen.dart';
import 'package:moviles_app/services/user_services/get_data_user_by_user_id.dart';

class MyMoneyScreen extends StatelessWidget {
  const MyMoneyScreen({super.key});

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
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              getDataUserByUserIdController();
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: _MyMoneyView(),
    );
  }
}

class _MyMoneyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        // Eliminar este Expanded
        child: Expanded(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text("MI DINERO",
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.15,
                  color: const Color(0xFF8AFF10),
                  fontWeight: FontWeight.w900,
                  fontSize: MediaQuery.of(context).size.width * 0.08,
                )),
          ),
          Column(
            children: [
              const Text("FUENTES"),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const NewFontScreen();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF333333),
                  minimumSize: const Size(150, 45),
                ),
                child: Text("Agregar",
                    style: TextStyle(
                        color: const Color(0xFFFFFDFD),
                        fontSize: MediaQuery.of(context).size.width * 0.04)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const EditFontScreen();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF333333),
                  minimumSize: const Size(150, 45),
                ),
                child: Text("Editar",
                    style: TextStyle(
                        color: const Color(0xFFFFFDFD),
                        fontSize: MediaQuery.of(context).size.width * 0.04)),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
