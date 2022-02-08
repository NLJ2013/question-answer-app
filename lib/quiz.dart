import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  final VoidCallback questionIteratorPoiner;
  final List<Map<String, Object>> questionAnswersMap;

  Quiz(
      this.questionIndex, this.questionAnswersMap, this.questionIteratorPoiner);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questionAnswersMap[questionIndex]['questionText'] as String),
        ...(questionAnswersMap[questionIndex]['options'] as List).map((answer) {
          return Answer(answer, questionIteratorPoiner);
        })
      ],
    );
  }
}
