import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int questionIndex;
  final Function asnwerQuestion;
  Quiz(
      {@required this.question,
      @required this.asnwerQuestion,
      @required this.questionIndex});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(question[this.questionIndex]['pertanyaan']),
        ...(question[this.questionIndex]['answers'] as List<String>)
            .map((jawaban) {
          return Answer(jawaban, asnwerQuestion);
        }).toList(),
      ],
    );
  }
}
