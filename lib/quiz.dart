import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';

  List<String> selectedAnswersList = [];

  void selectedAnswers(String answers) {
    selectedAnswersList.add(answers);

    if (selectedAnswersList.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswersList = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      currentScreen = QuestionsScreen(
        onSelectAnswer: selectedAnswers,
      );
    }

    if (activeScreen == 'result-screen') {
      currentScreen = ResultScreen(
        onRestart: restartQuiz,
        choosenAnswers: selectedAnswersList,
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 21, 11, 162),
          title: const Text("Quiz App"),
        ),
        body: currentScreen,
      ),
    );
  }
}
