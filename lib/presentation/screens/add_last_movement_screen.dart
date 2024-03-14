import 'package:flutter/material.dart';
import 'package:moviles_app/presentation/screens/last_movements_screen.dart';
import 'package:moviles_app/presentation/widgets/shared/app_bar_box.dart';
import 'package:moviles_app/presentation/widgets/shared/message_field_box.dart';

class AddLastMovementScreen extends StatelessWidget {
  const AddLastMovementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBox(
        title: "",
      ),
      body: _AddLastMovementView(),
    );
  }
}

class _AddLastMovementView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text("INGRESA EL NUEVO REGISTRO",
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
            const MessageFieldBox(placeholder: "Gasto o Ingreso"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            const MessageFieldBox(placeholder: "Lugar/persona"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            const MessageFieldBox(placeholder: "Fecha"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            const MessageFieldBox(placeholder: "Hora"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            const MessageFieldBox(placeholder: "Monto"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            const MessageFieldBox(placeholder: "Ingresa a la sección"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            const MessageFieldBox(placeholder: "Seleccione la Tarjeta"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LastMovementsScreen();
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
    ));
  }
}
