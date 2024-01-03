import "package:auto_route/auto_route.dart";
import "package:fitness_training/core/router/router.dart";
import 'package:fitness_training/domain/models/client_model.dart';
import "package:fitness_training/presentation/themes/app_colors.dart";
import "package:fitness_training/presentation/themes/app_fonts.dart";
import "package:fitness_training/presentation/widgets/training_program_widget.dart";
import "package:flutter/material.dart";

class TabBarTrainingWidget extends StatefulWidget {
  const TabBarTrainingWidget({
    super.key,
    required this.model,
  });

  final ClientModel model;
  @override
  State<TabBarTrainingWidget> createState() => _TabBarTrainingWidgetState();
}

class _TabBarTrainingWidgetState extends State<TabBarTrainingWidget> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    return Column(
      children: [
        DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Column(
            children: [
              TabBar(
                onTap: (value) {
                  currentTabIndex = value;
                  setState(() {});
                },
                tabAlignment: TabAlignment.center,
                labelColor: AppColors.black,
                unselectedLabelColor: AppColors.grey,
                indicatorColor: AppColors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                labelPadding: const EdgeInsets.all(10),
                dividerColor: AppColors.white,
                tabs: [
                  Tab(
                    height: 50,
                    child: Text(
                      "Current Program",
                      style: screenWidth > 600
                          ? AppFonts.w700s30.copyWith(
                              color: AppColors.black,
                            )
                          : AppFonts.w700s24.copyWith(
                              color: AppColors.black,
                            ),
                    ),
                  ),
                  Tab(
                    height: 50,
                    child: Text(
                      "Archieve",
                      style: screenWidth > 600
                          ? AppFonts.w500s30
                          : AppFonts.w500s24.copyWith(
                              color: AppColors.grey,
                            ),
                    ),
                  ),
                ],
                isScrollable: true,
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: TrainingProgramWidget(
            programs: currentTabIndex == 0
                ? widget.model.currentPrograms
                : widget.model.archievePrograms,
            onTap: () {
              AutoRouter.of(context).push(
                const CreateProgramRoute(),
              );
            },
          ),
        ),
      ],
    );
  }
}
