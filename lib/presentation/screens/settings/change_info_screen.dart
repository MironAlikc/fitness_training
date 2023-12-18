import 'package:auto_route/auto_route.dart';
import 'package:fitness_training/presentation/widgets/button_widget.dart';
import 'package:fitness_training/presentation/widgets/image_user_widget.dart';
import 'package:fitness_training/presentation/widgets/user_info_text_field_widget.dart';
import 'package:fitness_training/resources/resources.dart';
import 'package:fitness_training/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChangeInfoScreen extends StatelessWidget {
  const ChangeInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        child: Column(
          children: [
            const Stack(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    AppPngs.user,
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 0,
                  child: ImageUserWidget(),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const UserInfoTextFieldWidget(
              text: 'Your Name',
              hintText: 'Name',
            ),
            const SizedBox(height: 10),
            const UserInfoTextFieldWidget(
              text: 'Your Surname',
              hintText: 'Surname',
            ),
            const SizedBox(height: 10),
            const UserInfoTextFieldWidget(
              text: 'Phone number',
              hintText: '+ 123 456 78 89',
            ),
            const SizedBox(height: 10),
            const UserInfoTextFieldWidget(
              text: 'Email',
              hintText: 'Email',
            ),
            const SizedBox(height: 10),
            const UserInfoTextFieldWidget(
              text: 'Notes',
              hintText: 'Notes',
            ),
            const SizedBox(height: 20),
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
    );
  }
}
