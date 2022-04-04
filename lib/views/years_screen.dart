import 'package:flutter/material.dart';
import 'package:qaed/database/article_model.dart';
import 'package:qaed/database/db_helper.dart';
import 'package:qaed/views/years_list_Screen.dart';

import '../global/rout_with_transition.dart';

class YearsScreen extends StatelessWidget {
  const YearsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int curYear = 1401;
    return FutureBuilder(
      future: DbHelper.instance.getAllArticle(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.all(2),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 34,
              itemBuilder: (BuildContext context, int index) {
                List<Article> articles = [];
                for (var i in snapshot.data) {
                  if (i.year == (curYear - index)) {
                    articles.add(i);
                  }
                }
                return GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage("assets/pics/${curYear - index}.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        customListTile(
                            text: "سال ${curYear - index}",
                            icon: Icons.calendar_month,
                            size: 14),
                        customListTile(
                            text: "${articles.length} سخنرانی",
                            icon: Icons.mic,
                            size: 14),
                      ],
                    ),
                  ),
                  onTap: () => Navigator.of(context).push(
                    customRoutForPush(
                      context: context,
                      horzentalOffset: -1,
                      verticalOffset: 0,
                      widget: YearsListScreen(
                        curYear: index,
                          articles: articles,
                          imgUrl: "assets/pics/${curYear - index}.jpg"),
                          
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }

  Widget customListTile(
          {required String text,
          required IconData icon,
          required double size}) =>
      TextButton.icon(
          onPressed: null,
          style: const ButtonStyle(
            visualDensity: VisualDensity(vertical: -4),
          ),
          icon: Icon(icon, color: Colors.white, size: size),
          label: Text(
            text,
            style: const TextStyle(color: Colors.white, shadows: [
              Shadow(
                color: Colors.black,
                blurRadius: 1,
                offset: Offset.zero,
              )
            ]),
          ));
}
