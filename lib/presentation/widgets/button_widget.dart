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
    return Builder(
      builder: (context) {
        final mediaQuery = MediaQuery.of(context);
        final screenWidth = mediaQuery.size.width;
        if (screenWidth > 600) {
          return SizedBox(
            width: 548,
            height: 80,
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
                style: AppFonts.w700s25,
              ),
            ),
          );
        } else {
          return SizedBox(
            width: 390,
            height: 60,
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
                style: AppFonts.w700s18,
              ),
            ),
          );
        }
      },
    );
  }
}
