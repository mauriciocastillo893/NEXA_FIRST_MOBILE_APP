import 'package:flutter/material.dart';

class ElevatedButtonBox extends StatelessWidget {
  const ElevatedButtonBox({
    super.key,
    this.text = "Botón",
    this.fontSizeText,
    this.darkMode,
    this.borderRadiusOf = 30,
    this.colorText,
    this.colorButton,
    this.minimumSizeButton,
    this.defaultSize = false,
    required this.onPressed,
  });

  final String text;
  final double? fontSizeText;
  final VoidCallback onPressed;
  final bool? darkMode;
  final double borderRadiusOf;
  final Color? colorText;
  final Color? colorButton;
  final Size? minimumSizeButton;
  final bool defaultSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorButton ??
            (darkMode == true ? const Color(0xFF141414) : Colors.white),
        shadowColor: Colors.transparent,
        minimumSize:
            defaultSize ? null : (minimumSizeButton ?? const Size(150, 45)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              borderRadiusOf), // Ajusta el valor de redondeo aquí
        ),
      ),
      child: Text(text,
          style: TextStyle(
            fontSize: fontSizeText ?? MediaQuery.of(context).size.width * 0.04,
            color: colorText ??
                (darkMode == true ? Colors.white : const Color(0xFF141414)),
          )),
    );
  }
}
