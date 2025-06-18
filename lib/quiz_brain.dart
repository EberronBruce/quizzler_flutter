import 'package:quizzler_flutter/question.dart';

class QuizBrain {
  int _currentQuestion = 0;
  List<bool> _score = [];
  bool _gameOver = false;

  void goToNextQuestion() {
    if (_currentQuestion < _questionBank.length - 1) {
      _currentQuestion++;
    } else {
      _gameOver = true;
    }
  }

  bool gameOver() => _gameOver;

  void resetQuiz() {
    _currentQuestion = 0;
    _score = [];
    _gameOver = false;
  }

  int currentQuestion() {
    return _currentQuestion;
  }

  String questionText() {
    return _questionBank[_currentQuestion].questionText;
  }

  int questionBankLength() {
    return _questionBank.length;
  }

  bool questionAnswer() {
    return _questionBank[_currentQuestion].answer;
  }

  void addScore(bool isCorrect) {
    _score.add(isCorrect);
  }

  List<bool> score() {
    return _score;
  }

  final List<Question> _questionBank = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question(
      'The Great Wall of China is visible from the Moon with the naked eye.',
      false,
    ),
    Question('Honey never spoils.', true),
    Question('Humans share approximately 50% of their DNA with bananas.', true),
    Question(
      'A bolt of lightning is hotter than the surface of the sun.',
      true,
    ),
    Question('Goldfish only have a memory span of a few seconds.', false),
    Question(
      'There are more stars in the universe than grains of sand on all the beaches on Earth.',
      true,
    ),
    Question('The inventor of the Pringles can is now buried in one.', true),
    Question('Octopuses have three hearts.', true),
    Question(
      'Mount Everest is the tallest mountain in the world from base to peak.',
      false,
    ),
    Question('The capital of Australia is Sydney.', false),
    Question('Bats are blind.', false),
    Question('The shortest war in history lasted only 38 minutes.', true),
    Question('An ostrich\'s eye is bigger than its brain.', true),
    Question('Venus is the hottest planet in our solar system.', true),
    Question('The unicorn is the national animal of Scotland.', true),
    Question(
      'Humans can distinguish between over a trillion different smells.',
      true,
    ),
    Question(
      'The first McDonald\'s restaurant sold hot dogs, not hamburgers.',
      true,
    ),
    Question('Cleopatra was of Greek descent, not Egyptian.', true),
    Question('It is impossible to sneeze with your eyes open.', true),
    Question('The human body has more than 600 muscles.', true),
    Question('A "jiffy" is an actual unit of time.', true),
    Question('Coffee beans are actually the seeds of coffee cherries.', true),
    Question('Penguins can fly underwater.', true),
    Question(
      'There are more possible iterations of a game of chess than there are atoms in the known universe.',
      true,
    ),
    Question('The popsicle was invented by an 11-year-old by accident.', true),
    Question(
      'The loudest animal on Earth relative to its size is the pistol shrimp.',
      true,
    ),
    Question('The Sahara Desert is the largest desert in the world.', false),
    Question('The Mona Lisa has no eyebrows.', true),
    Question('A day on Venus is longer than a year on Venus.', true),
    Question('Humans use only 10% of their brains.', false),
  ];
}
