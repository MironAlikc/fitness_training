// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:fitness_training/core/bloc/bloc_auth/auth_bloc.dart';
import 'package:fitness_training/core/const.dart';
import 'package:fitness_training/core/resources/resources.dart';
import 'package:fitness_training/core/router/router.dart';
import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:fitness_training/presentation/widgets/button_widget.dart';
import 'package:fitness_training/presentation/widgets/shared_prefs_widget.dart';
import 'package:fitness_training/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controlerEmail = TextEditingController();
  final TextEditingController controlerPassword = TextEditingController();
  String? errorText;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            screenWidth > 600
                ? Image.asset(AppPngs.loginPhotoTable)
                : Image.asset(AppPngs.loginPhoto),
            const SizedBox(height: 60),
            Text(
              "Log In",
              style: screenWidth > 600 ? AppFonts.w800s40 : AppFonts.w800s28,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFieldWidget(
                errorText: errorText,
                controller: controlerEmail,
                hintText: "Email or Phone Number",
                onChanged: (val) {},
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFieldWidget(
                errorText: errorText,
                controller: controlerPassword,
                hintText: "Password",
                onChanged: (val) {},
              ),
            ),
            const SizedBox(height: 62),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthSucces) {
                  AutoRouter.of(context).push(const HomeRoute());
                }
                if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        backgroundColor: Colors.red,
                        content: Center(child: Text("Error"))),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ButtonWidget(
                  onPressed: () async {
                    final SharedPreferences prefs = SharedPrefsWidget.prefs;
                    await prefs.setString(
                        AppConsts.userName, controlerEmail.text);
                    await prefs.setString(
                        AppConsts.password, controlerPassword.text);
                    await prefs.setBool(AppConsts.isLogined, true);
                    setState(() {});
                    BlocProvider.of<AuthBloc>(context).add(
                      GetTokenEvent(
                        login: controlerEmail.text,
                        password: controlerPassword.text,
                      ),
                    );
                  },
                  title: "Log In",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
