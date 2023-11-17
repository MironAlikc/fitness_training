import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

class CustomTimerWidget extends StatelessWidget {
  const CustomTimerWidget({
    required this.onPressed,
    required this.title,
    required this.image,
    super.key,
  });
  final Function() onPressed;
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: (screenWidth > 600) ? 190 : 160,
        height: (screenWidth > 600) ? 200 : 150,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 7.32,
              offset: Offset(0, 7.32),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SvgPicture.asset(
                image,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFFC8CE37),
                  fontSize: 24,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
