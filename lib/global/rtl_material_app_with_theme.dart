import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:qaed/controller/teme_mode.dart';
import 'package:qaed/global/custom_theme.dart';

Widget rtlMaterialAppWithTheme({required Widget child}) {
  return Obx(() {
    ThemeModeController modeController = Get.find();
    return GetMaterialApp(
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
      // debugShowCheckedModeBanner: false,
      locale: const Locale("fa", "Persian"),
      themeMode: modeController.theme.value,
      theme: customLightTheme(),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: "vazir",
          primaryColor: const Color.fromARGB(255, 65, 65, 65)),
      home: child,
    );
  });
}
