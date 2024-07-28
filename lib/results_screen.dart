import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/enums/enum.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends ConsumerWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Text("You Answered X out of Y questions correctly"),
            const SizedBox(
              height: 30,
            ),
            const QuestionsSummary(),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  ref.read(screenProvider.notifier).state = Screen.start;
                  ref.read(answeredListProvider.notifier).state = [];
                },
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    backgroundColor: const Color.fromARGB(255, 108, 3, 127)),
                child: const Text("Restart Quizz"))
          ],
        ),
      ),
    );
  }
}
