import 'package:auto_route/auto_route.dart';
import 'package:fitness_training/core/resources/resources.dart';
import 'package:fitness_training/core/router/router.dart';
import 'package:fitness_training/domain/models/training_apparatus_model.dart';
import 'package:fitness_training/presentation/themes/app_colors.dart';
import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:fitness_training/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateProgramScreen extends StatefulWidget {
  const CreateProgramScreen({super.key});

  @override
  State<CreateProgramScreen> createState() => _CreateProgramScreenState();
}

class _CreateProgramScreenState extends State<CreateProgramScreen> {
  final List<TrainingApparatusModel> _selectedApparatus = [];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: screenWidth > 600 ? 100 : 80,
        backgroundColor: AppColors.white,
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
      body: SingleChildScrollView(
        child: Align(
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
                spacing: 20,
                runSpacing: 20,
                children: [
                  for (final apparat in apparatusModels)
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (_selectedApparatus.contains(apparat)) {
                            _selectedApparatus.remove(apparat);
                          } else {
                            _selectedApparatus.add(apparat);
                          }
                        });
                      },
                      child: Container(
                        width: screenWidth > 600 ? 130 : 65,
                        height: screenWidth > 600 ? 110 : 55,
                        decoration: BoxDecoration(
                          color: _selectedApparatus.contains(apparat)
                              ? AppColors.colorMain
                              : null,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            apparat.name,
                            style: TextStyle(
                              color: _selectedApparatus.contains(apparat)
                                  ? AppColors.white
                                  : AppColors.grey,
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
              //  const Spacer(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ButtonWidget(
                  onPressed: _selectedApparatus.isNotEmpty
                      ? () {
                          AutoRouter.of(context).push(
                            SelectTrainingRoute(
                              apparatus: _selectedApparatus,
                            ),
                          );
                        }
                      : null,
                  title: "Next",
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
