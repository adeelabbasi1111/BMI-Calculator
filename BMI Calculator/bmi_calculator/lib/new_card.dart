import 'package:flutter/material.dart';

class newCard extends StatelessWidget {
  newCard({required this.cardColor, this.cardChild, this.onTap});
  final Color cardColor;
  final Widget? cardChild;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: cardChild,
        margin: EdgeInsets.all(15),
      ),
    );
  }
}
