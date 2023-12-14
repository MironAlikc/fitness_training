import 'package:auto_route/auto_route.dart';
import 'package:fitness_training/bloc/bloc_auth/auth_bloc.dart';
import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:fitness_training/presentation/widgets/button_widget.dart';
import 'package:fitness_training/presentation/widgets/text_field_widget.dart';
import 'package:fitness_training/resources/resources.dart';
import 'package:fitness_training/router/router.dart';

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
  void initState() {
    checkSavedCredentials();
    super.initState();
  }

  void checkSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLogin = prefs.getString('login');
    String? savedPassword = prefs.getString('password');

    if (savedLogin != null && savedPassword != null) {
      // ignore: use_build_context_synchronously
      BlocProvider.of<AuthBloc>(context).add(
        GetTokenEvent(
          login: savedLogin,
          password: savedPassword,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    // nameText = prefs?.getString(AppConsts.loginKey) ?? '';
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
              listener: (context, state) async {
                if (state is AuthSucces) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    saveCredentials(
                        controlerEmail.text, controlerPassword.text);
                    AutoRouter.of(context).push(const HomeRoute());
                  });
                }
                if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Center(child: Text("Error")),
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ButtonWidget(
                  onPressed: () async {
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

  void saveCredentials(String login, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('login', login);
    prefs.setString('password', password);
  }
}
