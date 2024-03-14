import 'package:flutter/material.dart';
import 'package:moviles_app/presentation/screens/main_screen.dart';
import 'package:moviles_app/presentation/widgets/assistance/alert_assistance.dart';

class AppBarBox extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBox({
    super.key,
    this.title,
    this.onPressed,
    this.deactiveLeadingIcon = false,
    this.rightIcon,
  });

  final String? title;
  final VoidCallback? onPressed;
  final bool deactiveLeadingIcon;
  final Icon? rightIcon;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? "Título no disponible"),
      backgroundColor: const Color(0xFF202020),
      leading: !deactiveLeadingIcon
          ? IconButton(
              icon: rightIcon ?? const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: onPressed ??
                  () {
                    Navigator.pop(context);
                  },
            )
          : null,
      automaticallyImplyLeading: !deactiveLeadingIcon,
      actions: [
        IconButton(
          onPressed: () => showAlertAssistance(
            context,
            title: "Cerrar sesión",
            content: "¿Estás seguro de que deseas cerrar sesión?",
            colorAcceptButton: Colors.transparent,
            colorCancelButton: Colors.transparent,
            darkMode: true,
            titleAcceptButton: "Continuar",
            titleIcon: const Icon(Icons.exit_to_app),
            onPressedAccept: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MainScreen())),
          ),
          icon: const Icon(Icons.exit_to_app),
        ),
      ],
    );
  }
}
