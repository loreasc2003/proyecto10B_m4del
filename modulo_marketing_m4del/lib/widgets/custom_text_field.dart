import 'package:flutter/material.dart';

// Campo de texto reutilizable con un estilo personalizado
class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;

  CustomTextField({required this.label, required this.controller, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }
}
