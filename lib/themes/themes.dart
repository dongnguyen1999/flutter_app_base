import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

class Themes {
  // Light mode theme -------------------
  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
      primary: defaultLightAppColor,
      secondary: defaultLightSecondaryColor,
    ),
    iconTheme: const IconThemeData(color: defaultLightAppColor),
    buttonTheme: const ButtonThemeData(
      buttonColor: defaultLightAppColor,
    ),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: defaultWhiteColor),
    scaffoldBackgroundColor: defaultLightBackgroundColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: defaultLightAppColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    ),
    canvasColor: defaultLightAppColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      backgroundColor: defaultLightAppColor,
      selectedItemColor: defaultWhiteColor,
      unselectedItemColor: defaultWhiteColor.withOpacity(0.5),
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: defaultLightAppColor),
    sliderTheme: const SliderThemeData(
      inactiveTickMarkColor: Colors.transparent,
      activeTickMarkColor: Colors.transparent,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Colors.white),
      fillColor: MaterialStateProperty.all(defaultLightAppColor),
    ),
    dialogBackgroundColor: defaultLightBackgroundColor,
    toggleButtonsTheme: const ToggleButtonsThemeData(
      selectedColor: defaultLightAppColor,
      selectedBorderColor: Colors.transparent,
      borderColor: Colors.transparent,
      fillColor: Colors.transparent,
    ),
  );

  // Dark mode theme -------------------
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.light(
      primary: defaultDarkAppColor,
      secondary: defaultDarkSecondaryColor,
    ),
    iconTheme: IconThemeData(color: defaultDarkAppColor),
    buttonTheme: ButtonThemeData(
      buttonColor: defaultDarkAppColor,
    ),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: defaultBlackColor),
    scaffoldBackgroundColor: defaultDarkBackgroundColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: defaultDarkAppColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    ),
    canvasColor: defaultDarkAppColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      backgroundColor: defaultDarkAppColor,
      selectedItemColor: defaultBlackColor,
      unselectedItemColor: defaultBlackColor.withOpacity(0.5),
      elevation: 0,
    ),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: defaultDarkAppColor),
    sliderTheme: const SliderThemeData(
      inactiveTickMarkColor: Colors.transparent,
      activeTickMarkColor: Colors.transparent,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Colors.white),
      fillColor: MaterialStateProperty.all(defaultDarkAppColor),
    ),
    dialogBackgroundColor: defaultDarkBackgroundColor,
    toggleButtonsTheme: ToggleButtonsThemeData(
      selectedColor: defaultDarkAppColor,
      selectedBorderColor: Colors.transparent,
      borderColor: Colors.transparent,
      fillColor: Colors.transparent,
    ),
  );
}
