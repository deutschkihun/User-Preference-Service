import 'package:flutter/material.dart';

class DefaultDropDown extends StatefulWidget {
  const DefaultDropDown({Key key, this.items}) : super(key: key);
  final List<String> items;

  @override
  State<DefaultDropDown> createState() => _DefaultDropDownState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _DefaultDropDownState extends State<DefaultDropDown> {
  String _chosenValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      focusColor: Colors.white,
      value: _chosenValue,
      //elevation: 5,
      style: TextStyle(color: Colors.white),
      iconEnabledColor: Colors.black,
      items: <String>[
        'Train',
        'BUS',
        'Flutter',
        'Node',
        'Java',
        'Python',
        'PHP',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: Colors.black),
          ),
        );
      }).toList(),
      hint: Text(
        "Please choose a transportation option",
        style: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
      ),
      onChanged: (String value) {
        setState(() {
          _chosenValue = value;
        });
      },
    );
  }
}
