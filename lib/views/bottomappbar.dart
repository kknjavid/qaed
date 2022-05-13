import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:qaed/controller/bodyscreen_controller.dart';

class CustomBottomAppBar extends GetView {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BodyScreenController bodyScreen = Get.find<BodyScreenController>();
    return ConvexAppBar(
      backgroundColor: Theme.of(context).primaryColor,
      style: TabStyle.flip,
      items: const [
        TabItem(icon: Icons.home, title: 'خانه'),
        TabItem(icon: Icons.bookmarks, title: 'ذخیره'),
        TabItem(icon: Icons.search, title: 'جستجو'),
        TabItem(icon: Icons.info, title: 'درباره'),
        TabItem(icon: Icons.logout, title: 'خروج'),
      ],
      initialActiveIndex: 0, //optional, default as 0
      onTap: (int i) {
        if (i > 3) {
          SystemNavigator.pop();
        } else {
          bodyScreen.change(i);
        }
      },
    );
  }
}
