import 'package:fitness_training/resources/resources.dart';
import 'package:flutter/material.dart';

class GridContactsWidget extends StatelessWidget {
  const GridContactsWidget({required this.onTap, super.key});
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
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    AppPngs.userImage,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Aleksander",
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 18,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
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
