import 'package:flutter/material.dart';

import '../widgets/surface.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

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
          SizedBox(height: screenHeight * 0.03),
          Text(
            'Di dalam kuis ini terdapat 25 soal matematika. Jawaban benar bernilai 4, sedangkan jawaban salah bernilai 0. Kerjakan dengan sebaik mungkin ya!!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: screenWidth * 0.05),
          ),
          SizedBox(height: screenHeight * 0.03),
          TextField(
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
          SizedBox(height: screenHeight * 0.02),
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
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                ),
                child: Text(
                  'Mulai',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenWidth * 0.05),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
