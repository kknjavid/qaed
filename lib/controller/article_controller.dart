import 'package:get/get.dart';
import 'package:qaed/database/article_model.dart';
import 'package:qaed/database/db_helper.dart';

class ArticleController extends GetxController {
  final DbHelper _db = Get.find<DbHelper>();
  RxBool loading = false.obs;
  RxList<Article> articles = <Article>[].obs;

  void getArticle(int id) async {
    loading(true);
    await _db.getArticle(id).then((value) {
      articles.clear();
      articles(value);
      loading(false);
    });
    update();
  }

  void changeFav(Article article) async {
    loading(true);
    await _db.changeFav(article).then((value) {
      getArticle(article.id);
      loading(false);
    });
  }
}
