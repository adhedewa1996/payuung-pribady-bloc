import 'package:bloc/bloc.dart';
import 'package:calculator_camera/app/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    // brightness: Brightness.light,
    primaryColor: Colors.green,
    primarySwatch: Colors.amber,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.green,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.green,
      disabledColor: Colors.grey,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.green,
        secondary: Colors.amber,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.green,
      secondary: Colors.blue,
      brightness: Brightness.dark,
      surface: Colors.black,
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

  static final _darkTheme = ThemeData(
    // brightness: Brightness.light,
    primaryColor: Colors.red,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.red,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.red,
      disabledColor: Colors.grey,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.red,
        secondary: Colors.amber,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.red,
      secondary: Colors.blue,
      brightness: Brightness.dark,
      surface: Colors.black,
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

  void toggleTheme() {
    if (AppContants.variantRed.contains(FlutterConfig.get('APP_SUFFIX_ID'))) {
      emit(_darkTheme);
    } else {
      emit(_lightTheme);
    }
    // if (state.brightness == Brightness.dark) {
    //   emit(_lightTheme);
    // } else {
    //   emit(_darkTheme);
    // }
  }
}
