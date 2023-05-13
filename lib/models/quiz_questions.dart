class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> getShuffleAnswers() {
    final shuffledLst = List.of(answers);
    shuffledLst.shuffle();
    return shuffledLst;
  }
}
