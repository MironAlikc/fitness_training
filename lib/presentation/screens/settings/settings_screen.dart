import 'package:auto_route/auto_route.dart';
import 'package:fitness_training/presentation/widgets/button_widget.dart';
import 'package:fitness_training/presentation/widgets/user_info_widget.dart';
import 'package:fitness_training/resources/resources.dart';
import 'package:fitness_training/router/router.dart';
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
                const UserInfoWidget(),
                const SizedBox(height: 28),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ButtonWidget(
                    onPressed: () {
                      AutoRouter.of(context).push(
                        const ChangeInfoRoute(),
                      );
                    },
                    title: 'Change Info',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
