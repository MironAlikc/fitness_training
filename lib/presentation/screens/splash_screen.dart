import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:fitness_training/core/const.dart';
import 'package:fitness_training/core/resources/resources.dart';
import 'package:fitness_training/core/router/router.dart';
import 'package:fitness_training/presentation/themes/app_colors.dart';
import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: use_build_context_synchronously
@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    routing();
    Timer(
      const Duration(seconds: 2),
      () => AutoRouter.of(context).push(
        const LoginRoute(),
      ),
    );
    super.initState();
  }

  void routing() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString(AppConsts.accessToken);
    await Future.delayed(
      const Duration(seconds: 2),
    );
    if (accessToken != null && accessToken.isNotEmpty) {
      AutoRouter.of(context).push(const HomeRoute());
    } else {
      AutoRouter.of(context).push(const LoginRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.gradientBGColor,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              screenWidth > 600
                  ? Image.asset(
                      AppPngs.logo,
                      height: 230,
                      width: 230,
                    )
                  : Image.asset(
                      AppPngs.logo,
                      height: 130,
                      width: 130,
                    ),
              const SizedBox(height: 50),
              Text(
                "NEW ELEMENT",
                style: screenWidth > 600 ? AppFonts.w800s62 : AppFonts.w800s38,
              ),
              Text(
                "TRAINING",
                style: screenWidth > 600 ? AppFonts.w600s55 : AppFonts.w600s34,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
