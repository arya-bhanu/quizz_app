import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/components/answer_button.dart';
import 'package:quiz_app/data/data.dart';
import 'package:quiz_app/enums/enum.dart';
import 'package:quiz_app/main.dart';

class QuestionsScreen extends ConsumerStatefulWidget {
  const QuestionsScreen({super.key});

  @override
  ConsumerState<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends ConsumerState<QuestionsScreen> {
  var question = 0;

  @override
  Widget build(BuildContext context) {
    void handleClick(String answered) {
      if (question < questions.length) {
        ref.read(answeredListProvider.notifier).state.add(answered);
        if (question == questions.length - 1) {
          ref.read(screenProvider.notifier).state = Screen.result;
          return;
        }
        setState(() {
          question++;
        });
      }
    }

    final List<Widget> answersButton = questions[question]
        .shuffeledAnswers()
        .map((e) => AnswerButton(textQuestion: e, handleClick: handleClick))
        .toList();

    List<Widget> mapWithSpacer(List<Widget> widgets) {
      return widgets
          .map((widget) => [
                widget,
                const SizedBox(
                  height: 10,
                )
              ])
          .expand((element) => element)
          .toList()
          .sublist(0, widgets.length * 2 - 1);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Questions",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            Expanded(
                child: Center(
                    child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  questions[question].question,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ...mapWithSpacer(answersButton)
              ],
            )))
          ],
        ),
      ),
    );
  }
}
