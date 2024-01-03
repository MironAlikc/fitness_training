import 'package:fitness_training/domain/models/program_settings_model.dart';
import 'package:fitness_training/domain/models/training_apparatus_model.dart';

class ProgramModel {
  final String name;

  final List<ProgramSettingsModel> settings;

  ProgramModel({
    required this.name,
    required this.settings,
  });
}

List<ProgramModel> programModels = programNames
    .toSet()
    .map((name) => ProgramModel(name: name, settings: [
          ProgramSettingsModel(
            apparat: apparatusModels.first,
            proporties: [
              ProgramSettingsProporties(
                name: 'Seats',
                value: 100,
                type: ProportiesType.seats,
              ),
              ProgramSettingsProporties(
                name: 'Pin',
                value: 100,
                type: ProportiesType.pin,
              ),
              ProgramSettingsProporties(
                name: 'Back',
                value: 100,
                type: ProportiesType.back,
              ),
              ProgramSettingsProporties(
                name: 'Handle',
                value: 100,
                type: ProportiesType.handle,
              ),
            ],
            weight: 65,
          ),
        ]))
    .toList();
List<String> programNames = [
  "A",
  "B",
  "C",
];
