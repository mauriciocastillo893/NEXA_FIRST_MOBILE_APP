import 'package:flutter/material.dart';
import 'package:moviles_app/domain/entities/last_movement.dart';

// DARK MODE NEEDS TO BE HEREz
class LastMovementsBox extends StatelessWidget {
  const LastMovementsBox({
    super.key,
    required this.lastMovement,
    this.containerWidth,
    this.containerHeight,
    this.rightInnerPadding,
    this.leftInnerPadding,
  });
  final LastMovement lastMovement;
  final double? containerWidth;
  final double? containerHeight;
  final double? rightInnerPadding;
  final double? leftInnerPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: containerHeight ?? MediaQuery.of(context).size.height * 0.07,
        width: containerWidth ?? MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFF2F2F2F),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, 3),
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: leftInnerPadding ?? MediaQuery.of(context).size.width * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      lastMovement.fromWho,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: MediaQuery.of(context).size.width * 0.037,
                      ),
                    ),
                    Text(
                      lastMovement.transactionMade,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: MediaQuery.of(context).size.width * 0.037,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    right: rightInnerPadding ?? MediaQuery.of(context).size.width * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      lastMovement.bank,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: MediaQuery.of(context).size.width * 0.037,
                      ),
                    ),
                    Text(
                      lastMovement.operationType == OperationType.deposit
                          ? '+ \$${lastMovement.amount.toString()}'
                          : '- \$${lastMovement.amount.toString()}',
                      style: TextStyle(
                        color:
                            lastMovement.operationType == OperationType.deposit
                                ? const Color.fromARGB(255, 182, 255, 104)
                                : const Color.fromARGB(255, 255, 107, 107),
                        fontWeight: FontWeight.w900,
                        fontSize: MediaQuery.of(context).size.width * 0.037,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
