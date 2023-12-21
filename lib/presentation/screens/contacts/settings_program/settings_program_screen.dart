import "package:auto_route/auto_route.dart";
import "package:fitness_training/data/models/program_settings_model.dart";
import "package:fitness_training/presentation/screens/contacts/stopwatch_timer/stopwatch_timer_screens.dart";
import "package:fitness_training/presentation/themes/app_fonts.dart";
import "package:fitness_training/presentation/widgets/button_widget.dart";
import "package:fitness_training/presentation/widgets/custom_timer_widget.dart";
import "package:fitness_training/presentation/widgets/history_widget.dart";
import "package:fitness_training/presentation/widgets/program_dialog_widget.dart";
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
    final screenHeight = mediaQuery.size.height;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: screenWidth > 600 ? 100 : 80,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            AppPngs.back,
            height: screenHeight > 750 ? 150 : 80,
            width: screenWidth > 600 ? 250 : 120,
          ),
          onPressed: () {
            AutoRouter.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Text(
            "Settings for ${_programSettings.apparat.name} (A)",
            textAlign: TextAlign.center,
            style: AppFonts.w800s24,
          ),
          const SizedBox(height: 46),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth > 600 ? 80 : 16,
            ),
            child: screenWidth > 600
                ? Row(
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
                            title: "Timer",
                            image: AppSvgs.timer,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const StopwatchTimerScreens(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomTimerWidget(
                            title: "Metronom",
                            image: AppSvgs.metronom,
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  )
                : Column(
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
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTimerWidget(
                              title: "Timer",
                              image: AppSvgs.timer,
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const StopwatchTimerScreens(),
                                  ),
                                );
                              },
                            ),
                            CustomTimerWidget(
                              title: "Metronom",
                              image: AppSvgs.metronom,
                              onPressed: () {},
                            ),
                          ],
                        ),
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
      )),
    );
  }
}
