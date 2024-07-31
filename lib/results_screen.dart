import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/data/data.dart';
import 'package:quiz_app/enums/enum.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends ConsumerWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<int> countCorrectAnswer() {
      final questionCount = questions.length;
      var correctCounter = 0;
      ref.watch(answeredListProvider).asMap().entries.forEach((e) {
        int index = e.key;
        String val = e.value;
        if (val == questions[index].answers[0]) {
          correctCounter++;
        }
      });
      return [questionCount, correctCounter];
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'You Answered ${countCorrectAnswer()[1]} out of ${countCorrectAnswer()[0]} questions correctly',
              style: const TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const Expanded(
              flex: 4,
              child: QuestionsSummary(),
            ),
            const Spacer(
              flex: 1,
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
