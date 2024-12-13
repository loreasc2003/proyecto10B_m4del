// lib/theme.dart

import 'package:flutter/material.dart';

// Definir el tema de la aplicación
final ThemeData appTheme = ThemeData(
  // Barra de navegación
  appBarTheme: AppBarTheme(
    color: Colors.red, // Fondo de la AppBar
    elevation: 4,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
  ),
);
