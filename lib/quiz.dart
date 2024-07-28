import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/enums/enum.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class QuizState extends ConsumerWidget {
  static const title = "Flutter Qwuiz";
  final Widget? widgetScreen;

  const QuizState({super.key, this.widgetScreen});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void switchScreen() {
      ref.read(screenProvider.notifier).state = Screen.questions;
    }

    Widget setWidgetScreen(Screen screen) {
      switch (screen) {
        case Screen.questions:
          return const QuestionsScreen();
        case Screen.result:
          return const ResultsScreen();
        default:
          return StartScreen(f: switchScreen);
      }
    }

    return MaterialApp(
        title: 'Flutter Quiz App',
        theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
        home: Scaffold(
          appBar: AppBar(title: const Text(title)),
          body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 155, 66, 170),
                Color.fromARGB(255, 94, 6, 109)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: setWidgetScreen(ref.watch(screenProvider))),
        ));
  }
}
