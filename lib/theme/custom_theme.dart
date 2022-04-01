import 'package:flutter/material.dart';

const mainColor = Color.fromARGB(255, 0, 66, 121);
const accentMainColor = Color.fromARGB(255, 0, 97, 177);

ThemeData customLightTheme() => ThemeData(
    primaryColor: mainColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: mainColor,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: mainColor,
      elevation: 50,
      shape: CircularNotchedRectangle(),
    ),
    
    iconTheme: const IconThemeData(
      color: Color.fromARGB(207, 255, 255, 255),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: accentMainColor,
    ),
    );
