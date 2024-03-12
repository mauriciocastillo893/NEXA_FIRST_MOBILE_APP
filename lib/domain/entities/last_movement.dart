enum OperationType {
  deposit, // + sign. Because it's a deposit of money into the account
  withdrawal, // - sign. Because it's a withdrawal of money from the account
  transfer, // - sign. Because it's a transfer of money from one account to another
}

class LastMovement {
  final String fromWho;
  final String transactionMade;
  final String bank;
  final double amount;
  final OperationType operationType;
  // final DateTime date;

  LastMovement({
    required this.fromWho,
    required this.transactionMade,
    required this.bank,
    required this.amount,
    required this.operationType,
    // required this.date,
  });
}
