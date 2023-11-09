import 'package:fitness_training/resources/resources.dart';
import 'package:flutter/material.dart';

class GridCalendarWidget extends StatelessWidget {
  const GridCalendarWidget({
    required this.onTap,
    super.key,
  });
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      child: Stack(
        children: [
          InkWell(
            onTap: onTap,
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 37,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    AppPngs.user,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Anna Brown",
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 18,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                SizedBox(width: 18),
                Text(
                  "9.30 AM",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFA3A3A3),
                    fontSize: 16,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          // Material(
          //   color: Colors.transparent,
          //   child: InkWell(
          //     borderRadius: BorderRadius.circular(13),
          //     onTap: onTap,
          //   ),
          // ),
        ],
      ),
    );
  }
}
