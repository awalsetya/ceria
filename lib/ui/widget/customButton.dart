import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  CustomButton(this.text, {this.color, this.textColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Text(
        "$text",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: textColor, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
