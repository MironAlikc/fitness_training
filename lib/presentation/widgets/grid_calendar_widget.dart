import 'package:fitness_training/presentation/themes/app_colors.dart';
import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:fitness_training/resources/resources.dart';
import 'package:flutter/material.dart';

class GridCalendarWidget extends StatelessWidget {
  const GridCalendarWidget({
    required this.onTap,
    super.key,
  });
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          InkWell(
            onTap: onTap,
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundColor: AppColors.white,
                  backgroundImage: AssetImage(
                    AppPngs.user,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Aleksander",
                  style: AppFonts.w500s24,
                ),
                SizedBox(width: 10),
                Text(
                  '9.30 AM',
                  style: AppFonts.w700s30,
                ),
                SizedBox(height: 10),
              ],
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
