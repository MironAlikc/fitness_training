import "package:auto_route/auto_route.dart";
import "package:fitness_training/data/models/program_settings_model.dart";
import "package:fitness_training/data/models/training_apparatus_model.dart";
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
    //print(selectedTrainers);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        backgroundColor: Colors.white,
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
            child: const Text(
              "Archieve",
              style: TextStyle(
                color: Color(0xFFFF5447),
                fontSize: 18,
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
                height: 0,
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
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 24,
                fontFamily: "Inter",
                fontWeight: FontWeight.w800,
                height: 0,
              ),
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
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
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
