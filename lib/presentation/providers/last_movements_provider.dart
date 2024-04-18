import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moviles_app/domain/entities/last_movement.dart';
import 'package:moviles_app/services/transaction_services/create_user_transaction.dart';
import 'package:moviles_app/services/transaction_services/get_transaction_by_user_id.dart';

class LastMovementsProvider extends ChangeNotifier {
  List<LastMovement> lastMovements = [];

  void getDataTransactionByUserId() async {
    lastMovements.clear();
    final dataList = await getTransactionByUserIdController();
    for (var jsonString in dataList) {
      lastMovements.add(LastMovement(
        idTransaction: jsonString['_id'] ?? "0",
        fromWho: jsonString['fromWho'] ?? "Usuario",
        transactionMade: jsonString['transactionMade'] ?? "Hoy",
        bank: jsonString['bank'] ?? "BBVA",
        amount: (jsonString['amount'] ?? 0).toDouble(),
        operationType: jsonString['description'] == 'Ingreso'
            ? OperationType.deposit
            : OperationType.withdrawal,
      ));
    }
    notifyListeners();
  }

  void createLastMovement(LastMovement lastMovement) async {
    final createPreResult = LastMovement(
        fromWho: lastMovement.fromWho,
        amount: lastMovement.amount,
        bank: lastMovement.bank,
        operationType: lastMovement.operationType,
        transactionMade: lastMovement.transactionMade);
    await createUserTransactionController(
      amount: createPreResult.amount,
      description: createPreResult.operationType == OperationType.deposit
          ? "deposit"
          : "withdrawal",
      categoryId: "65f8c4683d920b7d254eb5f9",
      tddId: "65f8c4683d920b7d254eb5f9",
    );
    notifyListeners();
    getDataTransactionByUserId();
  }
}
