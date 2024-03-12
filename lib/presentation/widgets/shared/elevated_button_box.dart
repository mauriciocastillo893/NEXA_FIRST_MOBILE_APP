import 'package:flutter/material.dart';

class ElevatedButtonBox extends StatelessWidget {
  const ElevatedButtonBox({
    super.key,
    this.text = "Botón",
    this.darkMode,
    this.borderRadiusOf = 30,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;
  final bool? darkMode;
  final double borderRadiusOf;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            darkMode == true ? const Color(0xFF141414) : Colors.white,
        minimumSize: const Size(150, 45),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(borderRadiusOf), // Ajusta el valor de redondeo aquí
        ),
      ),
      child: Text(text,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.04,
            color: darkMode == true ? Colors.white : const Color(0xFF141414),
          )),
    );
  }
}
