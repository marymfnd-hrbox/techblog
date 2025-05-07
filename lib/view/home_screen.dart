import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog/controller/home_screen_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/constant/my_colors.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/constant/my_strings.dart';

class homeScreen extends StatelessWidget {
  homeScreen({
    super.key,
    required this.size,
    required this.theme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme theme;
  final double bodyMargin;
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    Widget topPodcasts() {
      return SizedBox(
        height: size.height / 3.5,

        child: Obx(
          () => ListView.builder(
            itemCount: homeScreenController.topPodcastList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),

                    child: Padding(
                      padding: EdgeInsets.only(
                        right: index == 0 ? bodyMargin : 15,
                      ),

                      child: SizedBox(
                        height: size.height / 5.3,
                        width: size.width / 2.2,
                        child: CachedNetworkImage(
                          imageUrl:
                              homeScreenController
                                  .topPodcastList[index]
                                  .poster!,
                          imageBuilder:
                              ((context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),

                          placeholder:
                              (context, url) => SpinKitFadingCube(
                                color: SolidColors.primaryColor,
                                size: 32,
                              ),

                          errorWidget:
                              (context, url, error) => Icon(
                                Icons.image_not_supported_outlined,
                                size: 50,
                                color: Colors.grey,
                              ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: index == 0 ? bodyMargin : 15,
                    ),
                    child: SizedBox(
                      width: size.width / 2.4,
                      child: Text(
                        homeScreenController.topPodcastList[index].title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    }

    Widget topVisited() {
      return SizedBox(
        height: size.height / 3.5,

        child: Obx(
          () => ListView.builder(
            itemCount: homeScreenController.topVisitedList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),

                    child: Padding(
                      padding: EdgeInsets.only(
                        right: index == 0 ? bodyMargin : 15,
                      ),

                      child: SizedBox(
                        height: size.height / 5.3,
                        width: size.width / 2.2,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    homeScreenController
                                        .topVisitedList[index]
                                        .image!,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              foregroundDecoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                                gradient: LinearGradient(
                                  colors: GradientColors.blogPost,
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),

                            Positioned(
                              bottom: 8,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    homeScreenController
                                        .topVisitedList[index]
                                        .author!,
                                    style: theme.headlineSmall,
                                  ),
                                  Text(
                                    homeScreenController
                                        .topVisitedList[index]
                                        .view!,
                                    style: theme.displayMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: index == 0 ? bodyMargin : 15,
                    ),
                    child: SizedBox(
                      width: size.width / 2.4,
                      child: Text(
                        homeScreenController.topVisitedList[index].title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    }

    Widget poster() {
      return Obx(
        () => Stack(
          children: [
            Container(
              width: size.width / 1.25,
              height: size.height / 4.2,
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: GradientColors.homePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: homeScreenController.loading.value==false? CachedNetworkImage(
                imageUrl:  homeScreenController.poster.value.image!,
                imageBuilder:
                    ((context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),

                placeholder:
                    (context, url) => SpinKitFadingCube(
                      color: SolidColors.primaryColor,
                      size: 32,
                    ),

                errorWidget:
                    (context, url, error) => Icon(
                      Icons.image_not_supported_outlined,
                      size: 50,
                      color: Colors.grey,
                    ),
              ): Loading(),
            ),
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  homeScreenController.loading.value == false? Text(homeScreenController.poster.value.title!,
                  style: theme.headlineMedium,): Loading()
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Stack(
      children: [
        Positioned.fill(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Column(
                  children: [
                    SizedBox(height: 8),

                    ///// Poster
                    poster(),
                    SizedBox(height: 16),

                    ///// TagList
                    homePageTaglist(bodyMargin: bodyMargin, theme: theme),
                    SizedBox(height: 32),

                    // Top Articles
                    seeMoreBlog(bodyMargin: bodyMargin, theme: theme),

                    topVisited(),

                    // Top Podcasts
                    seeMorePodcast(bodyMargin: bodyMargin, theme: theme),

                    topPodcasts(),

                    SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class seeMorePodcast extends StatelessWidget {
  const seeMorePodcast({
    super.key,
    required this.bodyMargin,
    required this.theme,
  });

  final double bodyMargin;
  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.microphon.provider(),
            color: SolidColors.seeMore,
          ),
          SizedBox(width: 8),
          Text(MyStrings.viewHotestPodCasts, style: theme.headlineLarge),
        ],
      ),
    );
  }
}

class seeMoreBlog extends StatelessWidget {
  const seeMoreBlog({super.key, required this.bodyMargin, required this.theme});

  final double bodyMargin;
  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.bluePen.provider(),
            color: SolidColors.seeMore,
          ),
          SizedBox(width: 8),
          Text(MyStrings.viewHotestBlog, style: theme.headlineLarge),
        ],
      ),
    );
  }
}

class homePageTaglist extends StatelessWidget {
  const homePageTaglist({
    super.key,
    required this.bodyMargin,
    required this.theme,
  });

  final double bodyMargin;
  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tagList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
            child: MainTags(theme: theme, index: index),
          );
        },
      ),
    );
  }
}
