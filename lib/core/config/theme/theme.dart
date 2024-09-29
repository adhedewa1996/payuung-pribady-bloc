import 'package:flutter/material.dart';

class AppTheme {
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
      surface: Colors.white,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w400,
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
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(12),
      hintStyle: const TextStyle(
        color: Color(0xff383838),
        fontWeight: FontWeight.w500,
      ),
      // constraints: BoxConstraints.tight(
      //   const Size.fromHeight(50),
      // ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.white, width: 0.4)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(width: 0.4)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        surfaceTintColor: Colors.amber,
        foregroundColor: Colors.amber,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        surfaceTintColor: Colors.amber,
        foregroundColor: Colors.amber,
        side: BorderSide(
          color: Colors.amber,
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.amber; // the color when checkbox is selected;
          }
          return Colors.white; //the color when checkbox is unselected;
        },
      ),
      visualDensity: const VisualDensity(horizontal: -4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: const EdgeInsets.all(12),
        hintStyle: const TextStyle(
          color: Color(0xff383838),
          fontSize: 14.5,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white, width: 0.4),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 0.4),
        ),
        constraints: BoxConstraints.tight(
          const Size.fromHeight(50),
        ),
      ),
      menuStyle: MenuStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.amber; // the color when checkbox is selected;
            }
            return Colors.white; //the color when checkbox is unselected;
          },
        ),
      ),
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
      surface: Colors.black,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w400,
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
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(12),
      hintStyle: const TextStyle(
        color: Color(0xff383838),
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.white, width: 0.4)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(width: 0.4)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        surfaceTintColor: Colors.blue,
        foregroundColor: Colors.blue,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        surfaceTintColor: Colors.blue,
        foregroundColor: Colors.blue,
        side: BorderSide(
          color: Colors.blue,
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.blue; // the color when checkbox is selected;
          }
          return Colors.white; //the color when checkbox is unselected;
        },
      ),
      visualDensity: const VisualDensity(horizontal: -4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  );
}
