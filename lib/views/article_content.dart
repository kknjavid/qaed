import 'package:flutter/material.dart';
import 'package:qaed/database/article_model.dart';

import '../global/rtl_material_app_with_theme.dart';

class ArticleContent extends StatelessWidget {
  const ArticleContent({Key? key, required this.article}) : super(key: key);
  final Article article;
  @override
  Widget build(BuildContext context) {
    return rtlMaterialAppWithTheme(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(article.date),
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
                    article.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  margin: const EdgeInsets.only(bottom: 10),
                ),
                const Divider(indent: 50, endIndent: 50),
                Expanded(
                    child: SingleChildScrollView(
                  child: SelectableText(article.detail,
                      textAlign: TextAlign.justify, style: const TextStyle(height: 2)),
                ))
              ],
            ),
          )),
        ));
  }
}
