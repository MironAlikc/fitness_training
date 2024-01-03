import 'package:auto_route/auto_route.dart';
import 'package:fitness_training/core/router/router.dart';
import 'package:fitness_training/domain/models/client_model.dart';
import 'package:fitness_training/presentation/themes/app_colors.dart';
import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:fitness_training/presentation/widgets/grid_contacts_widget.dart';
import 'package:fitness_training/presentation/widgets/list_contacts_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Stack(
            children: [
              screenWidth > 600
                  ? GridView.builder(
                      padding: const EdgeInsets.only(top: 70),
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      shrinkWrap: true,
                      itemCount: clients.length,
                      itemBuilder: (context, index) => GridContactsWidget(
                        model: clients[index],
                        onTap: () {
                          AutoRouter.of(context).push(
                            ProgramRoute(
                              model: clients[index],
                            ),
                          );
                        },
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(top: 50),
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      shrinkWrap: true,
                      itemCount: clients.length,
                      itemBuilder: (context, index) => ListContactsWidget(
                        model: clients[index],
                        onTap: () {
                          AutoRouter.of(context).push(
                            ProgramRoute(
                              model: clients[index],
                            ),
                          );
                        },
                      ),
                    ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle:
                      screenWidth > 600 ? AppFonts.w700s26 : AppFonts.w400s18,
                  fillColor: AppColors.colotSearch.withAlpha(235),
                  filled: true,
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.white,
                    ),
                  ),
                ),
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
