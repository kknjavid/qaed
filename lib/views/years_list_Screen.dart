import 'package:flutter/material.dart';
import 'package:qaed/database/article_model.dart';
import 'package:qaed/global/global_var.dart';
import 'package:qaed/views/article_content.dart';
import '../global/rout_with_transition.dart';
import '../global/rtl_material_app_with_theme.dart';

class YearsListScreen extends StatelessWidget {
  const YearsListScreen(
      {Key? key, required this.imgUrl, required this.articles, required this.curYear})
      : super(key: key);
  final String imgUrl;
  final List<Article> articles;
  final int curYear;
  @override
  Widget build(BuildContext context) {
    return rtlMaterialAppWithTheme(
      child: SafeArea(
        child: Scaffold(
          body: CustomScrollView(slivers: [
            SliverAppBar(
              stretch: true,
              leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back)),
              expandedHeight: 300,
              floating: true,
              pinned: true,
              primary: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Image(image: AssetImage(imgUrl), fit: BoxFit.cover),
                title: Text(
                 curYear!=33? "سال ${ yearsNameList[curYear]}":yearsNameList[curYear],
                  style: const TextStyle(
                      fontSize: 12,
                      shadows: [Shadow(color: Colors.black, blurRadius: 4)]),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          // color: Color.fromARGB(255, 219, 219, 217),
                          borderRadius: BorderRadius.circular(10)),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 1),
                      child: TextButton(
                        child: ListTile(
                          leading: const Icon(Icons.library_books),
                          title: Text(
                            articles[index].title,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            articles[index].date,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        onPressed: () => Navigator.of(context).push(
                          customRoutForPush(
                            context: context,
                            widget: ArticleContent(article: articles[index]),
                            horzentalOffset: -1,
                            verticalOffset: 0,
                          ),
                        ),
                      ),
                    ),
                    const Divider()
                  ],
                ),
                childCount: articles.length,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
