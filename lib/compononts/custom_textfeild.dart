import 'package:flutter/material.dart';

import '../config.dart';

class CustomTextFeild extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  bool isEnable;
  CustomTextFeild(
      {Key key,
      @required this.label,
      this.isEnable = true,
      @required this.controller})
      : super(key: key);

  Future<void> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime(2101));
    if (picked != null) {
      controller.text =
          "${picked.month.toString().padLeft(2, '0')}/ ${picked.day.toString().padLeft(2, '0')}/ ${picked.year} ";
    }
  }

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
              child: isEnable
                  ? TextField(
                      controller: controller,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none))
                  : InkWell(
                      onTap: () {
                        selectDate(context);
                      },
                      child: TextField(
                          enabled: false,
                          style: const TextStyle(color: Colors.white),
                          controller: controller,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none)),
                    )),
        ],
      ),
    );
  }
}
