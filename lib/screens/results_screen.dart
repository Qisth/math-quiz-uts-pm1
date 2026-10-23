import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/app_state_provider.dart';
import '../widgets/stat_list.dart';
import '../widgets/surface.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Ambil data dari provider
    final appState = context.watch<AppStateProvider>();
    final userName = appState.userName;
    final correctAnswers = appState.score; // Jumlah benar
    final totalQuestions = appState.totalQuestions; // Total soal
    final incorrectAnswers = totalQuestions - correctAnswers; // Jumlah salah
    final finalScore = correctAnswers * 4; // Rumus: jumlah benar x 4

    return Surface(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Judul Atas
          Text(
            'Hasil',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: screenWidth * 0.1,
            ),
          ),
          SizedBox(height: screenHeight * 0.05),

          // Teks Kustom Nama
          Text(
            'Begini nih statistik kuis $userName:',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: screenWidth * 0.05),
          ),

          // Grid 2x2 statistik
          StatList(
            correctAnswers: correctAnswers,
            incorrectAnswers: incorrectAnswers,
            score: finalScore,
          ),
          SizedBox(height: screenHeight * 0.04),

          // Tombol Kembali
          SizedBox(
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x99A9A9A9),
                    offset: Offset(0, 6),
                    blurRadius: 0,
                  ),
                ],
              ),
              child: FilledButton(
                onPressed: () {
                  context.go('/'); // Kembali ke Halaman Menu Utama
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(
                  'Kembali',
                  style: TextStyle(fontSize: screenWidth * 0.05),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
