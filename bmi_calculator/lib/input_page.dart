import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'enum.dart';
import 'results_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedCard;
  int height = 180;
  int weight = 65;
  int age = 25;

  double _bmi = 0.0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFCEE9B6),
          title: Text(
            "BMI CALCULATOR",
            style: TextStyle(
                color: Color(0xFF145A22),
                fontSize: 26,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: Column(children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCard = Gender.male;
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.mars,
                            color: Color(0xFFFFFEDC),
                            size: 94,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "MALE",
                            style: TextStyle(
                                color: Color(0xFFFFFEDC),
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selectedCard == Gender.male
                              ? Color(0xFFA7A46C)
                              : Color(0xFF2D8D79)),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCard = Gender.female;
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.venus,
                            color: Color(0xFFFFFEDC),
                            size: 94,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "FEMALE",
                            style: TextStyle(
                                color: Color(0xFFFFFEDC),
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selectedCard == Gender.female
                              ? Color(0xFFA7A46C)
                              : Color(0xFF2D8D79)),
                    ),
                  ),
                )
              ],
            ),
          ),
          //second row
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          "HEIGHT",
                          style: TextStyle(
                              color: Color(0xFFFFFEDC),
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: TextStyle(
                                  color: Color(0xFFFFFEDC),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 65),
                            ),
                            Text(
                              "cm",
                              style: TextStyle(
                                  color: Color(0xFFFFFEDC), fontSize: 21),
                            ),
                          ],
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 250.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                          inactiveColor: Colors.white,
                          activeColor: Color(0xFFA7A46C),
                        )
                      ],
                    ),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF2D8D79)),
                  ),
                ),
              ],
            ),
          ),
          //third row
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: TextStyle(
                              color: Color(0xFFFFFEDC),
                              fontWeight: FontWeight.w700,
                              fontSize: 24),
                        ),
                        Text(weight.toString(),
                            style: TextStyle(
                                color: Color(0xFFFFFEDC),
                                fontWeight: FontWeight.w600,
                                fontSize: 55)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFFFFEDC),
                                radius: 30,
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFFFFEDC),
                                radius: 30,
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF2D8D79)),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: TextStyle(
                              color: Color(0xFFFFFEDC),
                              fontWeight: FontWeight.w700,
                              fontSize: 24),
                        ),
                        Text(age.toString(),
                            style: TextStyle(
                                color: Color(0xFFFFFEDC),
                                fontWeight: FontWeight.w600,
                                fontSize: 55)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFFFFEDC),
                                radius: 30,
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFFFFEDC),
                                radius: 30,
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF2D8D79)),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calculateBMI(),
                    resultText: getResult(),
                    interpretation: getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              color: Color(0xFF5E9387),
              height: 70,
              width: double.infinity,
              child: Center(
                  child: Text(
                "CALCULATE YOUR BMI",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 26,
                    color: Color(0xFFFFFFFF)),
              )),
            ),
          )
        ]));
  }
}
