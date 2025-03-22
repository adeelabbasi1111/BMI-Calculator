import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_data.dart';
import 'new_card.dart';
import 'constants.dart';
import 'calculator.dart';

enum Gender { male, female, inactive }

void main() => runApp(BMI_Calculator());

class BMI_Calculator extends StatelessWidget {
  const BMI_Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Color(0xFF090f32),
          appBarTheme: AppBarTheme(color: Color(0xFF101639))),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.inactive;
  double height = 100;
  int weight = 60;
  int age = 20;

  Map get data => {
        "height": height, // ✅ Comma use karo
        "weight": weight,
        "age": age,
        "gender": selectedGender,
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI Calculator")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: newCard(
                    cardColor: selectedGender == Gender.male
                        ? CardColorActive
                        : CardColorInactive,
                    cardChild: cardData(
                      cardIcon: Icon(
                        FontAwesomeIcons.mars,
                        size: iconSize,
                      ),
                      cardText: "Male",
                    ),
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: newCard(
                    cardColor: selectedGender == Gender.female
                        ? CardColorActive
                        : CardColorInactive,
                    cardChild: cardData(
                      cardIcon: Icon(
                        FontAwesomeIcons.venus,
                        size: iconSize,
                      ),
                      cardText: "Female",
                    ),
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: newCard(
              cardColor: CardColorActive,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: labelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${height / 2.54 ~/ 12}.${(height / 2.54 % 12).round()}",
                        style: labelStlyleHeavy,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "ft",
                        style: labelStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.blue,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      inactiveTrackColor: Colors.grey[700],
                      activeTrackColor: Colors.blue,
                    ),
                    child: Slider(
                        value: height,
                        min: 100.0,
                        max: 213.36,
                        onChanged: (double new_height) {
                          setState(() {
                            height = new_height;
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: newCard(
                    cardColor: CardColorActive,
                    cardChild: Column(
                      children: [
                        Text(
                          "WEIGHT",
                          style: labelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: labelStlyleHeavy,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                operation: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              operation: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: newCard(
                    cardColor: CardColorActive,
                    cardChild: Column(
                      children: [
                        Text(
                          "AGE",
                          style: labelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: labelStlyleHeavy,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                operation: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              operation: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculator calc = Calculator(data: data);
              calc.printer();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmi: calc.bmi(),
                            result: calc.result(),
                            interpretation: calc.interpretation(),
                          )));
            },
            child: Container(
              color: Colors.blue,
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 50),
              height: 100,
              child: Center(
                  child: Text(
                "CALCULATE",
                style: labelStyle,
              )),
            ),
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.operation});

  final IconData icon;
  final VoidCallback operation;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: operation,
      child: Icon(icon),
      fillColor: Colors.grey[800],
      shape: CircleBorder(),
      constraints: BoxConstraints().tighten(width: 56.0, height: 56.0),
    );
  }
}
