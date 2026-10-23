import 'package:flutter/material.dart';

import '../models/question.dart';
import 'answer_button.dart';

class AnswerList extends StatelessWidget {
  final Question question;
  final num? selectedAnswer;
  final bool hasAnswered;
  final Function(num) onSelectAnswer;

  const AnswerList({
    super.key,
    required this.question,
    required this.selectedAnswer,
    required this.hasAnswered,
    required this.onSelectAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: question.options.map((option) {
        final isSelected = selectedAnswer == option;
        final isCorrect = option == question.correctAnswer;

        return AnswerButton(
          option: option,
          isSelected: isSelected,
          isCorrect: isCorrect,
          hasAnswered: hasAnswered,
          onTap: () => onSelectAnswer(option),
        );
      }).toList(),
    );
  }
}
