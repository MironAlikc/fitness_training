import 'dart:async';

import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:fitness_training/presentation/widgets/settings_for_widget.dart';
import 'package:flutter/material.dart';

class ProgramDialogWidget extends StatelessWidget {
  const ProgramDialogWidget(
      {super.key,
      required this.controllerSeats,
      required this.controllerPin,
      required this.controllerBack,
      required this.controllerHandle,
      required this.onPressed,
      required this.child});
  final Widget child;
  final Function() onPressed;
  final TextEditingController controllerSeats;
  final TextEditingController controllerPin;
  final TextEditingController controllerBack;
  final TextEditingController controllerHandle;

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
                title: const Text(
                  textAlign: TextAlign.center,
                  "Settings for B5 (A)",
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
                            onPressed: onPressed,
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
      child: child,
    );
  }
}
