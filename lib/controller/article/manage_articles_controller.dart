import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/constant/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/services/dio_service.dart';

class ManageArticleController extends GetxController{

  RxList<ArticleModel> articleList = RxList.empty();

  getManagedArticle(int id) async{
    //TODO: get user id from storage + user id
    var response = await DioService().getMethod(ApiUrlConstant.publishedByMe+GetStorage().read(key));

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

    }
  }


}