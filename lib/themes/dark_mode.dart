import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.green.shade600,
    secondary: Colors.grey.shade600,
    onBackground: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    surface: Colors.green.shade600, // Couleur personnalisée pour le bouton d'envoi
  ),
);



/**import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade900,
    primary: Colors.green.shade600,
    secondary: Colors.grey.shade600,
    tertiary: Colors.grey,
    inversePrimary: Colors.white,
  )
);*/