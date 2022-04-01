import 'package:flutter/material.dart';
import 'package:qaed/views/bottomappbar.dart';
import 'package:qaed/views/years_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("نرم افزار قائد"),
      ),
      body: const YearsScreen(),
      bottomNavigationBar: const CustomBottomAppBar(),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
        child: const Icon(Icons.search),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
