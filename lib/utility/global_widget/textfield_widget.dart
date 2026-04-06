import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final String label;
  final String text;
  final String hintText;
  final String errorText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final TextEditingController controller;
  const TextfieldWidget({
    super.key,
    required this.label,
    required this.text,
    required this.hintText,
    required this.errorText,
    required this.prefixIcon,
    required this.controller,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.blue[900],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            errorText: errorText.isNotEmpty ? errorText : null,
          ),
        ),
      ],
    );
  }
}
