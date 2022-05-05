import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaed/controller/article_controller.dart';
import 'package:qaed/controller/articles_by_year_controller.dart';
import 'package:qaed/global/global_var.dart';
import 'package:qaed/views/article_content_screen.dart';

class YearsListScreen extends StatelessWidget {
  const YearsListScreen({Key? key, required this.titleIndex}) : super(key: key);

  final int titleIndex;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        ArticlesByYearController controller =
            Get.find<ArticlesByYearController>();
        if (controller.loading.isTrue) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (controller.articles.isEmpty) {
            return const Scaffold(
                body: Center(child: Text("اطلاعاتی یافت نشد")));
          } else {
            return SafeArea(
              child: Scaffold(
                body: CustomScrollView(slivers: [
                  SliverAppBar(
                    stretch: true,
                    leading: IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_back)),
                    expandedHeight: 300,
                    floating: true,
                    pinned: true,
                    primary: false,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image(
                          image: AssetImage(
                              "assets/pics/${1401 - titleIndex}.jpg"),
                          fit: BoxFit.cover),
                      title: Text(
                        yearsNameList[titleIndex],
                        style: const TextStyle(fontSize: 12, shadows: [
                          Shadow(color: Colors.black, blurRadius: 4)
                        ]),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 1),
                        child: ListTile(
                          onTap: () {
                            Get.put(ArticleController())
                                .getArticle(controller.articles[index].id);
                            Get.to(() => const ArticleContent(),
                                transition: Transition.leftToRight,
                                curve: Curves.ease);
                          },
                          leading: const Icon(Icons.library_books),
                          title: Text(
                            controller.articles[index].title,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            controller.articles[index].date,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      childCount: controller.articles.length,
                    ),
                  ),
                ]),
              ),
            );
          }
        }
      },
    );
  }
}
