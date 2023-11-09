import 'package:auto_route/auto_route.dart';
import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:fitness_training/presentation/widgets/button_widget.dart';
import 'package:fitness_training/presentation/widgets/text_field_widget.dart';
import 'package:fitness_training/resources/resources.dart';
import 'package:fitness_training/router/router.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              AppPngs.loginPhoto,
            ),
            const SizedBox(height: 60),
            const Text(
              "Log In",
              style: AppFonts.w800s28,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ButtonWidget(
                onPressed: () {
                  AutoRouter.of(context).push(const HomeRoute());
                },
                title: "Log In",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
