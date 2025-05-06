import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/component/my_colors.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/component/my_strings.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({
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
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 80),

              Image(image: Assets.images.profileAvatar.provider(), height: 100),

              SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    Assets.icons.bluePen.provider(),
                    color: SolidColors.seeMore,
                  ),
                  const SizedBox(width: 8),
                  Text(MyStrings.imageProfileEdit, style: theme.headlineLarge),
                ],
              ),

              const SizedBox(height: 60),

              Text("فاطمه امیری", style: theme.displaySmall),
              Text("fatemeamiri@gmail.com", style: theme.displaySmall),

              SizedBox(height: 40),

              techDivider(size: size),

              InkWell(
                onTap: () {
                  // TODO: YE CHIZI BAYAD TARIF BESHE
                },
                splashColor: SolidColors.primaryColor,
                child: SizedBox(
                  height: 45,
                  child: Center(
                    child: Text(MyStrings.myFavBlog, style: theme.displaySmall),
                  ),
                ),
              ),

              techDivider(size: size),

              InkWell(
                onTap: () {
                  // TODO: YE CHIZI BAYAD TARIF BESHE
                },
                splashColor: SolidColors.primaryColor,
                child: SizedBox(
                  height: 45,
                  child: Center(
                    child: Text(
                      MyStrings.myFavPodcast,
                      style: theme.displaySmall,
                    ),
                  ),
                ),
              ),

              techDivider(size: size),

              InkWell(
                onTap: () {
                  // TODO: YE CHIZI BAYAD TARIF BESHE
                },
                splashColor: SolidColors.primaryColor,
                child: SizedBox(
                  height: 45,
                  child: Center(
                    child: Text(MyStrings.logOut, style: theme.displaySmall),
                  ),
                ),
              ),

              SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
