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
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textAlign: TextAlign.center,
          textOne,
          style: AppFonts.w400s18,
        ),
        Text(
          textAlign: TextAlign.center,
          textTwo,
          style: AppFonts.w700s19,
        ),
      ],
    );
  }
}
