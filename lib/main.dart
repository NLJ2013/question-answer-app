import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final _questionAnswers = const [
    {
      'questionText': 'what do you prefer out of these fruits ?',
      'options': ['apple', 'orange', 'grapes', 'pineapple']
    },
    {
      'questionText': 'what do you prefer  out of these cars?',
      'options': ['Benz', 'BMW', 'Lamborghini', 'Audi']
    },
    {
      'questionText': 'what do you prefer out of these countries ?',
      'options': ['USA', 'UK', 'France', 'Germany', 'Australia']
    }
  ];

  void setCurrentQuestionIndex() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Question Answer App'),
        ),
        body: _questionIndex < _questionAnswers.length
            ? Column(
                children: [
                  Question(_questionAnswers[_questionIndex]['questionText']
                      as String),
                  ...(_questionAnswers[_questionIndex]['options'] as List)
                      .map((answer) {
                    return Answer(answer, setCurrentQuestionIndex);
                  })
                ],
              )
            : Center(
                child: Text('all qustions are completed'),
              ),
      ),
    );
  }
}
