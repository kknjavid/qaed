import 'package:get/get.dart';
import 'package:qaed/controller/fav_articles_controller.dart';
import 'package:qaed/database/article_model.dart';
import 'package:qaed/database/db_helper.dart';

class ArticleController extends GetxController {
  final DbHelper _db = Get.find<DbHelper>();
  RxBool loading = false.obs;
  RxList<Article> articles = <Article>[].obs;
  RxDouble fontSize = 16.0.obs;

  


  void getArticle(int id) async {
    loading(true);
    await _db.getArticle(id).then((value) {
      articles.clear();
      articles.assignAll(value);
      loading(false);
    });
    update();
  }

  void changeFav(Article article) async {
    await _db.changeFav(article).then((value) {
      FavArticlesController favArticlesController =
          Get.put(FavArticlesController());
      favArticlesController.getArticles();
      getArticle(article.id);
      update();
    });
  }

  void changeFontSize(double size) {
    fontSize(size);
    refresh();
    update();
  }
}
