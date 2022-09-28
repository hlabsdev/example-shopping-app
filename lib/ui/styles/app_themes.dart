import 'package:assigame_market/logic/utils/utils.dart';
import 'package:assigame_market/ui/styles/styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,

      ///Principale
      primaryColor: AppColors.mainColor,
      accentColor: AppColors.accentColor,
      backgroundColor: AppColors.mainBackground,
      scaffoldBackgroundColor: AppColors.mainBackground,
      dialogBackgroundColor: AppColors.dialogBackground,
      cardColor: AppColors.cardBackground,
      bottomAppBarColor: AppColors.bottomAppBarColor,
      colorScheme: ColorScheme.fromSwatch(
              primarySwatch: FunctionUtils.createMaterialColor("D51A23"))
          .copyWith(
        secondary: AppColors.accentColor,
        primary: AppColors.mainColor,
        background: AppColors.mainBackground,
        surface: AppColors.accentColor,
        brightness: Brightness.light,
      ),

      ///Appbar
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.appBarColor,
        foregroundColor: AppColors.mainColor,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.mainColor),
        actionsIconTheme: IconThemeData(color: AppColors.mainColor),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Calibri',
        ),
      ),

      ///BottomNavbar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.assigameGrey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        backgroundColor: AppColors.bottomAppBarColor,
      ),

      // bottomAppBarTheme: BottomAppBarTheme(
      //   color: AppColors.bottomAppBarColor,
      // ),

      ///FLoating action button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.mainColor,
        elevation: 2,
      ),

      ///Dialog box
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.dialogBackground,
      ),

      ///Card
      // cardColor: cardBackground,
      cardTheme: CardTheme(
        color: AppColors.cardBackground,
        elevation: 2,
        shadowColor: AppColors.shadowColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),

      /// Texte
      // textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,

      ///Principale
      primaryColor: AppColors.mainColor,
      accentColor: AppColors.accentColor,
      backgroundColor: AppColors.darkMainBackground,
      scaffoldBackgroundColor: AppColors.darkMainBackground,
      dialogBackgroundColor: AppColors.darkDialogBackground,
      cardColor: AppColors.darkCardBackground,
      bottomAppBarColor: AppColors.darkBottomAppBarColor,
      colorScheme: ColorScheme.fromSwatch(
              primarySwatch: FunctionUtils.createMaterialColor("D51A23"))
          .copyWith(
        secondary: AppColors.accentColor,
        primary: AppColors.mainColor,
        background: AppColors.darkMainBackground,
        surface: AppColors.accentColor,
        brightness: Brightness.dark,
      ),

      ///Appbar
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkAppBarColor,
        foregroundColor: AppColors.mainColor,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.mainColor),
        actionsIconTheme: IconThemeData(color: AppColors.mainColor),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Calibri',
        ),
      ),

      ///BottomNavbar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.assigameGrey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        backgroundColor: AppColors.darkBottomAppBarColor,
      ),

      bottomAppBarTheme: BottomAppBarTheme(
        color: AppColors.darkBottomAppBarColor,
      ),

      ///FLoating action button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.mainColor,
        elevation: 2,
      ),

      ///Dialog box
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.darkDialogBackground,
      ),

      ///Card
      // cardColor: cardBackground,
      cardTheme: CardTheme(
        color: AppColors.darkCardBackground,
        elevation: 2,
        // shadowColor: shadowColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),

      /// Texte
      // textTheme: lightTextTheme,
    );
  }
}
