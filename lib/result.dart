import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int hasilSkor;
  Result(this.hasilSkor);
  String get resultPharse{
    var resultText = 'You did It.';
    if (hasilSkor<= 8) {
      resultText='You are awesome and inconcent';
    } else if(hasilSkor <= 12){
       resultText = 'Pretty Likeable';
    } else if (hasilSkor <= 16) {
       resultText = 'you are ... Streng?';
    }
    else{
      resultText = 'you are suck mein.';
    }
    print(hasilSkor);
    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        resultPharse,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
