import 'package:get/get.dart';
import 'package:qaed/database/db_helper.dart';

import '../database/article_model.dart';

class FavArticlesController extends GetxController {
  final DbHelper _db = Get.find<DbHelper>();

  RxBool loading = false.obs;
  RxList<Article> articles = <Article>[].obs;

  Future<void> getArticles() async {
    loading(true);
    await _db.getFavArticles().then((value) {
      articles.clear();
      articles.assignAll(value);
      loading(false);
    });
    update();
  }

  Future<void> favRemove(int id) async {
    await _db.favRemove(id).then((value) {
      getArticles();
      // refresh();
      update();
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getArticles();
  }
}
