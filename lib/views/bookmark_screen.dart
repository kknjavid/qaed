import 'package:flutter/material.dart';
import 'package:qaed/database/db_helper.dart';


class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: DbHelper.instance.getAllFavArticles(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text("data");
                },
              );
            }
          },
        ),
      ),
    );
  }
}
