import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moviles_app/presentation/providers/last_movements_provider.dart';
import 'package:moviles_app/presentation/screens/add_last_movement_screen.dart';
import 'package:moviles_app/presentation/screens/edit_movement_screen.dart';
import 'package:moviles_app/presentation/screens/lobby_user_screen.dart';
import 'package:moviles_app/presentation/widgets/assistance/alert_assistance.dart';
import 'package:moviles_app/presentation/widgets/shared/app_bar_box.dart';
import 'package:moviles_app/presentation/widgets/shared/elevated_button_box.dart';
import 'package:moviles_app/presentation/widgets/shared/last_movements_box.dart';
import 'package:moviles_app/presentation/widgets/shared/message_field_box.dart';
import 'package:moviles_app/services/transaction_services/delete_user_transaction_by_t_id.dart';
import 'package:provider/provider.dart';

class LastMovementsScreen extends StatelessWidget {
  const LastMovementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarBox(
          title: "",
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const LobbyUserScreen();
            }));
          },
        ),
        body: ChangeNotifierProvider(
          create: (context) =>
              LastMovementsProvider()..getDataTransactionByUserId(),
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
          title: "Buscar movimiento por",
          placeholder: "Buscar",
          typeOfIcon: Icon(Icons.search_sharp),
          // horizontalPadding: 20,
          borderRadiusOf: 12,
        ),
        // const SelectFieldBox(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        SizedBox(
          height: lastMovementProvider.lastMovements.isEmpty
              ? MediaQuery.of(context).size.height * 0.05
              : min(
                  MediaQuery.of(context).size.height *
                      0.9 *
                      lastMovementProvider.lastMovements.length,
                  MediaQuery.of(context).size.height * 0.5),
          child: lastMovementProvider.lastMovements.isEmpty
              ? const Center(
                  child: Text(
                    "No se encontraron movimientos",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : ListView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: lastMovementProvider.lastMovements.length,

                  itemBuilder: (context, item) {
                    final message = lastMovementProvider.lastMovements[item];
                    List<Widget> elements = [
                      LastMovementsBox(
                        lastMovement: message,
                        // rightInnerPadding:
                        //     MediaQuery.of(context).size.width * 0,
                        // leftInnerPadding:
                        //     MediaQuery.of(context).size.width * 0.06,
                        editIcon: true,
                        onPressedEdit: () => {
                          // print("Edit ${message.idTransaction}")
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EditMovementScreen(
                              idTransaction: message.idTransaction ?? "",
                            );
                          }))
                        },
                        deleteIcon: true,
                        onPressedDelete: () async {
                          // print("Delete ${message.idTransaction}");
                          await deleteUserTransactionByTransactionIdController(
                              transactionId: message.idTransaction ?? "");
                          lastMovementProvider.getDataTransactionByUserId();
                          showAlertAssistance(context,
                              title: "Transacción eliminada",
                              content:
                                  "La transacción ha sido eliminada correctamente",
                              titleAcceptButton: "Aceptar");
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015),
                    ];
                    return Column(children: elements);
                  },
                ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        ElevatedButtonBox(
          borderRadiusOf: 12,
          text: "Agregar movimiento",
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AddLastMovementScreen();
            }));
          },
        )
      ],
    );
  }
}
