import 'package:flutter/material.dart';



class Splas extends StatelessWidget {
  const Splas({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            "assets/logo.jpg",
     
          ),
        ));
  }
}
