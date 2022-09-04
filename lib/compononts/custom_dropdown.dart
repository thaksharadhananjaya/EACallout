import 'package:flutter/material.dart';

import '../config.dart';

// ignore: must_be_immutable
class CustomDropDown extends StatelessWidget {
  final String label;
  ValueChanged<String> onChage;
  CustomDropDown({Key key, @required this.label, @required this.onChage})
      : super(key: key);

  String val;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Container(
              height: 50,
              width: 160,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: primeryColor,
                  border: Border.all(
                      color: const Color.fromARGB(255, 49, 31, 148), width: 3),
                  borderRadius: BorderRadius.circular(12)),
              child: DropdownButtonFormField(
                value: val,
                onChanged: (String newValue) {
                  val = newValue;
                  onChage(val);
                },
                dropdownColor: Colors.blue,
                items: <String>['Call', 'Put', 'Straddle', 'Strangle', 'Strap']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  
                    hintText: "Select",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none),
              )),
        ],
      ),
    );
  }
}
