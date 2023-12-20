import "package:fitness_training/presentation/themes/app_colors.dart";
import "package:fitness_training/presentation/themes/app_fonts.dart";
import "package:flutter/material.dart";

class TabBarTrainingWidget extends StatefulWidget {
  const TabBarTrainingWidget({super.key});

  @override
  State<TabBarTrainingWidget> createState() => _TabBarTrainingWidgetState();
}

class _TabBarTrainingWidgetState extends State<TabBarTrainingWidget> {
  List<Widget> tabItems = [
    const Text(
      "Program A",
      style: AppFonts.w500s24,
    ),
    const Text(
      "Program B",
      style: AppFonts.w500s24,
    ),
  ];
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
              const SizedBox(height: 16),
            ],
          ),
        ),
        SingleChildScrollView(child: tabItems[currentTabIndex]),
      ],
    );
  }
}
