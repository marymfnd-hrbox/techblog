import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/controller/article/manage_articles_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/constant/my_strings.dart';

// ignore: must_be_immutable
class ManageArticle extends StatelessWidget {
  ManageArticle({super.key});

  var articleManagerController = Get.put(ManageArticleController());

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: appBar("مدیریت مقاله"),
        body: Obx(
          () => articleManagerController.articleList.isNotEmpty? ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: articleManagerController.articleList.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {

                  //TODO: Route to single manage

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
                          imageUrl: articleManagerController.articleList[index].image!,
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
                              articleManagerController.articleList[index].title!,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                articleManagerController.articleList[index].author!,
                                style: theme.displayLarge,
                              ),
                              SizedBox(width: 20),
                              Text(
                                "${articleManagerController.articleList[index].view!} بازدید",
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
          ) : articleEmptyState(theme),
        ),
      ),
    );
  }

  Center articleEmptyState(TextTheme theme) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: Assets.images.emptyState.provider(), height: 100),

            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: MyStrings.articleEmpty,
                  style: theme.displaySmall,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ElevatedButton(
                onPressed: () {
                },
                child: Text("بریم برای نوشتن یک مقاله ی باحال"),
              ),
            ),
          ],
        ),
      );
  }

}
