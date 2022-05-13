import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaed/controller/bodyscreen_controller.dart';
import 'package:qaed/controller/teme_mode.dart';
import 'package:qaed/views/bottomappbar.dart';
import 'package:flutter_switch/flutter_switch.dart';

class HomePage extends GetView {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BodyScreenController bodyScreen = Get.put(BodyScreenController());
    ThemeModeController modeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("نرم افزار قائد"),
        actions: [
          Obx(
            () => FlutterSwitch(
              value: modeController.mode.value,
              onToggle: (v) {
                modeController.change(v);
              },
              height: 30,
              width: 60,
              inactiveIcon: const Icon(
                Icons.nightlight,
                color: Color.fromARGB(255, 16, 0, 61),
              ),
              inactiveColor: const Color.fromARGB(103, 16, 0, 61),
              activeColor: const Color.fromARGB(118, 255, 255, 255),
              activeIcon: const Icon(
                Icons.sunny,
                color: Colors.amber,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Obx(() => bodyScreen.widget.value),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
