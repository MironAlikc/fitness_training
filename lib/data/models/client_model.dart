import 'package:fitness_training/data/models/program_model.dart';
import 'package:fitness_training/resources/resources.dart';

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

abstract class ClientData {
  static List<ClientModel> client = [
    ClientModel(
      birthday: DateTime(2023, 11, 22),
      name: 'Aleksandr',
      weight: 70,
      height: 160,
      phoneNumber: '+ 380 632625621',
      photo: AppPngs.aleksandr,
    ),
    ClientModel(
      birthday: DateTime(2023, 11, 22),
      name: 'Anna',
      weight: 80,
      height: 180,
      phoneNumber: '+123 333 222 1111',
      photo: AppPngs.anna,
    ),
    ClientModel(
      birthday: DateTime(2023, 11, 22),
      name: 'Camilla',
      weight: 70,
      height: 160,
      phoneNumber: '+123 456 789 2222',
      photo: AppPngs.camilla,
    ),
    ClientModel(
      birthday: DateTime(2023, 11, 22),
      name: 'Andrew',
      weight: 70,
      height: 170,
      phoneNumber: '+123 456 789 8888',
      photo: AppPngs.user,
    ),
    ClientModel(
      birthday: DateTime(2023, 11, 22),
      name: 'Andrew Trainer',
      weight: 70,
      height: 200,
      phoneNumber: '+123 456 789 9192',
      photo: AppPngs.userImage,
    ),
  ];
}
