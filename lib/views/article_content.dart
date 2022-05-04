import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:qaed/controller/article_controller.dart';
import 'package:qaed/database/article_model.dart';

import '../global/rtl_material_app_with_theme.dart';

class ArticleContent extends StatelessWidget {
  const ArticleContent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      ArticleController controller = Get.find<ArticleController>();
      if (controller.loading.isTrue) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        if (controller.articles.isEmpty) {
          return const Scaffold(
            body: Center(
              child: Text("موردی یافت نشد"),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Get.back(),
              ),
              title: Text(controller.articles.first.date),
            ),
            body: SafeArea(
                child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: SelectableText(
                      controller.articles.first.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    margin: const EdgeInsets.only(bottom: 10),
                  ),
                  const Divider(indent: 50, endIndent: 50),
                  Expanded(
                      child: SingleChildScrollView(
                    child: SelectableText(controller.articles.first.detail,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(height: 2)),
                  ))
                ],
              ),
            )),
          );
        }
      }
    });
  }
}
