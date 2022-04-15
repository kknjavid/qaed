import 'package:flutter/material.dart';
import 'package:qaed/database/db_helper.dart';
import 'package:qaed/global/global_var.dart';
import 'package:qaed/global/rtl_material_app_with_theme.dart';
import 'package:qaed/views/article_content.dart';

class YearsListScreen extends StatelessWidget {
  const YearsListScreen({Key? key, required this.year, required this.yearIndex})
      : super(key: key);
  final int year;
  final int yearIndex;
  @override
  Widget build(BuildContext context) {
    return rtlMaterialAppWithTheme(
      home: Scaffold(
        body: SafeArea(
          child: FutureBuilder(
            future: DbHelper.instance.getAllArticleByYear(year),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                // print("snapshot data: ${snapshot.data.length}");
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      // leading: IconButton(
                      //     onPressed: () {
                      //       Navigator.of(context).pop();
                      //     },
                      //     icon: Icon(Icons.arrow_back)),
                      floating: true,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Image(
                          image: AssetImage("assets/pics/${year}.jpg"),
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          "سال ${yearsNameList[yearIndex]}",
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              shadows: [
                                Shadow(color: Colors.black, blurRadius: 1)
                              ]),
                        ),
                      ),
                      expandedHeight: 250,
                      pinned: true,
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        ((context, index) => Container(
                              color: const Color.fromARGB(255, 233, 231, 231),
                              margin: const EdgeInsets.all(1),
                              child: GestureDetector(
                                child: ListTile(
                                  leading: const Icon(Icons.library_books),
                                  title: Text(
                                    snapshot.data[index].title,
                                    style: const TextStyle(
                                      // fontSize: 14,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ArticleContent(
                                          article: snapshot.data[index]),
                                    ),
                                  );
                                },
                              ),
                            )),
                        childCount: snapshot.data!.length,
                      ),
                    )
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
