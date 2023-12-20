import 'package:fitness_training/presentation/themes/app_colors.dart';
import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:flutter/material.dart';

class TextParametersUserWidget extends StatelessWidget {
  const TextParametersUserWidget({
    super.key,
    required this.textOne,
    required this.textTwo,
  });
  final String textOne;
  final String textTwo;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textAlign: TextAlign.center,
          textOne,
          style: screenWidth > 600 ? AppFonts.w400s24 : AppFonts.w400s18,
        ),
        Text(
          textAlign: TextAlign.center,
          textTwo,
          style: screenWidth > 600
              ? AppFonts.w700s24.copyWith(
                  color: AppColors.black,
                )
              : AppFonts.w700s18.copyWith(
                  color: AppColors.black,
                ),
        ),
      ],
    );
  }
}
