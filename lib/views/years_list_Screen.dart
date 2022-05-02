import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:qaed/database/db_helper.dart';
import 'package:qaed/global/global_var.dart';
import 'package:qaed/views/article_content.dart';

class YearsListScreen extends StatelessWidget {
  const YearsListScreen({Key? key, required this.titleIndex}) : super(key: key);

  final int titleIndex;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DbHelper.instance.getAllArticleByYear((1401 - titleIndex)),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.data.isEmpty) {
            return const Text("اطلاعاتی یافت نشد");
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
                            Get.to(
                                () => ArticleContent(
                                    article: snapshot.data[index]),
                                transition: Transition.leftToRight,curve: Curves.ease);
                          },
                          leading: const Icon(Icons.library_books),
                          title: Text(
                            snapshot.data[index].title,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            snapshot.data[index].date,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      childCount: snapshot.data.length,
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
