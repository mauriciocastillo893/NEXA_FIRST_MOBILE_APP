import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({
    Key? key,
    this.title = "Título no disponible",
    this.placeholder = "Escribe un mensaje",
    this.typeOfIcon,
    this.darkMode,
    this.horizontalPadding,
    this.verticalPadding,
    this.borderRadiusOf,
    this.isActiveButtonPressingIcon = false,
    this.isActiveDoneButton = false,
    this.actualFocusNode,
    this.nextFocusNode,
  }) : super(key: key);

  final String title;
  final String placeholder;
  final Icon? typeOfIcon;
  final bool? darkMode;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? borderRadiusOf;
  final bool isActiveButtonPressingIcon;
  final bool isActiveDoneButton;
  final FocusNode? actualFocusNode;
  final FocusNode? nextFocusNode;

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    //
    final focusNode = actualFocusNode ?? FocusNode();
    final toAimNextfocusNode = nextFocusNode ?? FocusNode();

    final inputDecoration = InputDecoration(
      hintText: placeholder,
      hintStyle: TextStyle(
        color: darkMode == true ? Colors.white : const Color(0xFF141414),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadiusOf ?? 30),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: darkMode == true ? const Color(0xFF141414) : Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      suffixIcon: IconButton(
        icon: typeOfIcon ?? const Icon(Icons.error),
        color: darkMode == true ? Colors.white : const Color(0xFF141414),
        onPressed: () {
          if (isActiveButtonPressingIcon) {
            textController.clear();
            focusNode.requestFocus();
          }
        },
      ),
    );

    return Column(children: [
      Row(children: [
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.11, bottom: 2),
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: MediaQuery.of(context).size.width * 0.0425,
            ),
          ),
        )
      ]),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 40,
          vertical: verticalPadding ?? 0,
        ),
        child: TextFormField(
          onTapOutside: (event) {
            focusNode.unfocus();
          },
          style: TextStyle(
            color: darkMode == true ? Colors.white : const Color(0xFF141414),
          ),
          focusNode: focusNode,
          controller: textController,
          decoration: inputDecoration,
          onFieldSubmitted: (value) {
            if (isActiveDoneButton) {
              textController.clear();
              focusNode.requestFocus();
            } else {
              focusNode.unfocus();
              toAimNextfocusNode.requestFocus();
            }
          },
        ),
      ),
    ]);
  }
}
