import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/dive_dive/data/questions.dart';
import 'package:untitled1/dive_dive/questions_summary.dart';
class ResultScreen extends StatelessWidget {
  final List<String> choseAnswer;
  const ResultScreen({ super.key,
    required this.choseAnswer,
    required this.onRestart,
  });

  final void Function() onRestart;

  List<Map<String,Object>> getSummaryData()
  {
    if (kDebugMode) {
      print('length list');
      print(choseAnswer.length);
    }
    final List<Map<String, Object>> summary = [];
    for(var i=0;i<choseAnswer.length;i++)
      {
        summary.add(
            {'question index': i,
              'question': questions[i].text,
              'correct answer': questions[i].answers[0],
              'user answer' : choseAnswer[i]
            }
        );
      }
    if (kDebugMode) {
      print('summary list');
      print(summary.length);
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( 'You answered $numCorrectQuestions out of'
                ' $numTotalQuestions questions correctly!',),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: onRestart,
              child: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
