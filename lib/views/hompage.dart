import 'package:flutter/material.dart';
import 'package:qaed/provider/provider_state.dart';
import 'package:qaed/views/bottomappbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = InheritedProvider.of(context)!.state;
    return Scaffold(
      appBar: AppBar(
        title: const Text("نرم افزار قائد"),
      ),
      body: provider.bodyScreen,
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
