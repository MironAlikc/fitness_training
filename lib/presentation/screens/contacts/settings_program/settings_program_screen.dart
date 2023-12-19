// ignore_for_file: use_build_context_synchronously

import "package:auto_route/auto_route.dart";
import "package:fitness_training/core/const.dart";
import "package:fitness_training/data/models/program_settings_model.dart";
import "package:fitness_training/presentation/screens/contacts/stopwatch_timer/stopwatch_timer_screens.dart";
import "package:fitness_training/presentation/widgets/bloc_program_widget.dart";
import "package:fitness_training/presentation/widgets/button_widget.dart";
import "package:fitness_training/presentation/widgets/custom_timer_widget.dart";
import "package:fitness_training/presentation/widgets/history_widget.dart";
import "package:fitness_training/presentation/widgets/program_dialog_widget.dart";
import "package:fitness_training/presentation/widgets/shared_prefs_widget.dart";
import "package:fitness_training/resources/resources.dart";
import "package:flutter/material.dart";

@RoutePage()
class SettingsProgramScreen extends StatefulWidget {
  final ProgramSettingsModel programSettings;

  const SettingsProgramScreen({
    super.key,
    required this.programSettings,
  });

  @override
  State<SettingsProgramScreen> createState() => _SettingsProgramScreenState();
}

class _SettingsProgramScreenState extends State<SettingsProgramScreen> {
  String? textProgram;
  bool isGridView = true;
  late ProgramSettingsModel _programSettings;
  @override
  void initState() {
    super.initState();
    _programSettings = widget.programSettings;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            AppPngs.back,
            height: (screenWidth > 600) ? 400 : 150,
            width: (screenWidth > 600) ? 400 : 250,
          ),
          onPressed: () {
            AutoRouter.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: (screenWidth > 600)
            ? Column(
                children: [
                  Text(
                    "Settings for ${_programSettings.apparat.name} (A)",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 24,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w800,
                      height: 0,
                    ),
                  ),
                  const SizedBox(height: 46),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ProgramDialogWidget(
                          onPressed: (settings) async {
                            // final SharedPreferences prefs =
                            //     SharedPrefsWidget.prefs;
                            // await prefs.setString(
                            //     AppConsts.seats, controllerSeats.text);
                            // await prefs.setString(
                            //     AppConsts.pin, controllerPin.text);
                            // await prefs.setString(
                            //     AppConsts.back, controllerBack.text);
                            // await prefs.setString(
                            //     AppConsts.handle, controllerHandle.text);

                            Navigator.of(context).pop();
                            setState(() {
                              _programSettings = settings;
                            });
                          },
                          programSettings: _programSettings,
                        ),
                        Column(
                          children: [
                            CustomTimerWidget(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const StopwatchTimerScreens(),
                                  ),
                                );
                              },
                              title: "Timer",
                              image: AppSvgs.timer,
                            ),
                            const SizedBox(height: 20),
                            CustomTimerWidget(
                              onPressed: () {},
                              title: "Metronom",
                              image: AppSvgs.metronom,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  const HistoryWidget(),
                  const SizedBox(height: 80),
                  ButtonWidget(
                    onPressed: () {},
                    title: 'Next',
                  )
                ],
              )
            : Column(
                children: [
                  Text(
                    "Settings for ${_programSettings.apparat.name} (A)",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 24,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w800,
                      height: 0,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ProgramDialogWidget(
                    onPressed: (settings) async {
                      // final SharedPreferences prefs = SharedPrefsWidget.prefs;
                      // await prefs.setString(
                      //     AppConsts.seats, controllerSeats.text);
                      // await prefs.setString(AppConsts.pin, controllerPin.text);
                      // await prefs.setString(
                      //     AppConsts.back, controllerBack.text);
                      // await prefs.setString(
                      //     AppConsts.handle, controllerHandle.text);
                      Navigator.of(context).pop();
                      setState(() {
                        _programSettings = settings;
                      });
                    },
                    programSettings: _programSettings,
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTimerWidget(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const StopwatchTimerScreens(),
                              ),
                            );
                          },
                          title: "Timer",
                          image: AppSvgs.timer,
                        ),
                        CustomTimerWidget(
                          onPressed: () {},
                          title: "Metronom",
                          image: AppSvgs.metronom,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  const HistoryWidget(),
                  const SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ButtonWidget(
                      onPressed: () {},
                      title: 'Next',
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
