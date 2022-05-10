import 'package:group_button/group_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaed/controller/article_controller.dart';
import 'package:qaed/controller/search_controller.dart';
import 'package:qaed/global/custom_theme.dart';
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
                  counter: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GroupButton(
                        buttons: const ["در عنوان", "در متن"],
                        onSelected: (value, index, isSelected) {
                          searchController.tController.text == ""
                              ? Get.defaultDialog(
                                  title: "یاد آوری",
                                  content:
                                      const Text("ورودی نمی تواند خالی باشد"))
                              : searchController.search(index);
                        },
                        isRadio: true,
                        options: GroupButtonOptions(
                            unselectedTextStyle:
                                Theme.of(context).textTheme.bodySmall,
                            selectedColor: mainColor,
                            unselectedBorderColor:
                                Theme.of(context).dividerColor,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Text("نتایج جستجو: ${searchController.count}"),
                    ],
                  ),
                  border: const OutlineInputBorder(),
                ),
                onSubmitted: (val) {},
              ),
              if (searchController.loading.value)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else
                Expanded(
                  child: searchController.results.isEmpty
                      ? const Center(
                          child: Text("موردی یافت نشد"),
                        )
                      : ListView.builder(
                          itemCount: searchController.results[1].length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 1),
                              child: ListTile(
                                tileColor:
                                    const Color.fromARGB(34, 151, 151, 151),
                                onTap: () {
                                  Get.put(ArticleController()).getArticle(
                                      searchController.results[0][index].id);
                                  Get.to(
                                    ArticleContent(
                                        searchMode:
                                            searchController.searchMode.value,
                                        query:
                                            searchController.tController.text),
                                  );
                                },
                                leading: const Icon(Icons.search),
                                title: Text(
                                  searchController.results[0][index].title,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(
                                  searchController.results[0][index].date,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                trailing: Text(
                                    "${searchController.results[1][index].toString()} مورد"),
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
