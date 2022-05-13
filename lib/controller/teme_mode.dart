import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeModeController extends GetxController {
  Rx<ThemeMode> theme = Rx<ThemeMode>(ThemeMode.system);
  RxBool mode = ThemeMode.system == ThemeMode.light ? false.obs : true.obs;
  void change(v) {
    mode(v);
    mode.value ? theme(ThemeMode.light) : theme(ThemeMode.dark);
    update();
  }
}
