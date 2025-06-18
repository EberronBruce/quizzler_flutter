class Question {
  final String questionText;
  final bool answer;

  const Question(this.questionText, this.answer);
}

final List<Question> questions = [
  Question('You can lead a cow down stairs but not up stairs.', false),
  Question('Approximately one quarter of human bones are in the feet.', true),
  Question('A slug\'s blood is green.', true),
];
