import 'dart:async';

import 'package:fitness_training/data/models/program_settings_model.dart';
import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:fitness_training/presentation/widgets/bloc_program_widget.dart';
import 'package:fitness_training/presentation/widgets/settings_for_widget.dart';
import 'package:fitness_training/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProgramDialogWidget extends StatelessWidget {
  ProgramDialogWidget({
    super.key,
    required this.onPressed,
    required this.programSettings,
  });

  final ValueChanged<ProgramSettingsModel> onPressed;
  final TextEditingController controllerSeats = TextEditingController();
  final TextEditingController controllerPin = TextEditingController();
  final TextEditingController controllerBack = TextEditingController();
  final TextEditingController controllerHandle = TextEditingController();
  final ProgramSettingsModel programSettings;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
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
                title: Text(
                  textAlign: TextAlign.center,
                  "Settings for ${programSettings.apparat.name} (A)",
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
                          text: "Weight",
                          controller: controllerHandle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      textAlign: TextAlign.center,
                      "* Weight for current workout",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                              color: Color(0xFFC8CE37),
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenWidth > 600 ? 100 : 30,
                          width: screenWidth > 600 ? 150 : 80,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFC8CE37),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
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
                                weight: 0,
                              ),
                            ),
                            child: const Text(
                              "Ok",
                              textAlign: TextAlign.center,
                              style: AppFonts.w700s18,
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
          ? BlocProgramWidget(
              programSettings: programSettings,
            )
          : SvgPicture.asset(
              AppSvgs.settingsProgram,
              height: screenWidth > 600 ? 350 : null,
              width: screenWidth > 600 ? 350 : null,
            ),
    );
  }
}
