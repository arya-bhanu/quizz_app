import 'package:flutter/material.dart';
import 'package:quiz_app/enums/enum.dart';
import 'package:quiz_app/quiz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final screenProvider = StateProvider<Screen>((ref) {
  return Screen.start;
});

final answeredListProvider = StateProvider<List<String>>((ref) {
  return [];
});

void main() {
  runApp(const ProviderScope(child: QuizState()));
}
