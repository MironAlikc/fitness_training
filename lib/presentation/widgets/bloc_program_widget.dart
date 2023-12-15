import 'package:fitness_training/core/const.dart';
import 'package:fitness_training/presentation/widgets/program_information_widget.dart';
import 'package:fitness_training/presentation/widgets/shared_prefs_widget.dart';
import 'package:fitness_training/resources/resources.dart';
import 'package:flutter/material.dart';

class BlocProgramWidget extends StatelessWidget {
  const BlocProgramWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProgramInformationWidget(
                image: AppPngs.seats,
                text: 'Seats',
                textInt:
                    SharedPrefsWidget.prefs.getString(AppConsts.seats) ?? '',
              ),
              ProgramInformationWidget(
                image: AppPngs.body,
                text: 'Back',
                textInt:
                    SharedPrefsWidget.prefs.getString(AppConsts.back) ?? '',
              ),
            ],
          ),
          const SizedBox(width: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProgramInformationWidget(
                image: AppPngs.pin,
                text: 'Pin',
                textInt: SharedPrefsWidget.prefs.getString(AppConsts.pin) ?? '',
              ),
              ProgramInformationWidget(
                image: AppPngs.handle,
                text: 'Handle',
                textInt:
                    SharedPrefsWidget.prefs.getString(AppConsts.handle) ?? '',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
