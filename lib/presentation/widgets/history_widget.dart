import 'package:fitness_training/data/models/history_training_model.dart';
import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryWidget extends StatelessWidget {
  HistoryWidget({super.key, required this.historyModel});

  final HistoryTrainihgModel historyModel;
  // final historyModel = HistoryTrainihgModel(
  //   weight: 20,
  //   time: const Duration(hours: 1),
  //   date: DateTime.now(),
  // );
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 39),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "History",
              textAlign: TextAlign.start,
              style: screenWidth > 600 ? AppFonts.w800s34 : AppFonts.w800s24,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Date',
              style: screenWidth > 600 ? AppFonts.w500s24 : AppFonts.w500s18,
            ),
            Text(
              'Weight',
              style: screenWidth > 600 ? AppFonts.w500s24 : AppFonts.w500s18,
            ),
            Text(
              'Time',
              style: screenWidth > 600 ? AppFonts.w500s24 : AppFonts.w500s18,
            ),
          ],
        ),
        ListView.builder(
          padding: const EdgeInsets.only(top: 5),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 20, right: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat.yMd().format(historyModel.date),
                  style:
                      screenWidth > 600 ? AppFonts.w500s24 : AppFonts.w500s18,
                ),
                Text(
                  historyModel.weight.toString(),
                  style:
                      screenWidth > 600 ? AppFonts.w500s24 : AppFonts.w500s18,
                ),
                Text(
                  historyModel.time.inMinutes.toString(),
                  style:
                      screenWidth > 600 ? AppFonts.w500s24 : AppFonts.w500s18,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
