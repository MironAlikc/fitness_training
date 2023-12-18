import 'package:fitness_training/presentation/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';

class UserInfoTextFieldWidget extends StatelessWidget {
  const UserInfoTextFieldWidget({
    super.key,
    required this.text,
    required this.hintText,
    this.onChanged,
  });
  final String text;
  final String hintText;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xFF1E1E1E),
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ),
        const SizedBox(height: 10),
        CustomTextFieldWidget(
          hintText: hintText,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
