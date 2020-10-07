import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './result.dart';
import './Calculator.dart';

const buttonColor = Color(0xff1D1E33);
const inactivecolor = Color(0xff111328);
const boldness = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
  textBaseline: TextBaseline.alphabetic,
);
const BMIresult = TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold);
const resultTextstyle = TextStyle(
    color: Color(0xff24D876), fontWeight: FontWeight.bold, fontSize: 22.0);
const overweight =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0, color: Colors.red);
const boldness1 =
    TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white);
Color malecardcolor = inactivecolor;
Color femalecardColor = inactivecolor;
enum gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  gender selectgender;
  int height = 180;
  int weight = 50;
  int age = 20;
  void incementWeight() {
    weight++;
  }

  void decrementWeight() {
    weight--;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          '              BMI CALCULATOR',
          textAlign: TextAlign.center,
        )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectgender = gender.male;
                        });
                      },
                      child: Reusable(
                        colour: selectgender == gender.male
                            ? buttonColor
                            : malecardcolor,
                        colourcard:
                            Iconset(icon: FontAwesomeIcons.mars, label: "MALE"),
                      )),
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectgender = gender.female;
                        });
                      },
                      child: Reusable(
                        colour: selectgender == gender.female
                            ? buttonColor
                            : femalecardColor,
                        colourcard: Iconset(
                            icon: FontAwesomeIcons.venus, label: "FEMALE"),
                      )),
                ),
              ],
            )),
            Expanded(
                child: Reusable(
              colour: inactivecolor,
              colourcard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Height",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: boldness),
                      Text("cm",
                          style: TextStyle(
                            fontSize: 18.0,
                          ))
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      overlayColor: Color(0x29DADADA),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      activeColor: Color(0xff0FA0F3),
                      inactiveColor: Color(0xffDADADA),
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            )),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Reusable(
                  colour: inactivecolor,
                  colourcard: Column(
                    children: <Widget>[
                      Text(
                        "Weight",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(weight.toString(), style: boldness),
                          Text(
                            "kg",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          rounderButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                          SizedBox(width: 10.0),
                          rounderButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: Reusable(
                  colour: inactivecolor,
                  colourcard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Age",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      Text(age.toString(), style: boldness),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          rounderButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          SizedBox(width: 10.0),
                          rounderButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            )),
            GestureDetector(
              onTap: () {
                CalculatorBMI cal =
                    CalculatorBMI(height: height, weight: weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Resultpage(
                            a: cal.BMIcal(),
                            b: cal.remark(),
                            c: cal.interpre())));
              },
              child: Container(
                child: Center(
                  child: Text("Calculate", style: boldness1),
                ),
                //margin: EdgeInsets.all(10.0),

                width: double.infinity,
                height: 80.0,
                color: Color(0xff0FA0F3),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10.0),
                // )
              ),
            ),
          ],
        ));
  }
}

class Iconset extends StatelessWidget {
  Iconset({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: Color(0xff0FA0F3),
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 20.0,
          ),
        )
      ],
    );
  }
}

class Reusable extends StatelessWidget {
  Reusable({this.colour, this.colourcard});
  final Color colour;
  final Widget colourcard;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: colourcard,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

class rounderButton extends StatelessWidget {
  rounderButton({this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(width: 50.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xff4C4F5E),
    );
  }
}
