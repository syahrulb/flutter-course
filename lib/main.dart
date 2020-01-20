import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApps());

class MyApps extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppsState();
  }
}

class _MyAppsState extends State<MyApps> {
  final _pertanyaanKita = const [
    {
      "pertanyaan": 'pertanyaan 1',
      'answers': [
        {'text': 'A', 'score': 10},
        {'text': 'B', 'score': 20},
        {'text': 'C', 'score': 10},
        {'text': 'D', 'score': 40},
      ]
    },
    {
      "pertanyaan": 'pertanyaan 2',
      'answers': [
        {'text': 'A', 'score': 30},
        {'text': 'B', 'score': 20},
        {'text': 'C', 'score': 50},
        {'text': 'D', 'score': 40},
      ]
    },
    {
      "pertanyaan": 'pertanyaan 3',
      'answers': [
        {'text': 'A', 'score': 20},
        {'text': 'B', 'score': 10},
        {'text': 'C', 'score': 80},
        {'text': 'D', 'score': 90},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _answerQuestion(int score) {
    this._totalScore += score;
    setState(() {
      _questionIndex = this._questionIndex + 1;
    });
    print(this._questionIndex);
    if (_questionIndex < _pertanyaanKita.length) {
      print('we have more question');
    }
  }

  @override
  Widget build(BuildContext context) {
    // pertanyaanKita =[]; ini tidak bisa dilakukan ketika sebuah variable dijadikan const
    var dummy = ["hollo"];
    dummy.add('max');
    print(dummy);
    List<String> listjawaban = [
      'A',
      'B',
      'C',
      'D',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('my first apps'),
          backgroundColor: Colors.redAccent,
        ),
        body: _questionIndex < _pertanyaanKita.length
            ? Quiz(
                asnwerQuestion: _answerQuestion,
                question: _pertanyaanKita,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore),
      ),
    );
  }
}
