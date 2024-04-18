import 'package:flutter/material.dart';

class SelectFieldBox extends StatefulWidget {
  const SelectFieldBox({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SelectFieldBoxState();
  }
}

class _SelectFieldBoxState extends State<SelectFieldBox> {
  final List<String> _options = ["Nombre destino", "Monto", "Fecha", "Banco"];

  late String dropdownValue = _options.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down_outlined),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: _options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
