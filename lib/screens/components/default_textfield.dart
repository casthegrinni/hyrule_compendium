import 'package:flutter/material.dart';

class DefaultTextfield extends StatelessWidget {
  const DefaultTextfield(
      {required this.text, this.controller, this.obscureText, super.key});

  final String text;
  final TextEditingController? controller;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        labelText: text,
        border: null,
        filled: false,
        fillColor: Colors.grey.shade200,
      ),
    );
  }
}
