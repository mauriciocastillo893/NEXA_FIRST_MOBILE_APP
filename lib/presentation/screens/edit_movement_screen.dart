import 'package:flutter/material.dart';
import 'package:moviles_app/domain/entities/last_movement.dart';
import 'package:moviles_app/presentation/providers/last_movements_provider.dart';
import 'package:moviles_app/presentation/screens/last_movements_screen.dart';
import 'package:moviles_app/presentation/widgets/shared/app_bar_box.dart';
import 'package:moviles_app/presentation/widgets/shared/message_field_box.dart';
import 'package:moviles_app/services/transaction_services/update_user_transaction_by_t_id.dart';
import 'package:provider/provider.dart';

class EditMovementScreen extends StatelessWidget {
  const EditMovementScreen({super.key, required this.idTransaction});

  final String idTransaction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => LastMovementsProvider(),
        child: EditMovementScreen2(idTransaction: idTransaction),
      ),
    );
  }
}

class EditMovementScreen2 extends StatefulWidget {
  const EditMovementScreen2({super.key, required this.idTransaction});

  final String idTransaction;

  @override
  State<StatefulWidget> createState() {
    return _EditMovementView();
  }
}

class _EditMovementView extends State<EditMovementScreen2> {
  String fromWho = "Usuario";
  String bank = "BBVA";
  double amount = 0.0;
  OperationType operationType = OperationType.deposit;

  late LastMovementsProvider lastMovementProvider;
  late String formattedDate;
  late String formattedTime;
  late String transactionMade;
  late final String idTransaction;

  @override
  void initState() {
    super.initState();
    final DateTime now = DateTime.now();
    formattedDate = "${now.day}/${now.month}/${now.year}";
    formattedTime = "${now.hour}:${now.minute}";
    transactionMade = "Hoy a las $formattedTime el $formattedDate";
    idTransaction = widget.idTransaction;
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    updateUserTransactionByTransactionIdController(
                      transactionId: idTransaction,
                      description: operationType == OperationType.deposit
                          ? "Ingreso"
                          : "Gasto",
                    );
                    lastMovementProvider.getDataTransactionByUserId();

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
