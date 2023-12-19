import 'package:fitness_training/data/models/training_apparatus_model.dart';

class ProgramSettingsModel {
  final TrainingApparatusModel apparat;
  final List<ProgramSettingsProporties> proporties;
  final int weight;

  ProgramSettingsModel({
    required this.apparat,
    required this.proporties,
    required this.weight,
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
