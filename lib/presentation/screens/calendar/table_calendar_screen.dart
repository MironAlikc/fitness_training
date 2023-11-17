import 'package:auto_route/auto_route.dart';
import 'package:fitness_training/presentation/widgets/button_widget.dart';
import 'package:fitness_training/resources/resources.dart';
import 'package:fitness_training/router/router.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

@RoutePage()
class TableCalendarScreen extends StatefulWidget {
  const TableCalendarScreen({super.key});

  @override
  State<TableCalendarScreen> createState() => _TableCalendarScreenState();
}

class _TableCalendarScreenState extends State<TableCalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime today = DateTime.now();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  void _onDaySelectedA(DateTime day, DateTime focusedDay) {
    today = day;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {});
    _selectedDay = null;
    _focusedDay = focusedDay;
    _rangeStart = start;
    _rangeEnd = end;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leadingWidth: 70,
        backgroundColor: Colors.grey,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            AppPngs.back,
          ),
          onPressed: () {
            AutoRouter.of(context).pop(const CalendarRoute());
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TableCalendar(
                locale: "en_US",
                rowHeight: 43,
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                onDaySelected: _onDaySelectedA,
                rangeStartDay: _rangeStart,
                rangeSelectionMode: RangeSelectionMode.toggledOn,
                onRangeSelected: _onRangeSelected,
                rangeEndDay: _rangeEnd,
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: const TextStyle(color: Colors.black),
                ),
                calendarStyle: const CalendarStyle(
                  rangeHighlightColor: Colors.red,
                  isTodayHighlighted: false,
                  canMarkersOverflow: false,
                  outsideDaysVisible: false,
                  markersAutoAligned: false,
                  outsideTextStyle: TextStyle(color: Colors.red),
                  disabledTextStyle: TextStyle(color: Colors.red),
                  holidayTextStyle: TextStyle(color: Colors.red),
                  holidayDecoration: BoxDecoration(
                    border: Border.fromBorderSide(
                      BorderSide(color: Colors.red, width: 1.4),
                    ),
                    shape: BoxShape.circle,
                  ),
                  weekNumberTextStyle:
                      TextStyle(fontSize: 12, color: Colors.red),
                  weekendTextStyle: TextStyle(color: Colors.red),
                  // todayDecoration: const BoxDecoration(
                  //   color: Colors.red,
                  //   shape: BoxShape.rectangle,
                  // ),
                  selectedTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  rangeStartTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  rangeEndDecoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  rangeStartDecoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  rangeEndTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  markerDecoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  //rangeHighlightColor: Colors.black,
                  todayTextStyle: TextStyle(
                    color: Colors.black,
                    // backgroundColor: Colors.black,
                    decorationColor: Colors.green,
                    decorationStyle: TextDecorationStyle.dashed,
                  ),
                  //  outsideDaysVisible: false,
                ),
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    _calendarFormat = format;
                    setState(() {});
                  }
                }),
            Spacer(),
            // const SizedBox(height: 100),
            ButtonWidget(
              onPressed: () {},
              title: "Show Results",
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
