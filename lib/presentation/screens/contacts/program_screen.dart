import 'package:auto_route/auto_route.dart';
import 'package:fitness_training/presentation/themes/app_colors.dart';
import 'package:fitness_training/presentation/widgets/button_widget.dart';
import 'package:fitness_training/presentation/widgets/tab_bar_training_widget.dart';
import 'package:fitness_training/presentation/widgets/user_cart_widget.dart';
import 'package:fitness_training/resources/resources.dart';
import 'package:fitness_training/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProgramScreen extends StatelessWidget {
  const ProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: screenWidth > 600 ? 100 : 80,
        leading: IconButton(
          icon: Image.asset(
            AppPngs.back,
          ),
          onPressed: () {
            AutoRouter.of(context).pop(const ContactsRoute());
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: screenWidth > 600 ? 160 : 80,
                backgroundColor: AppColors.white,
                backgroundImage: const AssetImage(
                  AppPngs.user,
                ),
              ),
              const SizedBox(height: 11),
              const UserCardWidget(),
              SizedBox(height: screenWidth > 600 ? 50 : 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ButtonWidget(
                  onPressed: () {
                    AutoRouter.of(context).push(
                      const CreateProgramRoute(),
                    );
                  },
                  title: "Create New Program",
                ),
              ),
              const TabBarTrainingWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
