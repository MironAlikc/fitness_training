import 'package:auto_route/auto_route.dart';
import 'package:fitness_training/presentation/widgets/grid_contacts_widget.dart';
import 'package:fitness_training/presentation/widgets/list_contacts_widget.dart';
import 'package:fitness_training/router/router.dart';
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Stack(
          children: [
            Builder(
              builder: (context) {
                final mediaQuery = MediaQuery.of(context);
                final screenWidth = mediaQuery.size.width;
                if (screenWidth > 600) {
                  return GridView.builder(
                    padding: const EdgeInsets.only(top: 50),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (context, index) => GridContactsWidget(
                      onTap: () {
                        AutoRouter.of(context).push(
                          const ProgramRoute(),
                        );
                      },
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 0.0,
                      crossAxisSpacing: 0.0,
                    ),
                  );
                } else {
                  return ListView.builder(
                    padding: const EdgeInsets.only(top: 50),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) => ListContactsWidget(
                      onTap: () {
                        AutoRouter.of(context).push(
                          const ProgramRoute(),
                        );
                      },
                    ),
                  );
                }
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: const TextStyle(
                  color: Color(0xFFA3A3A3),
                  fontSize: 18,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
                fillColor: const Color(0xFFF2F2F2).withAlpha(235),
                filled: true,
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}
