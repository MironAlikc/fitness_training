import 'package:fitness_training/presentation/themes/app_colors.dart';
import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:fitness_training/presentation/widgets/text_parameters_user_widget.dart';
import 'package:flutter/material.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth > 600 ? 40 : 20,
      ),
      child: Container(
        width: double.infinity,
        height: 180,
        decoration: ShapeDecoration(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: const [
            BoxShadow(
              color: AppColors.shadows,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Andrew Brown",
              textAlign: TextAlign.center,
              style: screenWidth > 600 ? AppFonts.w800s40 : AppFonts.w800s30,
            ),
            const TextParametersUserWidget(
              textOne: 'Phone number ',
              textTwo: '+123 456 789 9192',
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth > 600 ? 180 : 5,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextParametersUserWidget(
                    textOne: 'Age ',
                    textTwo: '32 y ',
                  ),
                  TextParametersUserWidget(
                    textOne: 'Weight ',
                    textTwo: '200tb',
                  ),
                  TextParametersUserWidget(
                    textOne: 'Height ',
                    textTwo: '6,3',
                  ),
                ],
              ),
            ),
            Text(
              "Some notes about Andrew",
              textAlign: TextAlign.center,
              style: screenWidth > 600 ? AppFonts.w400s24 : AppFonts.w400s18,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
