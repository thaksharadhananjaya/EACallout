import 'package:flutter/material.dart';

import '../config.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String label;
  const CustomButton({Key key, @required this.onTap, @required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        child: Container(
            height: 50,
            width: 160,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: primeryColor,
                border: Border.all(
                    color: const Color.fromARGB(255, 49, 31, 148), width: 3),
                borderRadius: BorderRadius.circular(12)),
            child: Text(
              label,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            )),
      ),
    );
  }
}
