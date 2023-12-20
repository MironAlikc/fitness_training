import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:fitness_training/resources/resources.dart';
import 'package:flutter/material.dart';

class GridContactsWidget extends StatelessWidget {
  const GridContactsWidget({required this.onTap, super.key});
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
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    AppPngs.userImage,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Aleksander',
                  style: AppFonts.w500s24,
                )
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
