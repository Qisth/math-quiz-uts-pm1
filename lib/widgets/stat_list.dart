import 'package:flutter/material.dart';

import 'stat_item.dart';

class StatList extends StatelessWidget {
  final int correctAnswers;
  final int incorrectAnswers;
  final int score;

  const StatList({
    super.key,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    final String grade;
    if (score == 100) {
      grade = 'A+';
    } else if (score >= 85) {
      grade = 'A';
    } else if (score >= 70) {
      grade = 'B';
    } else if (score >= 50) {
      grade = 'C';
    } else {
      grade = 'D';
    }

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 18,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.3,
      children: [
        StatItem(label: 'Nilai', value: '$score'),
        StatItem(label: 'Peringkat', value: grade),
        StatItem(label: 'Benar', value: '$correctAnswers'),
        StatItem(label: 'Salah', value: '$incorrectAnswers'),
      ],
    );
  }
}
