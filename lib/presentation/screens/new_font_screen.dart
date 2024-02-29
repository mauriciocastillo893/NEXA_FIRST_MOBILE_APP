import 'package:flutter/material.dart';
import 'package:moviles_app/presentation/screens/last_movements_screen.dart';
import 'package:moviles_app/presentation/screens/my_money_screen.dart';
import 'package:moviles_app/presentation/widgets/shared/message_field_box.dart';

class NewFontScreen extends StatelessWidget {
  const NewFontScreen({super.key});

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
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: _NewFontView(),
    );
  }
}

class _NewFontView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Expanded(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text("SELECCIONA TU FUENTE",
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              const MessageFieldBox(placeholder: "Ingresa La Fuente"),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              const MessageFieldBox(placeholder: "Ingresa el Saldo"),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MyMoneyScreen();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF333333),
                  minimumSize: const Size(150, 45),
                ),
                child: Text("Continuar",
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
