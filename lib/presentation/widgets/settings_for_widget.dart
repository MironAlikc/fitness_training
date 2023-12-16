import "package:flutter/material.dart";

class SettingsForWidget extends StatelessWidget {
  const SettingsForWidget({
    required this.text,
    super.key,
    required this.controller,
  });
  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.left,
          text,
          style: const TextStyle(color: Colors.black),
        ),
        const SizedBox(height: 5),
        Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
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
