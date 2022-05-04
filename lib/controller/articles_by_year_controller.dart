import 'package:get/get.dart';
import 'package:qaed/database/article_model.dart';
import 'package:qaed/database/db_helper.dart';

class ArticlesByYearController extends GetxController {
  final DbHelper _db = Get.find<DbHelper>();

  RxBool loading = false.obs;
  RxList<Article> articles = <Article>[].obs;

  Future<void> getArticles(int year) async {
    loading(true);
    await _db.getAllArticleByYear(year).then((value) {
      articles.clear();
      articles(value);
      loading(false);
    });
    update();
  }
}
