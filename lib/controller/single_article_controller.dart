import 'package:get/get.dart';
import 'package:techblog/constant/api_constant.dart';
import 'package:techblog/models/article_info_model.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/tags_model.dart';
import 'package:techblog/services/dio_service.dart';
import 'package:techblog/view/article/single.dart';

class SingleArticleController extends GetxController {
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxList<TagsModel> tagList = RxList();
  RxList<ArticleModel> relatedList = RxList();

  RxBool loading = false.obs;

  getArticleInfo(var id) async {
    articleInfoModel = ArticleInfoModel().obs;
    loading.value = true;

    // TODO: USER ID IS HARD CODE
    var userId = '';
    var response = await DioService().getMethod(
      "${ApiUrlConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId",
    );

    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);

      loading.value = false;
    }

    tagList.clear();
    response.data['tags'].forEach((element) {
      tagList.add(TagsModel.fromJson(element));
    });

    relatedList.clear();
    response.data['related'].forEach((element) {
      relatedList.add(ArticleModel.fromJson(element));
    });

    Get.to(Single());
  }
}
