import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qaed/global/custom_theme.dart';

Widget rtlMaterialAppWithTheme({required Widget child}) => MaterialApp(
      title: 'qaed',
      // ignore: prefer_const_literals_to_create_immutables
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // ignore: prefer_const_literals_to_create_immutables
      supportedLocales: [
        const Locale('fa', ''), // farsi
      ],

      theme: customLightTheme(),
      darkTheme: ThemeData(brightness: Brightness.dark, fontFamily: "vazir"),
      home: child,
    );