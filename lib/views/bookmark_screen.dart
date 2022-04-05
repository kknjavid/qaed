import 'package:flutter/material.dart';
import 'package:qaed/database/db_helper.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: DbHelper.instance.getAllArticle(),
        builder: (BuildContext context, AsyncSnapshot snapshot) =>
            CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text("نشان شده ها"),
              centerTitle: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image(image: AssetImage("assets/bookmarkBg.jpg")),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) => Container(),
            ))
          ],
        ),
      );
}
