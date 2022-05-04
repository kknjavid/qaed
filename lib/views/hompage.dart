import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaed/controller/bodyscreen_controller.dart';
import 'package:qaed/views/bottomappbar.dart';
import 'package:qaed/views/years_screen.dart';

class HomePage extends GetView {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BodyScreenController bodyScreen = Get.put(BodyScreenController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("نرم افزار قائد"),
      ),
      body:Obx(()=>bodyScreen.widget.value),
      bottomNavigationBar: const CustomBottomAppBar(),
      
     
    );
  }
}
