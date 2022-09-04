import 'package:flutter/cupertino.dart';

class Data {
  final String ticker;
  final String call;
  final String srike;
  final String expiration;

  const Data(
      {@required this.ticker,
      @required this.call,
      @required this.srike,
      @required this.expiration});
}
