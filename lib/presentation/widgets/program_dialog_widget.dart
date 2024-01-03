import 'dart:async';

import 'package:fitness_training/core/resources/resources.dart';
import 'package:fitness_training/domain/models/program_settings_model.dart';
import 'package:fitness_training/presentation/themes/app_colors.dart';
import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:fitness_training/presentation/widgets/settings_for_widget.dart';
import 'package:fitness_training/presentation/widgets/workout_setup_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProgramDialogWidget extends StatelessWidget {
  ProgramDialogWidget({
    super.key,
    required this.onPressed,
    required this.programSettings,
  });
  final ProgramSettingsModel programSettings;
  final ValueChanged<ProgramSettingsModel> onPressed;
  final controllerSeats = TextEditingController();
  final controllerPin = TextEditingController();
  final controllerBack = TextEditingController();
  final controllerHandle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    double contentPaddingHorizontal = 20;
    double contentPaddingVertical = 20;
    double buttonHeight = 32;
    double buttonWidth = 102;

    if (screenWidth > 1334 && mediaQuery.size.height > 700) {
      contentPaddingHorizontal = 16;
      contentPaddingVertical = 16;
      buttonHeight = 38;
      buttonWidth = 40;
    } else if (screenWidth > 2732 && mediaQuery.size.height > 2048) {
      contentPaddingHorizontal = 30;
      contentPaddingVertical = 30;
      buttonHeight = 80;
      buttonWidth = 320;
    }

    return InkWell(
      onTap: () {
        unawaited(
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentTextStyle: const TextStyle(),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: contentPaddingHorizontal,
                  vertical: contentPaddingVertical,
                ),
                title: Text(
                  textAlign: TextAlign.center,
                  "Settings for ${programSettings.apparat.name} (A)",
                  style:
                      screenWidth > 600 ? AppFonts.w800s30 : AppFonts.w800s24,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SettingsForWidget(
                          controller: controllerSeats,
                          text: "Seats",
                        ),
                        const SizedBox(width: 20),
                        SettingsForWidget(
                          text: "Pin",
                          controller: controllerPin,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SettingsForWidget(
                          text: "Back",
                          controller: controllerBack,
                        ),
                        const SizedBox(width: 20),
                        SettingsForWidget(
                          text: "Handle",
                          controller: controllerHandle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      textAlign: TextAlign.center,
                      "* Weight for current workout",
                      style: AppFonts.w500s18,
                    ),
                  ],
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: contentPaddingHorizontal),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            "Cancel",
                            style: screenWidth > 600
                                ? AppFonts.w800s24.copyWith(
                                    color: AppColors.colorMain,
                                  )
                                : AppFonts.w800s18,
                          ),
                        ),
                        SizedBox(
                          height: buttonHeight,
                          width: buttonWidth,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.colorMain,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(39),
                              ),
                            ),
                            onPressed: () => onPressed.call(
                              ProgramSettingsModel(
                                apparat: programSettings.apparat,
                                proporties: [
                                  ProgramSettingsProporties(
                                    name: 'Seats',
                                    value:
                                        int.tryParse(controllerSeats.text) ?? 0,
                                    type: ProportiesType.seats,
                                  ),
                                  ProgramSettingsProporties(
                                    name: 'Back',
                                    value:
                                        int.tryParse(controllerBack.text) ?? 0,
                                    type: ProportiesType.back,
                                  ),
                                  ProgramSettingsProporties(
                                    name: 'Handle',
                                    value:
                                        int.tryParse(controllerHandle.text) ??
                                            0,
                                    type: ProportiesType.handle,
                                  ),
                                  ProgramSettingsProporties(
                                    name: 'Pin',
                                    value:
                                        int.tryParse(controllerPin.text) ?? 0,
                                    type: ProportiesType.pin,
                                  ),
                                ],
                                weight: 10,
                              ),
                            ),
                            child: Text(
                              "OK",
                              textAlign: TextAlign.center,
                              style: screenWidth > 600
                                  ? AppFonts.w700s24
                                  : AppFonts.w700s18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        );
      },
      child: (programSettings.proporties.isNotEmpty)
          ? WorkoutSetupWidget(
              programSettings: programSettings,
            )
          : SvgPicture.asset(
              AppSvgs.settingsProgram,
              height: screenWidth > 500 ? 350 : 180,
              width: screenWidth > 500 ? 350 : 180,
            ),
    );
  }
}
