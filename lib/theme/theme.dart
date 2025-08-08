import 'package:flutter/material.dart';

final darkTheme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.dark().copyWith(
    primary: Colors.yellow, // Define your primary seed color
  ),
  scaffoldBackgroundColor: Color.fromARGB(255, 31, 31, 31),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.yellow,
    foregroundColor: Colors.black,
  ),
  dividerColor: Colors.black,
  dividerTheme: DividerThemeData(color: Colors.white12),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: Color.fromARGB(255, 31, 31, 31),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  ),
  textTheme: TextTheme(
    bodyMedium: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    labelSmall: const TextStyle(
      color: Colors.white54,
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
    titleMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 32,
    ),
  ),
);
