import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 39),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "History",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 24,
                fontFamily: "Inter",
                fontWeight: FontWeight.w800,
                height: 0,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Date',
              style: TextStyle(
                color: Color(0xFFA3A3A3),
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            Text(
              'Weight',
              style: TextStyle(
                color: Color(0xFFA3A3A3),
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            Text(
              'Time',
              style: TextStyle(
                color: Color(0xFFA3A3A3),
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            )
          ],
        ),
      ],
    );
  }
}
