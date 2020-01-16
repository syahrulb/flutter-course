import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApps());

class MyApps extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppsState();
  }
}

class _MyAppsState extends State<MyApps> {
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex = this._questionIndex + 1;
    });
    print(this._questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var pertanyaanKita = [
      {"pertanyaan":'pertanyaan 1', 'answers':['A','B','C']},
      {"pertanyaan":'pertanyaan 2', 'answers': ['A'] },
      {"pertanyaan":'pertanyaan 3', 'answers': ['C'] },
    ];
    List<String> listjawaban = ['A','B','C','D',];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('my first apps'),
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
          children: [
            Question(pertanyaanKita[this._questionIndex]['pertanyaan']),
            ...listjawaban.map((title) => Answer(title,_answerQuestion)).toList(),
          ],
        ),
      ),
    );
  }
}
