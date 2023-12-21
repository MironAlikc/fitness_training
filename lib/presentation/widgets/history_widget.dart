import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 39),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "History",
              textAlign: TextAlign.start,
              style: screenWidth > 600 ? AppFonts.w800s34 : AppFonts.w800s24,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Date',
              style: screenWidth > 600 ? AppFonts.w500s24 : AppFonts.w500s18,
            ),
            Text(
              'Weight',
              style: screenWidth > 600 ? AppFonts.w500s24 : AppFonts.w500s18,
            ),
            Text(
              'Time',
              style: screenWidth > 600 ? AppFonts.w500s24 : AppFonts.w500s18,
            )
          ],
        ),
      ],
    );
  }
}
