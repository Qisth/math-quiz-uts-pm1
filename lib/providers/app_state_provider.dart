import 'package:flutter/material.dart';

class AppStateProvider extends ChangeNotifier {
  String _userName = '';
  int _score = 0;
  int _totalQuestions = 0;

  String get userName => _userName;
  int get score => _score;
  int get totalQuestions => _totalQuestions;

  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  void setQuizResult({required int score, required int totalQuestions}) {
    _score = score;
    _totalQuestions = totalQuestions;
    notifyListeners();
  }
}