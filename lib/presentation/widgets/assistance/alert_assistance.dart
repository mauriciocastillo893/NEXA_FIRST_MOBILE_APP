import 'package:flutter/material.dart';
import 'package:moviles_app/presentation/widgets/shared/elevated_button_box.dart';

void showAlertAssistance(
  BuildContext context, {
  bool darkMode = false,
  String title = "Título no disponible",
  Icon? titleIcon,
  String content = "Contenido no disponible",
  String titleAcceptButton = "OK",
  String titleCancelButton = "Cancelar",
  VoidCallback? onPressedAccept,
  VoidCallback? onPressedCancel,
  Color? colorAcceptButton,
  Color? colorCancelButton,
  Color? colorAcceptText,
  Color? colorCancelText,
  double? borderRadiusOfButton,
  // Añadir tiempo
}) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Row(
        children: [
          if (titleIcon != null) ...[
            titleIcon,
            const SizedBox(width: 8),
          ],
          Text(title),
        ],
      ),
      content: Text(content),
      actions: <Widget>[
        ElevatedButtonBox(
          defaultSize: true,
          onPressed: onPressedAccept ?? () => Navigator.pop(context),
          colorButton: colorAcceptButton,
          colorText: colorAcceptText,
          darkMode: darkMode,
          borderRadiusOf: borderRadiusOfButton ?? 30,
          text: titleAcceptButton,
        ),
        ElevatedButtonBox(
          defaultSize: true,
          onPressed: onPressedCancel ?? () => Navigator.pop(context),
          colorButton: colorCancelButton,
          colorText: colorCancelText,
          darkMode: darkMode,
          borderRadiusOf: borderRadiusOfButton ?? 30,
          text: titleCancelButton,
        ),
      ],
    ),
  );
}
