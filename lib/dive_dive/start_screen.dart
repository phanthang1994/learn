import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
    const StartScreen(this.startQuiz,{super.key});
    final void Function() startQuiz;
    @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          Image.asset('assets/images/quiz-logo.png'),
          const SizedBox(height: 30),
          const Text('Learn Flutter fun way!'),
          OutlinedButton.icon(
              icon: const Icon(Icons.arrow_right_alt),
              onPressed: startQuiz ,
              // onPressed: (){
              //   startQuiz();
              // },
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white
              ),
              label: const Text('Start Quiz'))
        ],
      );
    }
  }
