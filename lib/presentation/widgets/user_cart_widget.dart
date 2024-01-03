import 'package:fitness_training/domain/models/client_model.dart';
import 'package:fitness_training/presentation/themes/app_colors.dart';
import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:fitness_training/presentation/widgets/text_parameters_user_widget.dart';
import 'package:flutter/material.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    super.key,
    required this.model,
  });

  final ClientModel model;

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
              model.name,
              textAlign: TextAlign.center,
              style: screenWidth > 600 ? AppFonts.w800s40 : AppFonts.w800s30,
            ),
            TextParametersUserWidget(
              textOne: 'Phone number ',
              textTwo: model.phoneNumber,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth > 600 ? 180 : 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextParametersUserWidget(
                    textOne: 'Age ',
                    textTwo: '32 y ',
                  ),
                  TextParametersUserWidget(
                    textOne: 'Weight ',
                    textTwo: model.weight.toString(),
                  ),
                  TextParametersUserWidget(
                    textOne: 'Height ',
                    textTwo: model.height.toString(),
                  ),
                ],
              ),
            ),
            Text(
              model.notes ?? '',
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
