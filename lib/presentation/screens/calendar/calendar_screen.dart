import 'package:auto_route/auto_route.dart';
import 'package:fitness_training/data/models/appointment_model.dart';
import 'package:fitness_training/presentation/themes/app_colors.dart';
import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:fitness_training/presentation/widgets/grid_calendar_widget.dart';
import 'package:fitness_training/presentation/widgets/list_calendar_widget.dart';
import 'package:fitness_training/resources/resources.dart';
import 'package:fitness_training/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CalendarScreen extends StatefulWidget {
  const CalendarScreen({
    super.key,
  });

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final double width = screenWidth > 600 ? 50 : 34;
    final double height = screenWidth > 600 ? 50 : 34;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Stack(
            children: [
              screenWidth > 600
                  ? GridView.builder(
                      padding: const EdgeInsets.only(top: 70),
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (context, index) => GridCalendarWidget(
                        onTap: () {},
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(top: 50),
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      shrinkWrap: true,
                      itemCount: appointments.length,
                      itemBuilder: (context, index) => ListCalendarWidget(
                        onTap: () {},
                        appointment: appointments[index],
                      ),
                    ),
              TextField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Image.asset(
                      AppPngs.calendar,
                      height: height,
                      width: width,
                    ),
                    onPressed: () {
                      AutoRouter.of(context).push(
                        const TableCalendarRoute(),
                      );
                    },
                  ),
                  hintText: "Search",
                  hintStyle:
                      screenWidth > 600 ? AppFonts.w700s26 : AppFonts.w400s18,
                  fillColor: AppColors.colotSearch.withAlpha(235),
                  filled: true,
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.white,
                    ),
                  ),
                ),
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
