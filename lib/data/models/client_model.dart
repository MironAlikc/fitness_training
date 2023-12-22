import 'package:fitness_training/data/models/program_model.dart';

class ClientModel {
  final String name;
  final double weight;
  final double height;
  final DateTime birthday;
  final String phoneNumber;
  final String? notes;
  final String? photo;
  final List<ProgramModel> currentPrograms;
  final List<ProgramModel> archievePrograms;

  ClientModel({
    required this.name,
    required this.weight,
    required this.height,
    required this.birthday,
    required this.phoneNumber,
    this.currentPrograms = const <ProgramModel>[],
    this.archievePrograms = const <ProgramModel>[],
    this.notes,
    this.photo,
  });
}

