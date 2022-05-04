import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaed/views/bookmark_screen.dart';
import 'package:qaed/views/info_screen.dart';
import 'package:qaed/views/search_screen.dart';
import 'package:qaed/views/years_screen.dart';

class BodyScreenController extends GetxController {
  Rx<Widget> widget = Rx<Widget>(const YearsScreen());

  void change(int index) {
    List wList = [
      const YearsScreen(),
      const BookmarkScreen(),
      const SearchScreen(),
      const InfoScreen()
    ];
    widget.value = wList[index];
    update();
  }
}
