import 'package:fitness_training/domain/models/training_apparatus_model.dart';

class ProgramSettingsModel {
  final TrainingApparatusModel apparat;
  final List<ProgramSettingsProporties> proporties;
  final int weight;

  ProgramSettingsModel({
    required this.apparat,
    this.proporties = const <ProgramSettingsProporties>[],
    this.weight = 0,
  });
}

class ProgramSettingsProporties {
  final String name;
  final int value;
  final ProportiesType type;

  ProgramSettingsProporties({
    required this.name,
    required this.value,
    required this.type,
  });
}

enum ProportiesType {
  seats,
  back,
  pin,
  handle,
}
