import 'package:flutter/material.dart';
import 'package:quizzler_flutter/answer_button.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

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
  // List<Widget> _scoreKeeper = [];
  //
  // void _addScore(bool isCorrect) {
  //   setState(() {
  //     isCorrect
  //         ? _scoreKeeper.add(Icon(Icons.check, color: Colors.green))
  //         : _scoreKeeper.add(Icon(Icons.close, color: Colors.red));
  //   });
  // }

  void _checkAnswer(bool userAnswer) {
    quizBrain.addScore(userAnswer == quizBrain.questionAnswer());
    setState(() {
      quizBrain.goToNextQuestion();
    });
  }

  void _handleQuizReset() {
    setState(() {
      quizBrain.resetQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Derive _scoreKeeper from quizBrain.score()
    List<Widget> currentScoreKeeper = quizBrain.score().map((isCorrect) {
      return isCorrect
          ? Icon(Icons.check, color: Colors.green)
          : Icon(Icons.close, color: Colors.red);
    }).toList();

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
                !quizBrain.gameOver()
                    ? quizBrain.questionText()
                    : 'Thank You. Try Again',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),

        if (quizBrain.gameOver()) ...[
          AnswerButton(
            text: 'Restart',
            backgroundColor: Colors.blue,
            onPressed: _handleQuizReset,
          ),
          SizedBox.shrink(),
        ] else ...[
          AnswerButton(
            text: 'True',
            backgroundColor: Colors.green,
            onPressed: () {
              _checkAnswer(true);
            },
          ),
          AnswerButton(
            text: 'False',
            backgroundColor: Colors.red,
            onPressed: () {
              _checkAnswer(false);
            },
          ),
        ],
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 4.0,
            runSpacing: 4.0,
            alignment: WrapAlignment.start,
            children: currentScoreKeeper,
          ),
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
