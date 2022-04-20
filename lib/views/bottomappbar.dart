import 'package:flutter/material.dart';
import 'package:qaed/provider/inherted_widget.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = InhertedWidget.of(context)!;
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              onPressed: () {
                provider.changeBodyScreen(0,context);
              },
              icon: const Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                provider.changeBodyScreen(1,context);

              },
              icon: const Icon(Icons.bookmark),
            ),
            IconButton(
              onPressed: () {
                provider.changeBodyScreen(2,context);

              },
              icon: const Icon(Icons.settings),
            ),
            IconButton(
              onPressed: () {
                provider.changeBodyScreen(4,context);

              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}
