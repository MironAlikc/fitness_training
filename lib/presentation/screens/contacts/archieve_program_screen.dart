import 'package:auto_route/auto_route.dart';
import 'package:fitness_training/data/models/training_apparatus_model.dart';
import 'package:fitness_training/presentation/themes/app_colors.dart';
import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:fitness_training/resources/resources.dart';
import 'package:fitness_training/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ArchieveProgramScreen extends StatefulWidget {
  const ArchieveProgramScreen({
    super.key,
    required this.apparatus,
  });
  final List<TrainingApparatusModel> apparatus;

  @override
  State<ArchieveProgramScreen> createState() => _ArchieveProgramScreenState();
}

class _ArchieveProgramScreenState extends State<ArchieveProgramScreen> {
  void _removeSelectedApparatus() {
    setState(() {
      widget.apparatus
          .removeWhere((apparat) => _selectedApparatus.contains(apparat));
      _selectedApparatus.clear();
    });
  }

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
            AutoRouter.of(context).pop(const CreateProgramRoute());
          },
        ),
      ),
      body: Column(
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
            children: widget.apparatus.map((apparat) {
              return InkWell(
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
                            : AppColors.black,
                        fontSize: screenWidth > 600 ? 80 : 40,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //mainAxisSize: MainAxisSize.max,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth > 600 ? 450 : 160,
                  height: screenWidth > 600 ? 81 : 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFD7D4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    onPressed: () {
                      _removeSelectedApparatus();
                    },
                    child: Text(
                      'Restore',
                      textAlign: TextAlign.center,
                      style: screenWidth > 600
                          ? AppFonts.w700s25.copyWith(
                              color: const Color(0xFFFF5447),
                            )
                          : AppFonts.w700s18.copyWith(
                              color: const Color(0xFFFF5447),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth > 600 ? 450 : 160,
                  height: screenWidth > 600 ? 81 : 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.colorMain,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Restore',
                      textAlign: TextAlign.center,
                      style: screenWidth > 600
                          ? AppFonts.w700s25
                          : AppFonts.w700s18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
