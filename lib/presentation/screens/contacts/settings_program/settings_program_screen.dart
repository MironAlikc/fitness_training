// ignore_for_file: use_build_context_synchronously

import "dart:async";
import "package:auto_route/auto_route.dart";
import "package:fitness_training/core/const.dart";
import "package:fitness_training/presentation/screens/contacts/stopwatch_timer/stopwatch_timer_screens.dart";
import "package:fitness_training/presentation/themes/app_fonts.dart";
import "package:fitness_training/presentation/widgets/bloc_program_widget.dart";
import "package:fitness_training/presentation/widgets/custom_timer_widget.dart";
import "package:fitness_training/presentation/widgets/settings_for_widget.dart";
import "package:fitness_training/presentation/widgets/shared_prefs_widget.dart";
import "package:fitness_training/resources/resources.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:shared_preferences/shared_preferences.dart";

@RoutePage()
class SettingsProgramScreen extends StatefulWidget {
  const SettingsProgramScreen({super.key});

  @override
  State<SettingsProgramScreen> createState() => _SettingsProgramScreenState();
}

TextEditingController controllerSeats = TextEditingController();
TextEditingController controllerPin = TextEditingController();
TextEditingController controllerBack = TextEditingController();
TextEditingController controllerHandle = TextEditingController();

class _SettingsProgramScreenState extends State<SettingsProgramScreen> {
  String? textProgram;
  bool isGridView = true;
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
      body: (screenWidth > 600)
          ? Column(
              children: [
                const Text(
                  "Settings for B5 (A)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
                      InkWell(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          SettingsForWidget(
                                              text: "Seats",
                                              controller: controllerSeats),
                                          const SizedBox(width: 20),
                                          SettingsForWidget(
                                            text: "Pin",
                                            controller: controllerPin,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
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
                                      const SizedBox(height: 20),
                                      const Text(
                                        textAlign: TextAlign.center,
                                        "* Weight for current workout",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 150,
                                        vertical: 100,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
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
                                            height: 52,
                                            width: 170,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xFFC8CE37),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                              ),
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
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
                        child: SvgPicture.asset(
                          AppSvgs.settingsProgram,
                          height: 350,
                          width: 350,
                        ),
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
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "History",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 24,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w800,
                      height: 0,
                    ),
                  ),
                ),
              ],
            )
          : Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Settings for B5 (A)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 24,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w800,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 46),
                InkWell(
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
                                const SizedBox(height: 10),
                                Row(
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
                                const SizedBox(height: 20),
                                const Text(
                                  textAlign: TextAlign.center,
                                  "* Weight for current workout",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            actions: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
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
                                      height: 52,
                                      width: 150,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFFC8CE37),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                        onPressed: () async {
                                          final SharedPreferences prefs =
                                              SharedPrefsWidget.prefs;
                                          await prefs.setString(AppConsts.seats,
                                              controllerSeats.text);
                                          await prefs.setString(AppConsts.pin,
                                              controllerPin.text);
                                          await prefs.setString(AppConsts.back,
                                              controllerBack.text);
                                          await prefs.setString(
                                              AppConsts.handle,
                                              controllerHandle.text);
                                          Navigator.of(context).pop();
                                          setState(() {});
                                        },
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
                  child: (isGridView = !isGridView)
                      ? const BlocProgramWidget()
                      : SvgPicture.asset(
                          AppSvgs.settingsProgram,
                        ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
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
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "History",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 24,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w800,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
