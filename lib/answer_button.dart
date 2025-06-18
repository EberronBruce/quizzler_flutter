import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const AnswerButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: backgroundColor,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
