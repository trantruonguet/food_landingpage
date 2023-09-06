import 'package:flutter/material.dart';

class TimeDropdownButton extends StatefulWidget {
  const TimeDropdownButton({super.key});

  @override
  State<TimeDropdownButton> createState() => _TimeDropdownButtonState();
}

class _TimeDropdownButtonState extends State<TimeDropdownButton> {
  List<String> list = <String>[
    'Time',
    '10h30',
    "11h00",
    "11h30",
    "12h00",
    "12h30",
    "13h30",
    "14h00",
    "16h30",
    "17h00",
    "17h30",
    "18h00",
    "18h30",
    "19h00",
    "19h30",
    "20h00",
    "20h30",
    "21h00",
    "21h30",
    "22h00",
    "22h30",
    "23h00",
    "23h30",
  ];
  String dropdownValue = 'Time';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
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
        ),
      ),
    );
  }
}
