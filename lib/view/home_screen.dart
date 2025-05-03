import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/my_colors.dart';
import 'package:techblog/my_strings.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({
    super.key,
    required this.size,
    required this.theme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme theme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Column(
              children: [
                SizedBox(height: 8),
                
                ///// Poster
                homePagePoster(size: size, theme: theme),
                SizedBox(height: 16),
    
                ///// TagList
                homePageTaglist(bodyMargin: bodyMargin, theme: theme),
                SizedBox(height: 32),
    
                // Top Articles
                seeMoreBlog(bodyMargin: bodyMargin, theme: theme),
                homePageBlogList(size: size, bodyMargin: bodyMargin, theme: theme),
    
                // Top Podcasts
                seeMorePodcast(bodyMargin: bodyMargin, theme: theme),
                homePagePodcastList(size: size, bodyMargin: bodyMargin, theme: theme),
              
                SizedBox(height: 60,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class homePagePodcastList extends StatelessWidget {
  const homePagePodcastList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.theme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
        
      child: ListView.builder(
        itemCount: blogList.length,
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
                                blogList[index].imageUrl,
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
                                blogList[index].writer,
                                style: theme.headlineSmall,
                              ),
                              Text(
                                blogList[index].views,
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
                    blogList[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          );
        },
      ),
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
          Text(
            MyStrings.viewHotestPodCasts,
            style: theme.headlineLarge,
          ),
        ],
      ),
    );
  }
}

class homePageBlogList extends StatelessWidget {
  const homePageBlogList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.theme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
        
      child: ListView.builder(
        itemCount: blogList.length,
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
                                blogList[index].imageUrl,
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
                                blogList[index].writer,
                                style: theme.headlineSmall,
                              ),
                              Text(
                                blogList[index].views,
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
                    blogList[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class seeMoreBlog extends StatelessWidget {
  const seeMoreBlog({
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
            Assets.icons.bluePen.provider(),
            color: SolidColors.seeMore,
          ),
          SizedBox(width: 8),
          Text(
            MyStrings.viewHotestBlog,
            style: theme.headlineLarge,
          ),
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
            padding: EdgeInsets.fromLTRB(
              0,
              8,
              index == 0 ? bodyMargin : 15,
              8,
            ),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
                gradient: LinearGradient(
                  colors: GradientColors.tags,
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  8,
                  8,
                  8,
                ),
                child: Row(
                  children: [
                    ImageIcon(
                      Assets.icons.hashtagicon.provider(),
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(width: 8),
                    Text(
                      tagList[index].title,
                      style: theme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class homePagePoster extends StatelessWidget {
  const homePagePoster({
    super.key,
    required this.size,
    required this.theme,
  });

  final Size size;
  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Assets.images.posterTest.provider(),
            ),
            color: Colors.black12,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: GradientColors.homePosterCoverGradiant,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "ملیکا عزیزی - یک روز پیش",
                    style: theme.headlineSmall,
                  ),
                  Text(
                    "Like 253",
                    style: theme.displayMedium,
                  ),
                ],
              ),
              Text("اولین مقاله ی هوش مصنوعی در زمینه فیزیک", style: theme.headlineMedium),
            ],
          ),
        ),
      ],
    );
  }
}
