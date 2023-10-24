import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final Color _lightPrimaryColor = Colors.blueGrey.shade50;
  static final Color _lightPrimaryVariantColor = Colors.blueGrey.shade800;
  static final Color _lightOnPrimaryColor = Colors.blueGrey.shade50;
  static const Color _lightTextColorPrimary = Colors.black;
  static final Color _appbarColorLight = Colors.grey.shade300;
  static final Color _lightIconColor = Colors.black;

  static final Color _darkPrimaryColor = Colors.blueGrey.shade900; // card or container color
  static const Color _darkPrimaryVariantColor = Colors.black; 
  static const Color _darkOnPrimaryColor = const Color.fromARGB(255, 7, 6, 6); // body background color 
  static const Color _darkTextColorPrimary = Colors.white;
  static final Color _appbarColorDark = Colors.grey.shade900; // appbar color
  static final Color _darkIconColor = Colors.white;

  static const Color _iconColor = Colors.white;

  static final Color _accentColor = Colors.orangeAccent.shade400;

  static const TextStyle _lightHeadingText = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "Rubik",
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle _lightBodyText = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "Rubik",
    fontSize: 16,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
  );

  static const TextTheme _lightTextTheme = TextTheme(
    headlineLarge: _lightHeadingText,
    bodyLarge: _lightBodyText,
  );



  static final TextStyle _darThemeHeadingText = _lightHeadingText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeBodyText = _lightBodyText.copyWith(color: _darkTextColorPrimary);

  static final TextTheme _darkTextTheme = TextTheme(
    headlineLarge: _darThemeHeadingText,
    bodyLarge: _darkThemeBodyText,
  );


  // LIGHT THEME

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _lightOnPrimaryColor,
    appBarTheme: AppBarTheme(
      color: _appbarColorLight,
      iconTheme: IconThemeData(color: _iconColor),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: _appbarColorLight),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      onPrimary: _lightOnPrimaryColor,
      secondary: _accentColor,
      primaryContainer: _lightPrimaryVariantColor,
      tertiary: _lightIconColor,
    ),
    textTheme: _lightTextTheme,
    iconTheme: IconThemeData(color: _lightIconColor),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: _darkOnPrimaryColor,
    appBarTheme: AppBarTheme(
      color: _appbarColorDark,
      iconTheme: IconThemeData(color: _iconColor),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: _appbarColorDark),
    colorScheme: ColorScheme.dark(
      primary: _darkPrimaryColor,
      onPrimary: _darkOnPrimaryColor,
      secondary: _accentColor,
      primaryContainer: _darkPrimaryVariantColor,
      tertiary: _darkIconColor
    ),
    textTheme: _darkTextTheme,
    iconTheme: IconThemeData(color: _darkIconColor),
  );


}
