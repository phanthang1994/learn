import 'package:flutter/cupertino.dart';
import 'package:untitled1/dive_dive/answer_button.dart';
import 'package:untitled1/dive_dive/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      // if(currentQuestionIndex>)
      currentQuestionIndex+=1;
    });
  }
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('The question...'),
          const SizedBox(height:30),
          ...currentQuestion.getShuffledAnswers().map((answer) {
            return AnswerButton(answerText: answer, onTap:
            ()
                {
                  answerQuestion(answer);
                }
            );
          })
        ],
      ),
    );
  }
}
