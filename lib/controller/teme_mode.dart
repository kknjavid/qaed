import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeModeController extends GetxController {
  Rx<ThemeMode> theme = Rx<ThemeMode>(ThemeMode.light);
  RxBool mode = false.obs;
  void change(v) {
    mode(v);
    mode.value ? theme(ThemeMode.dark) : theme(ThemeMode.light);
    update();
  }
}
