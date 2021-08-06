import 'package:flutter/material.dart';

class CategoryDropMenu extends StatefulWidget {
  @override
  _CategoryDropMenu createState() => new _CategoryDropMenu();
}

class _CategoryDropMenu extends State<CategoryDropMenu> {

  String dropdownValue = "Fleisch";

  @override
  Widget build(BuildContext context){
    return new DropdownButtonHideUnderline(child:
      new DropdownButton<String>(
        value: dropdownValue,
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['Fleisch'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
          );
        }).toList(),
      ));
  }

}