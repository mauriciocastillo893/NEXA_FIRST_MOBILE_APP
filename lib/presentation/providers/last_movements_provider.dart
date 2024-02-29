import 'package:flutter/material.dart';
import 'package:moviles_app/domain/entities/last_movement.dart';

class LastMovementsProvider extends ChangeNotifier {
  List<LastMovement> lastMovements = [
    LastMovement(
        fromWho: 'Oxxo',
        amount: 10,
        bank: 'BBVA',
        operationType: OperationType.transfer,
        transactionMade: 'Ayer a las 10:28'),
            LastMovement(
        fromWho: 'Oxxo',
        amount: 10,
        bank: 'BBVA',
        operationType: OperationType.transfer,
        transactionMade: 'Ayer a las 10:29')
  ];
}
