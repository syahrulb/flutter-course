import 'package:flutter/material.dart';

void main() => runApp(MyApps());

class MyApps extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppsState();
  }
}

class MyAppsState extends State<MyApps> {
  var questionIndex = 0;
  void answerQuestion() {
    setState(() {
      questionIndex = this.questionIndex + 1;
    });
    print(this.questionIndex);
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
            Text(pertanyaanKita[this.questionIndex]),
            RaisedButton(
              child: Text(listjawaban[0]),
              onPressed: this.answerQuestion,
            ),
            RaisedButton(
              child: Text(listjawaban[1]),
              onPressed: this.answerQuestion,
            ),
            RaisedButton(
              child: Text(listjawaban[2]),
              onPressed: this.answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
