import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  const CustomText(this.text, {this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
