import 'package:eacallout/compononts/custom_btn.dart';
import 'package:eacallout/compononts/custom_dropdown.dart';
import 'package:eacallout/compononts/custom_textfeild.dart';
import 'package:eacallout/compononts/list_row.dart';
import 'package:eacallout/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

import '../model/data.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String callVal;
  List<Data> data = [];
  bool isHome = true;
  TextEditingController textEditingControllerTicker = TextEditingController();

  TextEditingController textEditingControllerStrike = TextEditingController();

  TextEditingController textEditingControllerExp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isHome ? buildHomeBody() : buildViewBody(),
      ),
    );
  }

  Container buildHomeBody() {
    return Container(
      padding: const EdgeInsets.all(kPadding),
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 8),
              margin: const EdgeInsets.only(bottom: 36),
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2)),
              child: const Text(
                "Callout Entry",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            CustomTextFeild(
              label: "Ticker",
              controller: textEditingControllerTicker,
            ),
            CustomDropDown(
              label: "Call/Put",
              onChage: (value) {
                
                callVal = value;
                print(callVal);
              },
            ),
            CustomTextFeild(
              label: "Strike",
              controller: textEditingControllerStrike,
            ),
            CustomTextFeild(
              label: "Expiration",
              controller: textEditingControllerExp,
              isEnable: false,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
                onTap: () {
                  if (textEditingControllerTicker.text.isNotEmpty &&
                      textEditingControllerStrike.text.isNotEmpty &&
                      textEditingControllerExp.text.isNotEmpty &&
                      callVal != null) {
                    data.add(Data(
                        ticker: textEditingControllerTicker.text,
                        call: callVal,
                        srike: textEditingControllerStrike.text,
                        expiration: textEditingControllerExp.text));
                   /* textEditingControllerExp.clear;
                    textEditingControllerStrike.clear();
                    textEditingControllerTicker.clear();
                    callVal=null;*/
                    setState(() {
                      isHome = false;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "Insert Data !",
                        style: TextStyle(color: Colors.red),
                      ),
                      duration: Duration(seconds: 2),
                    ));
                  }
                },
                label: "Submit"),
          ],
        ),
      ),
    );
  }

  Container buildViewBody() {
    return Container(
      padding: const EdgeInsets.all(kPadding),
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 8),
              margin: const EdgeInsets.only(bottom: 36),
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                image: const DecorationImage(image: AssetImage('assets/logo.jpg')),
                  border: Border.all(color: Colors.black, width: 2)),
              
            ),
            Container(
              alignment: Alignment.center,
              height: 45,
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2)),
              child: Text(
                  'Plays for ${DateTime.now().month.toString().padLeft(2, '0')}/ ${DateTime.now().day.toString().padLeft(2, '0')}/ ${DateTime.now().year.toString().padLeft(2, '0')}',
                  style: const TextStyle(fontSize: 18)),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: ((context, index) => ListRow(
                          ticker: data[index].ticker,
                          call: data[index].call,
                          srike: data[index].srike,
                          expiration: data[index].expiration,
                        )))),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
                onTap: () {
                  setState(() {
                    isHome = true;
                  });
                },
                label: 'Add Another'),
            CustomButton(
                onTap: () {
                  String text = '';
                  data.forEach((item) {
                    text +=
                        "\n${item.ticker} ${item.call} ${item.srike} ${item.expiration}";
                  });

                  share(text);
                },
                label: "Share"),
          ],
        ),
      ),
    );
  }

  Future<void> share(String text) async {
    await FlutterShare.share(
        title:
            'Plays for ${DateTime.now().month.toString().padLeft(2, '0')}/ ${DateTime.now().day.toString().padLeft(2, '0')}/ ${DateTime.now().year.toString().padLeft(2, '0')}',
        text: text,
        chooserTitle: 'Share');
  }
}
