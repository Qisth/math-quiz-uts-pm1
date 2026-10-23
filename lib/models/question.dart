class Question {
  final String text;
  final num correctAnswer;
  final num difference;
  late final List<num> options;

  Question({
    required this.text,
    required this.correctAnswer,
    required this.difference,
  }) {
    // Acak posisi pilihan jawaban sekali saat soal dibuat
    options = [
      correctAnswer,
      correctAnswer - difference,
      correctAnswer + difference,
      correctAnswer + (2 * difference),
    ]..shuffle();
  }
}
