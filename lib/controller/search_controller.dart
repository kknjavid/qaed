import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qaed/database/db_helper.dart';

class SearchController extends GetxController {
  final DbHelper _db = Get.find<DbHelper>();
  RxBool loading = false.obs;
  RxList results = [].obs;
  RxInt count = 0.obs;

  TextEditingController tController = TextEditingController();
  RxInt searchMode = 0.obs;

  Future search(int index) async {
    count(0);
    searchMode(index);
    loading(true);
    results.clear();
    await _db.search(tController.text, index).then((value) {
      results(value);
      count(value.first.length);
      loading(false);
    });
    update();
  }
}
