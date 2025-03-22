import 'package:flutter/material.dart';
import 'constants.dart';
import 'new_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmi, required this.result, required this.interpretation});
  final String bmi;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    MaterialColor label_color = Colors.green;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Center(
              child: Text(
                "Your Results",
                style: labelStlyleHeavy,
              ),
            ),
          )),
          Expanded(
            flex: 5,
            child: newCard(
              cardColor: CardColorActive,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    result,
                    style: TextStyle(
                        fontSize: 30.0,
                        color: label_color,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    bmi,
                    style:
                        TextStyle(fontSize: 100, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    interpretation,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 50),
              color: Colors.blue,
              width: double.infinity,
              height: 100,
              child: Center(
                  child: Text(
                "RE CALCULATE",
                style: labelStyle,
              )),
            ),
          )
        ],
      ),
    );
  }
}
