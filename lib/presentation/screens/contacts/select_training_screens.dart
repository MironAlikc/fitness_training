import "package:auto_route/auto_route.dart";
import "package:fitness_training/data/models/program_settings_model.dart";
import "package:fitness_training/data/models/training_apparatus_model.dart";
import "package:fitness_training/presentation/themes/app_colors.dart";
import "package:fitness_training/presentation/themes/app_fonts.dart";
import "package:fitness_training/presentation/widgets/button_widget.dart";
import "package:fitness_training/resources/resources.dart";
import "package:fitness_training/router/router.dart";
import "package:flutter/material.dart";

@RoutePage()
class SelectTrainingScreen extends StatelessWidget {
  const SelectTrainingScreen({
    super.key,
    required this.apparatus,
  });
  final List<TrainingApparatusModel> apparatus;

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
            AutoRouter.of(context).pop(const CreateProgramRoute());
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Archieve",
              style: AppFonts.w700s18.copyWith(
                color: AppColors.rid,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Program A",
              textAlign: TextAlign.center,
              style: AppFonts.w800s24,
            ),
            const SizedBox(height: 20),
            Wrap(
              runAlignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 5,
              children: apparatus.map((apparat) {
                return GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(
                      SettingsProgramRoute(
                        programSettings: ProgramSettingsModel(
                          apparat: apparat,
                          proporties: [],
                          weight: 0,
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Text(
                      apparat.name,
                      style: AppFonts.w500s40,
                    ),
                  ),
                );
              }).toList(),
            ),
            const Spacer(),
            ButtonWidget(
              onPressed: () {},
              title: "Save",
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
