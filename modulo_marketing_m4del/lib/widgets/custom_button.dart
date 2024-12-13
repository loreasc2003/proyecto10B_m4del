import 'package:flutter/material.dart';

// Botón reutilizable con un estilo personalizado
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey, // Color de fondo (anteriormente 'primary')
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Relleno
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Bordes redondeados
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}
