import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qaed/database/db_helper.dart';

class SearchController extends GetxController {
  final DbHelper _db = Get.find<DbHelper>();
  RxBool loading = false.obs;
  RxList results = [].obs;
  RxInt count = 0.obs;

  TextEditingController tController = TextEditingController();
  RxString query = "".obs;
  RxInt searchMode = 0.obs;
  RxInt queryCounts = 0.obs;

  Future search(int index) async {
    count(0);
    searchMode(index);
    loading(true);
    results.clear();
    queryCounts(0);
    await _db.search(tController.text, index).then((value) {
      if (value.isNotEmpty) {
      results(value);
      count(value.first.length);
        queryCounts(value[2]);
      }
      loading(false);
    });
    query(tController.text);
    // tController.clear();
    update();
  }
}
