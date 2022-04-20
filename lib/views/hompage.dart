import 'package:flutter/material.dart';
import 'package:qaed/provider/inherted_widget.dart';
import 'package:qaed/views/bottomappbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = InhertedWidget.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("نرم افزار قائد"),
      ),
      body: provider.state.bodyScreen,
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
