import 'package:flutter/material.dart';

class AppBarBox extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const AppBarBox({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: const Color(0xFF202020),
      leading: IconButton(
        icon: const Icon(Icons.menu), // Cambia este icono por el que desees
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person),
        ),
      ],
    );
  }
}
