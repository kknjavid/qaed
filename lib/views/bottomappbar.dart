import 'package:flutter/material.dart';
import 'package:qaed/global/custom_theme.dart';
import 'package:qaed/provider/provider_state.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = InheritedProvider.of(context)!;
    IconButton buttonBottombar(int index, IconData icon) {
      return IconButton(
        onPressed: () {
          provider.changeBodyScreen(index);
        },
        icon: Icon(icon),
      );
    }

    return ConvexAppBar(
      backgroundColor: mainColor,
      style: TabStyle.react,
      
      // ignore: prefer_const_literals_to_create_immutables
      items: [
        const TabItem(icon: Icons.home, title: 'خانه',),
        const TabItem(icon: Icons.bookmark, title: 'نشان شده'),
        const TabItem(icon: Icons.search, title: 'جستجو'),
        const TabItem(icon: Icons.info, title: 'درباره'),
        const TabItem(icon: Icons.logout, title: 'خروج'),
      ],
      initialActiveIndex: 0, //optional, default as 0
      onTap: (int i) =>provider.changeBodyScreen(i),
    );

    // BottomAppBar(
    //   shape: const CircularNotchedRectangle(),
    //   notchMargin: 0,
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       mainAxisSize: MainAxisSize.max,
    //       children: [
    //         buttonBottombar(0, Icons.home),
    //         buttonBottombar(1, Icons.bookmark),
    //         buttonBottombar(2, Icons.info),
    //         buttonBottombar(3, Icons.logout),

    //       ],
    //     ),
    //   ),
    // );
  }
}
