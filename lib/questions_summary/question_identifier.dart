import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  final bool isCorrectAnswer;
  final int questionIndex;
  const QuestionIdentifier(
      {super.key, required this.isCorrectAnswer, required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    int questionNumber = questionIndex + 1;
    return Container(
      alignment: Alignment.center,
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: isCorrectAnswer
            ? const Color.fromARGB(255, 53, 137, 127)
            : const Color.fromARGB(255, 190, 82, 129),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 22, 2, 56),
        ),
      ),
    );
  }
}
