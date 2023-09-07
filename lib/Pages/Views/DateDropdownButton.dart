import 'package:flutter/material.dart';

class DateDropdownButton extends StatefulWidget {
  const DateDropdownButton({super.key});

  @override
  State<DateDropdownButton> createState() => _DateDropdownButtonState();
}

class _DateDropdownButtonState extends State<DateDropdownButton> {
  List<String> list = <String>['Today', 'Tomorrow'];
  String dropdownValue = 'Today';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: list.first,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
