import 'package:get/state_manager.dart';
import 'package:techblog/constant/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/podcast_model.dart';
import 'package:techblog/models/poster_model.dart';
import 'package:techblog/services/dio_service.dart';

class HomeScreenController extends GetxController {

  Rx<PosterModel> poster = PosterModel().obs;

  RxList tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcastList = RxList();

  RxBool loading = false.obs;

  @override
  onInit(){
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {

    loading.value = true;

    var response = await DioService().getMethod(ApiUrlConstant.getHomeItems);

    if (response.statusCode == 200) {

      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });

      response.data['top_podcasts'].forEach((element) {
        topPodcastList.add(PodcastModel.fromJson(element));
      });

      poster.value = PosterModel.fromJson(response.data['poster']);

      loading.value = false;
    }
  }
}
