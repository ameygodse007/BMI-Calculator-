import 'package:flutter/material.dart';
import './input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff32373D),
        scaffoldBackgroundColor: Color(0xff32373D),
        accentColor: Color(0xff0FA0F3),
        textTheme: TextTheme(
          body1: TextStyle(color: Color(0xffFDFDFD)),
        ),
      ),
      home: InputPage(),
    );
  }
}
