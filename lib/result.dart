import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int hasilSkor;
  final Function resetHandler;
  Result(this.hasilSkor, this.resetHandler);
  String get resultPharse {
    var resultText = 'You did It.';
    if (hasilSkor >= 100) {
      resultText = 'You are awesome and inconcent';
    } else if (hasilSkor >= 70) {
      resultText = 'Pretty Likeable';
    } else if (hasilSkor >= 45) {
      resultText = 'you are ... Streng?';
    } else {
      resultText = 'you are suck mein.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              resultPharse,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          FlatButton(
            child: Text('Restart Quiz!'),
            textColor: Colors.blue,
            onPressed: resetHandler,
            color: Colors.redAccent,
          )
        ],
      ),
    );
  }
}
