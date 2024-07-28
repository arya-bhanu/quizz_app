class QuizQuestion {
  final String question;
  final List<String> answers;
  const QuizQuestion(this.question, this.answers);

  List<String> shuffeledAnswers() {
    final answers = List.of(this.answers);
    answers.shuffle();
    return List.of(answers);
  }
}
