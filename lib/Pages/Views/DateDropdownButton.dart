import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDropdownButton extends StatefulWidget {
  const DateDropdownButton({super.key});

  @override
  State<DateDropdownButton> createState() => _DateDropdownButtonState();
}

class _DateDropdownButtonState extends State<DateDropdownButton> {
  List<String> list = <String>[];
  String dropdownValue = 'Today';

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    final formatDate = DateFormat('EEEE');
    final formatDateResult = DateFormat('yyyy/MM/dd');
    if (formatDate.format(today) != 'Sunday') {
      list.add("Today");
    }
    DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
    if (formatDate.format(tomorrow) != 'Sunday') {
      list.add("Tomorrow");
    }
    DateTime date2 = DateTime(now.year, now.month, now.day + 2);
    if (formatDate.format(date2) != 'Sunday') {
      list.add(formatDateResult.format(date2).toString());
    }
    DateTime date3 = DateTime(now.year, now.month, now.day + 3);
    if (formatDate.format(date3) != 'Sunday') {
      list.add(formatDateResult.format(date3).toString());
    }
    DateTime date4 = DateTime(now.year, now.month, now.day + 4);
    if (formatDate.format(date4) != 'Sunday') {
      list.add(formatDateResult.format(date4).toString());
    }
    DateTime date5 = DateTime(now.year, now.month, now.day + 5);
    if (formatDate.format(date5) != 'Sunday') {
      list.add(formatDateResult.format(date5).toString());
    }
    DateTime date6 = DateTime(now.year, now.month, now.day + 6);
    if (formatDate.format(date6) != 'Sunday') {
      list.add(formatDateResult.format(date6).toString());
    }
    setState(() {
      list = list;
    });
  }

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
          isExpanded: true,
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
