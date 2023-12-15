import 'package:flutter/material.dart';

class ProgramInformationWidget extends StatelessWidget {
  const ProgramInformationWidget({
    super.key,
    required this.image,
    required this.text,
    required this.textInt,
  });

  final String image;
  final String text;
  final String textInt;
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 50,
          width: 50,
          color: Colors.black,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Color(0xFFA3A3A3),
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              textInt,
              style: const TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 34,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ],
        )
      ],
    );
  }
}
