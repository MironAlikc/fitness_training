import 'package:auto_route/auto_route.dart';
import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:fitness_training/presentation/widgets/button_widget.dart';
import 'package:fitness_training/resources/resources.dart';
import 'package:fitness_training/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateProgramScreen extends StatefulWidget {
  const CreateProgramScreen({super.key});

  @override
  State<CreateProgramScreen> createState() => _CreateProgramScreenState();
}

class _CreateProgramScreenState extends State<CreateProgramScreen> {
  List<String> letters = [
    "A1",
    "A2",
    "A3",
    "A4",
    "B1",
    "B5",
    "B6",
    "B8",
    "C1",
    "C3",
    "C5",
    "C7",
    "D5",
    "D6",
    "D7",
    "E1",
    "E2",
    "E3",
    "E4",
    "E5",
    "F1",
    "F2",
    "F3",
    "G1",
    "G3",
    "H1",
    "H2",
    "J1",
  ];
  List<String> selectedLetters = [];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: screenWidth > 600 ? 100 : 80,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            AppPngs.back,
          ),
          onPressed: () {
            AutoRouter.of(context).pop(const ContactsRoute());
          },
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              "Select training \nmachienes for Program A",
              textAlign: TextAlign.center,
              style: screenWidth > 600 ? AppFonts.w800s40 : AppFonts.w800s24,
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 40,
              runSpacing: 20,
              children: [
                for (final letter in letters)
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (selectedLetters.contains(letter)) {
                          selectedLetters.remove(letter);
                        } else {
                          selectedLetters.add(letter);
                        }
                      });
                    },
                    child: Container(
                      width: screenWidth > 600 ? 130 : 65,
                      height: screenWidth > 600 ? 110 : 55,
                      decoration: BoxDecoration(
                        color: selectedLetters.contains(letter)
                            ? const Color(0xFFC8CE37)
                            : null,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          letter,
                          style: TextStyle(
                            color: selectedLetters.contains(letter)
                                ? Colors.white
                                : const Color(0xFFA3A3A3),
                            fontSize: screenWidth > 600 ? 80 : 40,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const Spacer(),
            ButtonWidget(
              onPressed: () {
                AutoRouter.of(context).push(
                  SelectTrainingRoute(selectedTrainers: selectedLetters),
                );
              },
              title: "Next",
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
