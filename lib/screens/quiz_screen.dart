import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../data/questions.dart';
import '../providers/app_state_provider.dart';
import '../widgets/answer_list.dart';
import '../widgets/surface.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _correctAnswersCount = 0;
  num? _selectedAnswer;
  bool _hasAnswered = false;

  void _handleAnswer(num answer) {
    setState(() {
      _selectedAnswer = answer;
      _hasAnswered = true;

      if (answer == questionsList[_currentQuestionIndex].correctAnswer) {
        _correctAnswersCount++;
      }
    });

    // Beri delay biar bisa lihat jawaban benar/salah
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (!mounted) return;

      if (_currentQuestionIndex < questionsList.length - 1) {
        setState(() {
          _currentQuestionIndex++;
          _selectedAnswer = null;
          _hasAnswered = false;
        });
      } else {
        // Simpan jumlah benar & total soal ke AppStateProvider
        context.read<AppStateProvider>().setQuizResult(
          score: _correctAnswersCount,
          totalQuestions: questionsList.length,
        );
        context.go('/results');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final currentQuestion = questionsList[_currentQuestionIndex];

    return Surface(
      child: Column(
        children: [
          Text(
            'Soal ${_currentQuestionIndex + 1}/${questionsList.length}',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: screenWidth * 0.1,
            ),
          ),
          SizedBox(height: screenHeight * 0.04),
          Text(
            currentQuestion.text,
            style: TextStyle(fontSize: screenWidth * 0.12),
          ),
          SizedBox(height: screenHeight * 0.05),
          AnswerList(
            question: currentQuestion,
            selectedAnswer: _selectedAnswer,
            hasAnswered: _hasAnswered,
            onSelectAnswer: _handleAnswer,
          ),
        ],
      ),
    );
  }
}
