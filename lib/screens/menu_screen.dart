import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/app_state_provider.dart';
import '../widgets/surface.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // Controller untuk membaca input nama
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _startQuiz() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan nama dulu ya!!')),
      );
      return;
    }
    context.read<AppStateProvider>().setUserName(name);
    context.go('/quiz');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Surface(
      child: Column(
        children: [
          Text(
            'Math Quiz',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: screenWidth * 0.1,
            ),
          ),
          SizedBox(height: screenHeight * 0.06),
          Text(
            'Di dalam kuis ini terdapat 25 soal matematika. Jawaban benar bernilai 4, sedangkan jawaban salah bernilai 0. Kerjakan dengan sebaik mungkin ya!!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: screenWidth * 0.05),
          ),
          SizedBox(height: screenHeight * 0.053),
          TextField(
            controller: _nameController,
            style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05),
            decoration: InputDecoration(
              hintText: 'Masukkan nama di sini',
              hintStyle: TextStyle(color: Colors.grey[500]),
              filled: true,
              fillColor: Color(0xFF284885),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xFF142A64), width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xff6495ed), width: 2.0),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
          SizedBox(
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x99A9A9A9),
                    offset: Offset(0, 6),
                    blurRadius: 0,
                  ),
                ],
              ),
              child: FilledButton(
                onPressed: _startQuiz,
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
                  'Mulai',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
