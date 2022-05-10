import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaed/controller/article_controller.dart';
import 'package:qaed/global/custom_theme.dart';
import 'package:qaed/global/search_highlight.dart';

class ArticleContent extends StatelessWidget {
  ArticleContent({Key? key, this.searchMode, this.query}) : super(key: key);
  int? searchMode;
  String? query = "";
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
              title: Text( controller.articles.first.date),
              actions: [
                IconButton(
                    onPressed: () {
                      Get.dialog(AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        title: SizedBox(
                            height: 5,
                            child: Obx(
                              () => Slider(
                                  value: controller.fontSize.value,
                                  label: controller.fontSize.value
                                      .toInt()
                                      .toString(),
                                  max: 32,
                                  min: 12,
                                  divisions: 10,
                                  thumbColor: mainColor,
                                  onChanged: (value) {
                                    controller.changeFontSize(value);
                                  }),
                            )),
                      ));
                    },
                    icon: const Icon(Icons.article))
              ],
            ),
            body: SafeArea(
                child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: SelectableText.rich(
                      
                      searchMode == 0
                          ? TextSpan(
                            
                              children: highlightOccurrences(
                                  controller.articles.first.title, query!))
                          : TextSpan(text: controller.articles.first.title),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    margin: const EdgeInsets.only(bottom: 10),
                  ),
                  const Divider(indent: 50, endIndent: 50),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SelectableText.rich(
                            searchMode == 1
                                ? TextSpan(
                                    children: highlightOccurrences(
                                        controller.articles.first.detail, query!))
                                : TextSpan(
                                    text: controller.articles.first.detail),
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                height: 2,
                                fontSize: controller.fontSize.value)),
                        const SizedBox(height: 60),
                      ],
                    ),
                  ))
                ],
              ),
            )),
            floatingActionButton: FloatingActionButton.small(
              onPressed: () {
                controller.changeFav(controller.articles.first);

                Get.snackbar(
                    controller.articles.first.fav == 0
                        ? "به لیست ذخیره افزوده شد"
                        : "از لیست ذخیره حذف شد",
                    "",
                    snackPosition: SnackPosition.BOTTOM,
                    duration: const Duration(seconds: 1),
                    backgroundColor: const Color.fromARGB(131, 0, 0, 0));
              },
              child: Icon(controller.articles.first.fav == 0
                  ? Icons.bookmark_outline
                  : Icons.bookmark),
            ),
          );
        }
      }
    });
  }
}
