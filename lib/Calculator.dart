import 'dart:math';

class CalculatorBMI {
  CalculatorBMI({this.height, this.weight});

  final int height;
  final int weight;
  //const textstylee=TextStyle(color:Colors.red);
  final String normal = "Fit and Fine";

  double bmi;
  String BMIcal() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String remark() {
    if (bmi >= 24) {
      return "Overweight";
    } else if (bmi > 18) {
      return "Fit and Fine";
    } else {
      return "Underweight";
    }
  }

  String interpre() {
    if (bmi >= 24) {
      return "You have a lot weight.Exercise to save your future.";
    } else if (bmi > 18) {
      return "You have a normal body.Great job!!";
    } else {
      return "You are malnurished.Eat more";
    }
  }
}
