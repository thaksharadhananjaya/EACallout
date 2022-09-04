import 'package:eacallout/model/data.dart';
import 'package:flutter/material.dart';

import '../config.dart';

class ListRow extends StatelessWidget {
  final String ticker;
  final String call;
  final String srike;
  final String expiration;

  const ListRow({Key key, this.ticker, this.call, this.srike, this.expiration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      height: 45,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildItem(ticker),
          buildItem(call),
          buildItem(srike),
          buildItem(expiration),
        ],
      ),
    );
  }

  Container buildItem(String label) {
    return Container(
          width: 100,
          
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: primeryColor,
              border: Border.all(
                  color: const Color.fromARGB(255, 49, 31, 148), width: 3),
              borderRadius: BorderRadius.circular(12)),
          child: Text(label),
        );
  }
}
