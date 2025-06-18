import 'package:flutter/material.dart';
import 'package:quizzler_flutter/answer_button.dart';
import 'package:quizzler_flutter/question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  int _currentQuestion = 0;
  final List<Question> _questionsToAsk = questions;
  List<Widget> _scoreKeeper = [];

  void _goToNextQuestion() {
    if (_currentQuestion < _questionsToAsk.length - 1) {
      setState(() {
        _currentQuestion++;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestion = 0;
      _scoreKeeper = [];
    });
  }

  void _addScore(bool isCorrect) {
    setState(() {
      isCorrect
          ? _scoreKeeper.add(Icon(Icons.check, color: Colors.green))
          : _scoreKeeper.add(Icon(Icons.close, color: Colors.red));
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isQuizOver =
        _currentQuestion == _questionsToAsk.length - 1 &&
        _scoreKeeper.length >= _questionsToAsk.length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                !isQuizOver
                    ? _questionsToAsk[_currentQuestion].questionText
                    : 'Thank You. Try Again',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),

        if (isQuizOver) ...[
          AnswerButton(
            text: 'Restart',
            backgroundColor: Colors.blue,
            onPressed: _resetQuiz,
          ),
          SizedBox.shrink(),
        ] else ...[
          AnswerButton(
            text: 'True',
            backgroundColor: Colors.green,
            onPressed: () {
              _addScore(true == _questionsToAsk[_currentQuestion].answer);
              _goToNextQuestion();
            },
          ),
          AnswerButton(
            text: 'False',
            backgroundColor: Colors.red,
            onPressed: () {
              _addScore(false == _questionsToAsk[_currentQuestion].answer);
              _goToNextQuestion();
            },
          ),
        ],
        Row(children: _scoreKeeper),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
