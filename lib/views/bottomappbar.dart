import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:qaed/global/custom_theme.dart';
import 'package:qaed/provider/inherted_widget.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = InhertedWidget.of(context)!;
    return ConvexAppBar(
      backgroundColor: Theme.of(context).primaryColor,
      style: TabStyle.flip,
      items: const [
        TabItem(icon: Icons.home, title: 'خانه'),
        TabItem(icon: Icons.bookmark, title: 'ذخیره'),
        TabItem(icon: Icons.search, title: 'جستجو'),
        TabItem(icon: Icons.info, title: 'درباره ما'),
        TabItem(icon: Icons.logout, title: 'خروج'),
      ],
      initialActiveIndex: 0, //optional, default as 0
      onTap: (int i) => provider.changeBodyScreen(i, context),
    );
  }
}
