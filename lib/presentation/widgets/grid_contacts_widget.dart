import 'package:fitness_training/domain/models/client_model.dart';
import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:flutter/material.dart';

class GridContactsWidget extends StatelessWidget {
  const GridContactsWidget({
    required this.onTap,
    required this.model,
    super.key,
  });
  final ClientModel model;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          InkWell(
            onTap: onTap,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    model.photo ?? '',
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  model.name,
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
