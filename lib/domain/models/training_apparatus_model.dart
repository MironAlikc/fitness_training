
class TrainingApparatusModel {
  final String name;

  TrainingApparatusModel({
    required this.name,
  });
}

List<TrainingApparatusModel> apparatusModels = apparatusNames
    .toSet()
    .map((name) => TrainingApparatusModel(name: name))
    .toList();

List<String> apparatusNames = [
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
  "J1"
];
