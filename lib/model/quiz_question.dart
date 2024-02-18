class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final listShuffled = List.of(answers);
    listShuffled.shuffle();
    return listShuffled;
  }
}
