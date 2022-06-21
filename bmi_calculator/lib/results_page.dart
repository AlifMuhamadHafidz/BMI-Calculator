import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {required this.interpretation,
      required this.bmiResult,
      required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
              color: primaryColor, fontSize: 26, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              "YOUR RESULT",
              style: TextStyle(
                  color: Color(0xFF23593D),
                  fontWeight: FontWeight.w700,
                  fontSize: 32),
            ),
          )),
          Expanded(
            flex: 5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF2D8D79)),
                    width: 338,
                    height: 302,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          resultText.toUpperCase(),
                          style: TextStyle(
                              color: Color(0xFFC8EE2F),
                              fontSize: 32,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          bmiResult,
                          style: TextStyle(
                              color: Color(0xFFFFFEDC),
                              fontSize: 32,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          interpretation,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Color(0xFF5E9387),
              height: 70,
              width: double.infinity,
              child: Center(
                  child: Text(
                "RE-CALCULATE YOUR BMI",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 26,
                    color: Color(0xFFFFFFFF)),
              )),
            ),
          )
        ],
      ),
    );
  }
}
