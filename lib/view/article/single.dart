import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/constant/my_colors.dart';
import 'package:techblog/controller/article/article_controller.dart';
import 'package:techblog/controller/single_article_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/article/article_list_screen.dart';

// ignore: must_be_immutable
class Single extends StatelessWidget {
  Single({super.key});

  var singleArticleController = Get.find<SingleArticleController>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    Widget tags() {
      final controller = Get.find<SingleArticleController>();
      return Obx(() {
        if (controller.tagList.isEmpty) {
          return Loading();
        }
        return SizedBox(
          height: 60,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.tagList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  await Get.find<ArticleController>().getArticleListWithTagsId(
                    controller.tagList[index].id!,
                  );
                  Get.to(ArticleListScreen());
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 15, 8),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      gradient: LinearGradient(
                        colors: GradientColors.tags,
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                      child: Row(
                        children: [
                          ImageIcon(
                            Assets.icons.hashtagicon.provider(),
                            color: Colors.white,
                            size: 15,
                          ),
                          SizedBox(width: 8),
                          Text(
                            controller.tagList[index].title!,
                            overflow: TextOverflow.ellipsis,
                            style: theme.headlineMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      });
    }

    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Stack(
                  children: [
                    singleArticleController.loading.value == false
                        ? CachedNetworkImage(
                          imageUrl:
                              singleArticleController
                                  .articleInfoModel
                                  .value
                                  .image!,
                          imageBuilder:
                              ((context, imageProvider) =>
                                  Image(image: imageProvider)),
                          placeholder: (context, url) => Loading(),
                          errorWidget:
                              (context, url, error) => Image(
                                image:
                                    Assets.images.singlePlaceHolder.provider(),
                              ),
                        )
                        : Loading(),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,

                      child: Container(
                        height: 60,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: GradientColors.singleAppbarGradiant,
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                          ),
                        ),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 20),
                              const Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 24,
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.bookmark_border_outlined,
                                color: Colors.white,
                                size: 24,
                              ),
                              Expanded(child: SizedBox()),
                              const Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.white,
                                size: 24,
                              ),
                              const SizedBox(width: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      singleArticleController.loading.value == false
                          ? Text(
                            singleArticleController
                                .articleInfoModel
                                .value
                                .title!,
                            maxLines: 2,
                            style: theme.titleLarge,
                          )
                          : Loading(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image(
                        image: Assets.images.profileAvatar.provider(),
                        height: 50,
                      ),
                      SizedBox(width: 16),
                      singleArticleController.loading.value == false
                          ? Text(
                            singleArticleController
                                .articleInfoModel
                                .value
                                .author!,
                            style: theme.displaySmall,
                          )
                          : Loading(),
                      SizedBox(width: 16),
                      singleArticleController.loading.value == false
                          ? Text(
                            singleArticleController
                                .articleInfoModel
                                .value
                                .createdAt!,
                            style: theme.displayLarge,
                          )
                          : Loading(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      singleArticleController.loading.value == false
                          ? HtmlWidget(
                            singleArticleController
                                .articleInfoModel
                                .value
                                .content!,
                            textStyle: theme.displaySmall,
                            enableCaching: true,
                            onLoadingBuilder:
                                (context, element, loadingProgress) =>
                                    const Loading(),
                          )
                          : Loading(),
                ),
                tags(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
