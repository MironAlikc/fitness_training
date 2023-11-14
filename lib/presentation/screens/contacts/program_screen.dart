import 'package:auto_route/auto_route.dart';
import 'package:fitness_training/presentation/widgets/button_widget.dart';
import 'package:fitness_training/presentation/widgets/user_cart_widget.dart';
import 'package:fitness_training/resources/resources.dart';
import 'package:fitness_training/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProgramScreen extends StatelessWidget {
  const ProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
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
            children: [
              const CircleAvatar(
                radius: 90,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(
                  AppPngs.user,
                ),
              ),
              const SizedBox(height: 11),
              const UserCardWidget(),
              const SizedBox(height: 50),
              ButtonWidget(
                onPressed: () {
                  AutoRouter.of(context).push(
                    const CreateProgramRoute(),
                  );
                },
                title: "Create New Program",
              ),
              //const TabBarTrainingWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
