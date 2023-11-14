import 'package:fitness_training/presentation/themes/app_fonts.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.hintText,
    this.keyboardType,
    this.errorText,
  });
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    return SizedBox(
      width: 548,
      height: 80,
      child: TextField(
        style: screenWidth > 600 ? AppFonts.w500s25 : AppFonts.w500s18,
        keyboardType: keyboardType,
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          errorText: errorText,
          contentPadding: const EdgeInsets.all(20.0),
          suffixIcon: suffix,
          prefix: prefix,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
