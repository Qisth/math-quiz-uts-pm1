import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final num option;
  final bool isSelected;
  final bool isCorrect;
  final bool hasAnswered;
  final VoidCallback onTap;

  const AnswerButton({
    super.key,
    required this.option,
    required this.isSelected,
    required this.isCorrect,
    required this.hasAnswered,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    Color backgroundColor = Colors.white;
    Color shadowColor = const Color(0x99A9A9A9);
    Color textColor = Colors.black;
    Widget? icon;

    if (hasAnswered) {
      if (isCorrect) {
        backgroundColor = const Color(0xFF32CD32);
        shadowColor = const Color(0x99006400);
        textColor = Colors.white;
        icon = Icon(
          Icons.check,
          color: Colors.white,
          size: screenWidth * 0.05,
        );
      } else if (isSelected) {
        backgroundColor = const Color(0xFFDC143C);
        shadowColor = const Color(0x998B0000);
        textColor = Colors.white;
        icon = Icon(
          Icons.close,
          color: Colors.white,
          size: screenWidth * 0.05,
        );
      }
    }

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.016),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              offset: const Offset(0, 6),
              blurRadius: 0,
            ),
          ],
        ),
        child: FilledButton(
          onPressed: hasAnswered ? null : onTap,
          style: FilledButton.styleFrom(
            backgroundColor: backgroundColor,
            disabledBackgroundColor: backgroundColor,
            foregroundColor: textColor,
            disabledForegroundColor: textColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  '$option',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    color: textColor,
                  ),
                ),
              ),
              if (icon != null) icon,
            ],
          ),
        ),
      ),
    );
  }
}
