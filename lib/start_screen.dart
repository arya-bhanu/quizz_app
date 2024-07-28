import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function() f;
  const StartScreen({super.key, required this.f});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          Image.asset(
            "assets/img/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 30),
          const Text(
            "Learn Flutter the fun way",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: f,
            label: const Text("Start Quiz"),
            icon: const Icon(
              Icons.arrow_right_outlined,
            ),
          )
        ]);
  }
}
