import 'package:fitness_training/data/models/client_model.dart';
import 'package:fitness_training/presentation/themes/app_colors.dart';
import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:flutter/material.dart';

class ListContactsWidget extends StatelessWidget {
  const ListContactsWidget({
    required this.onTap,
    super.key,
    required this.model,
  });
  final ClientModel model;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      child: Stack(
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              height: 108,
              padding: const EdgeInsets.all(20),
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
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.white,
                    backgroundImage: AssetImage(
                      model.photo ?? '',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name,
                        style: AppFonts.w500s18.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Weight ${model.weight} tb ",
                            textAlign: TextAlign.center,
                            style: AppFonts.w400s16,
                          ),
                          const SizedBox(width: 18),
                          Text(
                            "Height ${model.height}",
                            textAlign: TextAlign.center,
                            style: AppFonts.w400s16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Material(
          //   color: Colors.transparent,
          //   child: InkWell(
          //     borderRadius: BorderRadius.circular(13),
          //     onTap: onTap,
          //   ),
          // ),
        ],
      ),
    );
  }
}
