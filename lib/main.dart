import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Q1. Time after twilight and before night is ____.',
      'answers': [
        {'text': 'Evening', 'score': -2},
        {'text': 'Dawn', 'score': -2},
        {'text': 'Eclipse', 'score': -2},
        {'text': 'Dusk', 'score': 10},
      ],
    },
    {
      'questionText':
          'Q2. Choose the word opposite in meaning to the given word: LIABILITY',
      'answers': [
        {'text': 'Adhor', 'score': -2},
        {'text': 'Admire', 'score': 10},
        {'text': 'Concern', 'score': -2},
        {'text': 'Loathe', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q3. The intellectual can no longer be said to live ---- the margins of society. ',
      'answers': [
        {'text': 'inside', 'score': -2},
        {'text': 'against', 'score': -2},
        {'text': 'beyond', 'score': 10},
        {'text': 'before', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. First language means the ----- language.',
      'answers': [
        {'text': 'natural', 'score': 10},
        {'text': 'official', 'score': -2},
        {'text': 'main', 'score': -2},
        {'text': 'important', 'score': -2},
      ],
    },
    {
      'questionText': 'Q5. I wish today ----- Friday.',
      'answers': [
        {'text': 'is', 'score': -2},
        {'text': 'was', 'score': -2},
        {'text': 'were', 'score': 10},
        {'text': 'will', 'score': -2},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    //print(_questionIndex);
    if (_questionIndex < _questions.length) {
      //print('We have more questions!');
    } else {
      //print('There are no more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quick English Test'),
          backgroundColor: const Color.fromARGB(255, 231, 80, 10),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz),
        ),
      ),
    );
  }
}
