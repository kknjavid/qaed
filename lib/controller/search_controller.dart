import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qaed/database/article_model.dart';
import 'package:qaed/database/db_helper.dart';

class SearchController extends GetxController {
  final DbHelper _db = Get.find<DbHelper>();
  RxBool loading = false.obs;
  RxList<Article> results = <Article>[].obs;
  RxInt count = 0.obs;

  TextEditingController tController = TextEditingController();

  Future search() async {
    count(0);
    loading(true);
    results.clear();
    await _db.search(tController.text).then((value) {
      results(value);
      count(value.length);
      loading(false);
    });
    // tController.clear();
    update();
  }
  
}
