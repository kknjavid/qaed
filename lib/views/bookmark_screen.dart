import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaed/controller/article_controller.dart';
import 'package:qaed/controller/fav_articles_controller.dart';
import 'package:qaed/views/article_content.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      FavArticlesController favController = Get.find();
      if (favController.loading.isTrue) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        if (favController.articles.isEmpty) {
          return const Center(
            child: Text("موردی یافت نشد"),
          );
        } else {
          return ListView.builder(
            itemCount: favController.articles.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 1),
                child: ListTile(
                  onTap: () {
                    Get.put(ArticleController())
                        .getArticle(favController.articles[index].id);
                    Get.to(() => const ArticleContent(),
                        transition: Transition.leftToRight, curve: Curves.ease);
                  },
                  leading: const Icon(Icons.library_books),
                  title: Text(
                    favController.articles[index].title,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    favController.articles[index].date,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            },
          );
        }
      }
    });
  }
}
