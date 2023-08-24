class QuizQuestion {
  final List<String> answersList;

  final String questionText;

  const QuizQuestion(this.questionText, this.answersList);

  List<String> getShuffledAnswers() {
    final shuffledAnswers = List.of(answersList);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
