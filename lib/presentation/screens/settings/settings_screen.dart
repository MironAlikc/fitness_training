import 'package:auto_route/auto_route.dart';
import 'package:fitness_training/presentation/widgets/button_widget.dart';
import 'package:fitness_training/resources/resources.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 90,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(
                        AppPngs.user,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 19,
                        backgroundColor: const Color(0xFFC8CE37),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 31),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: 390,
                    height: 180,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: const Column(
                      children: [
                        Text(
                          'Andrew Trainer',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 30,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w800,
                            height: 0,
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Phone number',
                            // textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Color(0xFFA3A3A3),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        SizedBox(height: 11),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Email',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFA3A3A3),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        SizedBox(height: 11),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Some info',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFA3A3A3),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                ButtonWidget(
                  onPressed: () {
                    // AutoRouter.of(context).push(
                    //   const ChangeInfoRoute(),
                    // );
                  },
                  title: 'Change Info',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
