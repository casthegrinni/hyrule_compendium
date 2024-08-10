import 'package:flutter/material.dart';

class DefaultTextfield extends StatelessWidget {
  const DefaultTextfield({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: text,
        border: null,
        filled: false,
        fillColor: Colors.grey.shade200,
      ),
    );
  }
}
