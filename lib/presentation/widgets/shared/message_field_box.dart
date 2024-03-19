import 'package:flutter/material.dart';

class MessageFieldBox extends StatefulWidget {
  const MessageFieldBox({
    super.key,
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
    this.onChanged,
  });

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
  final ValueChanged<String>? onChanged;

  @override
  MessageFieldBoxState createState() => MessageFieldBoxState();
}

class MessageFieldBoxState extends State<MessageFieldBox> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focusNode = widget.actualFocusNode ?? FocusNode();
    final toAimNextfocusNode = widget.nextFocusNode ?? FocusNode();

    final inputDecoration = InputDecoration(
      hintText: widget.placeholder,
      hintStyle: TextStyle(
        color: widget.darkMode == true ? Colors.white : const Color(0xFF141414),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadiusOf ?? 30),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor:
          widget.darkMode == true ? const Color(0xFF141414) : Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      suffixIcon: IconButton(
        icon: widget.typeOfIcon ?? const Icon(Icons.error),
        color: widget.darkMode == true ? Colors.white : const Color(0xFF141414),
        onPressed: () {
          if (widget.isActiveButtonPressingIcon) {
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
            widget.title,
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
          horizontal: widget.horizontalPadding ??
              MediaQuery.of(context).size.width * 0.105,
          vertical: widget.verticalPadding ?? 0,
        ),
        child: TextFormField(
          onTapOutside: (event) {
            focusNode.unfocus();
          },
          style: TextStyle(
            color: widget.darkMode == true
                ? Colors.white
                : const Color(0xFF141414),
          ),
          focusNode: focusNode,
          controller: textController,
          decoration: inputDecoration,
          onFieldSubmitted: (value) {
            if (widget.isActiveDoneButton) {
              textController.clear();
              focusNode.requestFocus();
            } else {
              focusNode.unfocus();
              toAimNextfocusNode.requestFocus();
            }
          },
          onChanged: widget
              .onChanged,
        ),
      ),
    ]);
  }
}
