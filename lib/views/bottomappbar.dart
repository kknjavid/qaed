import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:qaed/provider/bodyScreen.dart';

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
        TabItem(icon: Icons.info, title: 'درباره ما'),
        TabItem(icon: Icons.logout, title: 'خروج'),
      ],
      initialActiveIndex: 0, //optional, default as 0
      onTap: (int i) =>bodyScreen.change(i),
    );
  }
}
