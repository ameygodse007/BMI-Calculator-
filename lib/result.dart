import 'package:flutter/material.dart';
import 'input_page.dart';
import 'Calculator.dart';

class Resultpage extends StatelessWidget {
  Resultpage({this.a, this.b, this.c});

  final String a;
  final String b;
  final String c;
  final String normal = "Fit and Fine";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Text("Your Result", style: boldness1))),
          Expanded(
              flex: 5,
              child: Reusable(
                colour: Color(0xff0E1010),
                colourcard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(b, style: b == normal ? resultTextstyle : overweight),
                    Text(a, style: BMIresult),
                    Text(c,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
