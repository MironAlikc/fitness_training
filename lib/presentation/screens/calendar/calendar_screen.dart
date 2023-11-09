import 'package:auto_route/auto_route.dart';
import 'package:fitness_training/presentation/widgets/list_calendar_widget.dart';
import 'package:fitness_training/resources/resources.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              ListView.builder(
                padding: const EdgeInsets.only(top: 50),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) => ListCalendarWidget(
                  onTap: () {},
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Image.asset(
                      AppPngs.calendar,
                      height: 30,
                      width: 30,
                    ),
                    onPressed: () {},
                  ),
                  hintText: "Search",
                  hintStyle: const TextStyle(
                    color: Color(0xFFA3A3A3),
                    fontSize: 18,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                  fillColor: const Color(0xFFF2F2F2).withAlpha(235),
                  filled: true,
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.white,
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
