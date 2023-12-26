import 'package:fitness_training/data/models/program_model.dart';
import 'package:flutter/material.dart';

class TrainingProgramWidget extends StatelessWidget {
  const TrainingProgramWidget({
    super.key,
    required this.programs,
    required this.onTap,
  });
  final List<ProgramModel> programs;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      shrinkWrap: true,
      itemCount: programs.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 66,
            padding: const EdgeInsets.all(20),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Text(
              textAlign: TextAlign.center,
              'Program ${programs[index].name}',
              style: const TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w800,
                height: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
