import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:qaed/global/custom_theme.dart';

Widget rtlMaterialAppWithTheme({required Widget child}) => GetMaterialApp(
      title: 'qaed',
      // ignore: prefer_const_literals_to_create_immutables
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // ignore: prefer_const_literals_to_create_immutables
      supportedLocales: [
        const Locale('fa', 'Persian'), // farsi
      ],
      locale: const Locale("fa", "Persian"),
      theme: customLightTheme(),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: "vazir",
          primaryColor: const Color.fromARGB(255, 65, 65, 65)),
      home: child,
    );
