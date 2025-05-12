import 'package:get/get.dart';
import 'package:techblog/controller/article/article_controller.dart';
import 'package:techblog/controller/article/manage_articles_controller.dart';
import 'package:techblog/controller/register_controller.dart';
import 'package:techblog/controller/single_article_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ArticleController());

    Get.lazyPut(() => SingleArticleController());
  }
}

class ArticleManagerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ManageArticleController());

  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());

    Get.lazyPut(() => SingleArticleController());
  }
}

