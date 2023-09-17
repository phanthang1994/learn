import 'package:flutter/material.dart';
import 'package:untitled1/dive_dive/data/questions.dart';
import 'package:untitled1/dive_dive/questions_screen.dart';
import 'package:untitled1/dive_dive/results_screen.dart';
import 'package:untitled1/dive_dive/start_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // Widget ? activeScreen;
  // @override
  // void initState() {
  //   activeScreen = StartScreen(swithScreen);
  //   super.initState();
  // }
  // void swithScreen()
  // {
  //   setState(() {
  //     activeScreen = QuestionScreen();
  //   });
  // }
  var activeScreen = 'start-screen';
  List<String> selectedAnswer = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void choseAnswer(String answer){
    selectedAnswer.add(answer);
    if(selectedAnswer.length==questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }
  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'questions-screen';
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget =  QuestionScreen(onSelectAnswer: choseAnswer);
    }
    if(activeScreen=='result-screen') {
      screenWidget = ResultScreen(
          choseAnswer: selectedAnswer,
          onRestart:restartQuiz
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors:  [
                    Colors.deepPurple,
                    Colors.indigo,
                  ],
                )
            ),
            // child: activeScreen
            child: screenWidget
        ),
      ),
    );
  }
}
