import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox(
      {super.key,
      this.placeholder = "Escribe un mensaje",
      this.typeOfIcon,
      this.darkMode,
      this.horizontalPadding,
      this.verticalPadding});
  final String placeholder;
  final Icon? typeOfIcon;
  final bool? darkMode;
  final double? horizontalPadding;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final inputDecoration = InputDecoration(
      hintText: placeholder,
      hintStyle: TextStyle(
        color: darkMode == true ? Colors.white : const Color(0xFF141414),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: darkMode == true ? const Color(0xFF141414) : Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      suffixIcon: IconButton(
        icon: typeOfIcon ?? const Icon(Icons.send),
        color: darkMode == true ? Colors.white : const Color(0xFF141414),
        onPressed: () {
          textController.clear();
          focusNode.requestFocus();
        },
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 40,
          vertical: verticalPadding ?? 0,  
        ),
      child: TextFormField(
        // onTapOutside: (event) {
        //   focusNode.unfocus();
        // },
        focusNode: focusNode,
        controller: textController,
        decoration: inputDecoration,
        onFieldSubmitted: (value) {
          textController.clear();
          focusNode.requestFocus();
        },
      ),
    );
  }
}
