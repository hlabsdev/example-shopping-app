// import 'dart:ui';

import 'package:flutter/material.dart';

///@Hlabs: Function for MaterialColor creation
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}
/*
class HlabsColor extends Color{
  HlabsColor(int value) : super(value);

  HlabsColor? withOpacity(double opacity){
    materialColor = createMaterialColor(color)
    assert(opacity >= 0.0 && opacity <= 1.0);
    return withAlpha((255.0 * opacity).round());
  }

}*/

///@Hlabs: A class defining the colors to be used throughout all the app
class AppColors {
  // createMaterialColor
  ///Couleur principale ecritures et titres
  static Color mainColor = const Color(0xFFD51A23);

  ///Couleur secondaire des boutons et element secondaires
  static Color accentColor = const Color(0xFFFFCF49);

  ///Arriere plan blanc principale
  static Color mainBackground = const Color(0xFFFFFFFF);

  // static Color mainBackground = const Color(0xFFE6E6EC);
  static Color darkMainBackground = const Color(0xFF3C3C3C);

  ///Arriere plan des card
  static Color cardBackground = const Color(0xFFFFFFFF);

  // static Color cardBackground = const Color(0xFFF1F1F6);
  static Color darkCardBackground = const Color(0xFF555555);

  ///Arriere plan blanc principale
  static Color appBarColor = const Color(0xFFFFFFFF);

  // static Color darkAppBarColor = const Color(0xFFFFFFFF);
  static Color darkAppBarColor = const Color(0xFF555555);

  ///Arriere plan gris du bottomAppbar
  static Color bottomAppBarColor = const Color(0xFF010101);
  static Color darkBottomAppBarColor = const Color(0xFF1E1E1E);

  ///Arriere plan des boite de dialogue
  static Color dialogBackground = const Color(0xFFFFFFFF);
  static Color darkDialogBackground = const Color(0xFF3A3A3A);

  ///Couleur des ombres...
  static Color shadowColor = const Color(0xFF828282);
  static Color darkShadowColor = const Color(0xFF828282);

  /*Custom colors start*/
  ///Couleur rouge por les bagdes bouttons ect...
  static Color assigameRed = const Color(0xFFD51A23);

  ///Couleur jaune por les bagdes bouttons ect...
  static Color assigameYellow = const Color(0xFFFFFF00);

  ///Couleur orange por les bagdes bouttons ect...
  static Color assigameOrange = const Color(0xFFFFCF49);

  ///Couleur blanche por les bagdes bouttons ect...
  static Color assigameWhite = const Color(0xFFFFFFFF);

  ///Couleur noire por les bagdes bouttons ect...
  static Color assigameBlack = const Color(0xFF010101);

  ///Couleur gris por les bagdes bouttons ect...
  static Color assigameGrey = const Color(0xFFA1A1A1);

  ///Couleur bleu por les bagdes bouttons ect...
  static Color assigameBlue = const Color(0xFF0D6EFD);

  ///Couleur verte por les bagdes bouttons ect...
  static Color assigameGreen = const Color(0xFF007C00);

// Couleur bleu por les bagdes bouttons ect...
// static Color assigameBlue = const Color(0xFF0D6EFD);

/*Custom colors end*/

}
