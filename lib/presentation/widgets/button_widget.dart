import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    required this.onPressed,
    required this.title,
    super.key,
  });
  final Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    return SizedBox(
      width: screenWidth > 600 ? 548 : 390,
      height: screenWidth > 600 ? 80 : 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFC8CE37),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: screenWidth > 600 ? AppFonts.w700s25 : AppFonts.w700s18,
        ),
      ),
    );
  }
}
