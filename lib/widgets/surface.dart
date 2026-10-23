import 'package:flutter/material.dart';

class Surface extends StatelessWidget {
  final Widget child;
  const Surface({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff6495ed),
      body: Center(
        child: Container(
          width: screenWidth * 0.8,
          height: screenHeight * 0.64,
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color(0xff87cefa),
            boxShadow: [
              BoxShadow(color: Color(0x9987cefa), offset: Offset(0, 10)),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
