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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 400,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...summaries
                    .map((e) => [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        e['user_answer'] == e['correct_answer']
                                            ? Colors.green
                                            : Colors.red),
                                child: Text(
                                  (((e['index']) as int) + 1).toString(),
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e['question'],
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    Text(
                                      e['correct_answer'],
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 225, 161, 255),
                                          fontSize: 15),
                                    ),
                                    Text(
                                      e['user_answer'],
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 188, 104, 203),
                                          fontSize: 15),
                                    ),
                                    const SizedBox(height: 15),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ])
                    .expand((element) => element),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
