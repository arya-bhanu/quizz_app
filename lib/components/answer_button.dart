import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String textQuestion;
  final void Function(String) handleClick;
  const AnswerButton(
      {super.key, required this.textQuestion, required this.handleClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          handleClick(textQuestion);
        },
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 97, 9, 112),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
        child: Text(
          textQuestion,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ));
  }
}
