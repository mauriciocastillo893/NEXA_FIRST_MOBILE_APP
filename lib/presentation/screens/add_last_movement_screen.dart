import 'package:flutter/material.dart';
import 'package:moviles_app/domain/entities/last_movement.dart';
import 'package:moviles_app/presentation/providers/last_movements_provider.dart';
import 'package:moviles_app/presentation/screens/last_movements_screen.dart';
import 'package:moviles_app/presentation/widgets/shared/app_bar_box.dart';
import 'package:moviles_app/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class AddLastMovementScreen extends StatelessWidget {
  const AddLastMovementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => LastMovementsProvider(),
        child: const AddLastMovementScreen2(),
      ),
    );
  }
}

class AddLastMovementScreen2 extends StatefulWidget {
  const AddLastMovementScreen2({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddLastMovementView();
  }
}

class _AddLastMovementView extends State<AddLastMovementScreen2> {
  String fromWho = "Usuario";
  String bank = "BBVA";
  double amount = 0.0;
  OperationType operationType = OperationType.deposit;

  late LastMovementsProvider lastMovementProvider;
  late String formattedDate;
  late String formattedTime;
  late String transactionMade;

  @override
  void initState() {
    super.initState();
    final DateTime now = DateTime.now();
    formattedDate = "${now.day}/${now.month}/${now.year}";
    formattedTime = "${now.hour}:${now.minute}";
    transactionMade = "Hoy a las $formattedTime el $formattedDate";
  }

  @override
  Widget build(BuildContext context) {
    final lastMovementProvider = context.watch<LastMovementsProvider>();

    return Scaffold(
      appBar: const AppBarBox(
        title: "",
      ),
      body: SingleChildScrollView(
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              MessageFieldBox(
                  title: "Gasto o Ingreso",
                  placeholder: "Gasto (default)",
                  typeOfIcon: const Icon(Icons.mode_standby_outlined),
                  onChanged: (value) => value == "Gasto"
                      ? operationType = OperationType.withdrawal
                      : operationType = OperationType.deposit),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              MessageFieldBox(
                  placeholder: "BBVA (default)",
                  title: "Banco",
                  typeOfIcon: const Icon(Icons.account_balance_outlined),
                  onChanged: (value) => bank = value),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              MessageFieldBox(
                title: "Monto",
                placeholder: "\$0.0",
                typeOfIcon: const Icon(Icons.monetization_on_outlined),
                onChanged: (value) {
                  try {
                    amount = double.parse(value);
                  } catch (e) {
                    // Manejar la excepción aquí
                    print("Error al convertir el valor a double: $e");
                  }
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              // const MessageFieldBox(
              //   title: "Ingresa a la sección",
              //   placeholder: "Ninguna",
              //   typeOfIcon: Icon(Icons.select_all_sharp),
              // ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    lastMovementProvider.createLastMovement(LastMovement(
                        fromWho: fromWho,
                        transactionMade: transactionMade,
                        bank: bank,
                        amount: amount,
                        operationType: operationType));
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
      )),
    );
  }
}
