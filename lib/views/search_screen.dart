import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaed/controller/article_controller.dart';
import 'package:qaed/controller/search_controller.dart';
import 'package:qaed/views/article_content_screen.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        SearchController searchController = Get.put(SearchController());
        return Container(
          margin: const EdgeInsets.all(4),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: searchController.tController,
                decoration: InputDecoration(
                  hintText: "متن را وارد نمایید",
                  labelText: "جستجو",
                  counter: Text("نتایج جستجو: ${searchController.count}"),
                  border: const OutlineInputBorder(),
                ),
                onSubmitted: (val) {
                  searchController.tController.text == ""
                      ? Get.defaultDialog(
                          title: "تذکر",
                          content: const Text("ورودی نمی تواند خالی باشد"))
                      : searchController.search();
                },
              ),
              searchController.loading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: searchController.results.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 1),
                            child: ListTile(
                              tileColor:
                                  const Color.fromARGB(34, 151, 151, 151),
                              onTap: () {
                                Get.put(ArticleController()).getArticle(
                                    searchController.results[index].id);
                                Get.to(
                                  ArticleContent(
                                      searchMode: true,
                                      query: searchController.tController.text),
                                );
                              },
                              trailing: const Icon(
                                Icons.search,
                              ),
                              title: Text(
                                searchController.results[index].title,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                searchController.results[index].date,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        },
                      ),
                    )
            ],
          ),
        );
      },
    );
  }
}
