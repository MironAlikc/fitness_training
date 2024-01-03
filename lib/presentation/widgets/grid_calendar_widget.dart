import 'dart:core';

import 'package:fitness_training/domain/models/appointment_model.dart';
import 'package:fitness_training/presentation/themes/app_colors.dart';
import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:flutter/material.dart';

class GridCalendarWidget extends StatelessWidget {
  const GridCalendarWidget({
    required this.onTap,
    super.key,
    required this.appointment,
  });
  final AppointmentModel appointment;
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
                  backgroundColor: AppColors.white,
                  backgroundImage: AssetImage(
                    appointment.client.photo ?? "",
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  appointment.client.name,
                  style: AppFonts.w500s24,
                ),
                const SizedBox(width: 10),
                Text(
                  '${appointment.date.hour}:${appointment.date.minute}',
                  style: AppFonts.w700s30,
                ),
                const SizedBox(height: 10),
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
