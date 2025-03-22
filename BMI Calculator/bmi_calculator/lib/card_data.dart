import 'package:flutter/material.dart';
import 'constants.dart';

class cardData extends StatelessWidget {
  const cardData({this.cardIcon, this.cardText});
  final Icon? cardIcon;
  final String? cardText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cardIcon!,
        SizedBox(
          height: 20,
        ),
        Text(
          cardText!,
          style: labelStyle,
        )
      ],
    );
  }
}
