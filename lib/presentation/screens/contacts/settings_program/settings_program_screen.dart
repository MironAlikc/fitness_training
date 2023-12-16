// ignore_for_file: use_build_context_synchronously

import "package:auto_route/auto_route.dart";
import "package:fitness_training/core/const.dart";
import "package:fitness_training/presentation/screens/contacts/stopwatch_timer/stopwatch_timer_screens.dart";
import "package:fitness_training/presentation/widgets/bloc_program_widget.dart";
import "package:fitness_training/presentation/widgets/button_widget.dart";
import "package:fitness_training/presentation/widgets/custom_timer_widget.dart";
import "package:fitness_training/presentation/widgets/program_dialog_widget.dart";
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
          ? SingleChildScrollView(
              child: Column(
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
                        ProgramDialogWidget(
                          controllerSeats: controllerSeats,
                          controllerPin: controllerPin,
                          controllerBack: controllerBack,
                          controllerHandle: controllerHandle,
                          onPressed: () async {
                            final SharedPreferences prefs =
                                SharedPrefsWidget.prefs;
                            await prefs.setString(
                                AppConsts.seats, controllerSeats.text);
                            await prefs.setString(
                                AppConsts.pin, controllerPin.text);
                            await prefs.setString(
                                AppConsts.back, controllerBack.text);
                            await prefs.setString(
                                AppConsts.handle, controllerHandle.text);
                            Navigator.of(context).pop();
                            setState(() {});
                          },
                          child: (isGridView = !isGridView)
                              ? const BlocProgramWidget()
                              : SvgPicture.asset(
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
              ),
            )
          : SingleChildScrollView(
              child: Column(
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
                  const SizedBox(height: 6),
                  ProgramDialogWidget(
                    controllerSeats: controllerSeats,
                    controllerPin: controllerPin,
                    controllerBack: controllerBack,
                    controllerHandle: controllerHandle,
                    onPressed: () async {
                      final SharedPreferences prefs = SharedPrefsWidget.prefs;
                      await prefs.setString(
                          AppConsts.seats, controllerSeats.text);
                      await prefs.setString(AppConsts.pin, controllerPin.text);
                      await prefs.setString(
                          AppConsts.back, controllerBack.text);
                      await prefs.setString(
                          AppConsts.handle, controllerHandle.text);
                      Navigator.of(context).pop();
                      setState(() {});
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
                  const Padding(
                    padding: EdgeInsets.only(left: 39),
                    child: Align(
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
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(
                          color: Color(0xFFA3A3A3),
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      Text(
                        'Weight',
                        style: TextStyle(
                          color: Color(0xFFA3A3A3),
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      Text(
                        'Time',
                        style: TextStyle(
                          color: Color(0xFFA3A3A3),
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                  // const SizedBox(height: 120),
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
