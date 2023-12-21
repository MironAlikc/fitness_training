import "package:fitness_training/presentation/themes/app_colors.dart";
import "package:fitness_training/presentation/themes/app_fonts.dart";
import "package:flutter/material.dart";

class SettingsForWidget extends StatelessWidget {
  const SettingsForWidget({
    required this.text,
    super.key,
    required this.controller,
  });
  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    double containerWidth = screenWidth > 600 ? 146 : 140;
    double containerHeight = 62;
    if (screenWidth <= 1334) {
      containerWidth = screenWidth > 600 ? 140 : 100;
      containerHeight = 48;
    } else if (screenWidth > 2732 && mediaQuery.size.height > 2048) {
      containerWidth = screenWidth > 600 ? 300 : 180;
      containerHeight = 80;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.left,
          text,
          style: AppFonts.w700s18.copyWith(
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: containerHeight,
          width: containerWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.white,
            border: Border.all(
              color: AppColors.grey,
            ),
          ),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              hintText: "_",
            ),
          ),
        ),
      ],
    );
  }
}
