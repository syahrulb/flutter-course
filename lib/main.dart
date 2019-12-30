import 'package:flutter/material.dart';
import './question.dart';

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
      'pertanyaan 1',
      'pertanyaan 2',
    ];
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
        body: Column(
          children: [
            Question(pertanyaanKita[this._questionIndex]),
            RaisedButton(
              child: Text(listjawaban[0]),
              onPressed: this._answerQuestion,
            ),
            RaisedButton(
              child: Text(listjawaban[1]),
              onPressed: this._answerQuestion,
            ),
            RaisedButton(
              child: Text(listjawaban[2]),
              onPressed: this._answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
