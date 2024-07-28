import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/data/data.dart';
import 'package:quiz_app/main.dart';

class QuestionsSummary extends ConsumerWidget {
  const QuestionsSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Map<String, dynamic>> summaries =
        ref.watch(answeredListProvider).asMap().entries.map((e) {
      int index = e.key;
      String val = e.value;
      return {
        "index": index,
        "question": questions[index].question,
        "correct_answer": questions[index].answers[0],
        "user_answer": val
      };
    }).toList();

    return Column(
      children: summaries
          .map((e) => Row(
                children: [Text((((e['index']) as int) + 1).toString())],
              ))
          .toList(),
    );
  }
}
