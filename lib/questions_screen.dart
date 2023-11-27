import 'package:flutter/material.dart';
import 'package:quiz_app_dart/answer_button.dart';
import 'data/questions.dart';
import 'package:google_fonts/google_fonts.dart';



class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer,});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();

  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestions = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
    child: Container(
      margin: const EdgeInsets.all(40),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
        currentQuestions.text,
        style: GoogleFonts.ptSans(
          color: const Color.fromARGB(165, 221, 214, 225),
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
            textAlign: TextAlign.center,
      ),
      const SizedBox(height: 20),
          ...currentQuestions.getShuffledAnswers().map((answer)
    {
      return AnswerButton(
          answerText: answer,
          onTap: () {
            answerQuestion(answer);
          }
    );
  })
  ],
  ),
  ),
  );
  }
}