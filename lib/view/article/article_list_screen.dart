import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/controller/article/article_controller.dart';
import 'package:techblog/controller/single_article_controller.dart';
import 'package:techblog/main.dart';
// ignore: must_be_immutable
class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key});

  ArticleController articleController = Get.put(ArticleController());
  SingleArticleController singleArticleController = Get.put(
    SingleArticleController(),
  );

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: appBar("مقالات جدید"),
        body: Obx(
          () => ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: articleController.articleList.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {
                  singleArticleController.getArticleInfo(
                    articleController.articleList[index].id,
                  );
                  Get.toNamed(NamedRoute.routeSingleArticle);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width / 3,
                        child: CachedNetworkImage(
                          imageUrl: articleController.articleList[index].image!,
                          imageBuilder: ((context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }),

                          placeholder: (context, url) {
                            return Loading();
                          },
                          errorWidget: (context, url, error) {
                            return Icon(
                              Icons.image_not_supported_outlined,
                              size: 50,
                              color: Colors.grey,
                            );
                          },
                        ),
                      ),

                      SizedBox(width: 16),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              articleController.articleList[index].title!,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                articleController.articleList[index].author!,
                                style: theme.displayLarge,
                              ),
                              SizedBox(width: 20),
                              Text(
                                "${articleController.articleList[index].view!} بازدید",
                                style: theme.displayLarge,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
