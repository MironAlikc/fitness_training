import "package:flutter/material.dart";

class SettingsForWidget extends StatelessWidget {
  const SettingsForWidget({
    required this.text,
    // required this.textName,
    super.key,
  });
  final String text;
  // final String textName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.left,
          text,
          style: const TextStyle(color: Colors.black),
        ),
        const SizedBox(height: 10),
        Container(
          height: 50,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              hintText: "_",
            ),
          ),
        ),
      ],
    );
  }
}