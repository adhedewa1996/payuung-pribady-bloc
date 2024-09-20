import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
    // brightness: Brightness.dark,
    primaryColor: Colors.amber,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.amber,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.amber,
        secondary: Colors.red,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.amber,
      secondary: Colors.red,
      brightness: Brightness.light,
      background: Colors.white,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 12,
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontSize: 8,
      ),
    ),
    // NON CLICKABLE BUTTON
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    // CLICKABLE BUTTON
    primaryIconTheme: IconThemeData(
      color: Colors.black,
    ),
  );

  static final dark = ThemeData(
    // brightness: Brightness.light,
    primaryColor: Colors.blue,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.blue,
        secondary: Colors.pink,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.blue,
      secondary: Colors.pink,
      brightness: Brightness.dark,
      background: Colors.black,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 8,
      ),
    ),
    // NON CLICKABLE BUTTON
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    // CLICKABLE BUTTON
    primaryIconTheme: IconThemeData(
      color: Colors.white,
    ),
  );
}
