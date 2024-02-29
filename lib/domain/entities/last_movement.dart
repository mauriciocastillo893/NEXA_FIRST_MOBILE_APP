enum OperationType {
  deposit,
  withdrawal,
  transfer,
}

class LastMovement {
  final String fromWho;
  final String transactionMade;
  final String bank;
  final double amount;
  final OperationType operationType;

  LastMovement({
    required this.fromWho,
    required this.transactionMade,
    required this.bank,
    required this.amount,
    required this.operationType,
  });
}

