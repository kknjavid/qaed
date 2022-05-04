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
      articles(value);
      loading(false);
    });
    update();
  }
}
