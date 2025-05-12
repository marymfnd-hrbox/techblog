import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/constant/my_strings.dart';
import 'package:techblog/controller/register_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/constant/my_colors.dart';
import 'package:techblog/view/main/home_screen.dart';
import 'package:techblog/view/main/profile_screen.dart';
import 'package:techblog/view/register/register_intro.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 10;

    return Scaffold(
      key: _key,
      drawer: Drawer(
        backgroundColor: SolidColors.scaffoldBg,
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Image.asset(Assets.images.splashScreen.path, scale: 3),
                ),
              ),
              ListTile(
                title: Text("پروفایل کاربری", style: theme.displaySmall),
                onTap: () {},
              ),
              Divider(color: SolidColors.dividerColor),
              ListTile(
                title: Text("درباره تک بلاگ", style: theme.displaySmall),
                onTap: () {},
              ),
              Divider(color: SolidColors.dividerColor),
              ListTile(
                title: Text("اشتراک گذاری تک بلاگ", style: theme.displaySmall),
                onTap: () async {
                  await SharePlus.instance.share(
                    ShareParams(text: MyStrings.shareText),
                  );
                },
              ),
              Divider(color: SolidColors.dividerColor),
              ListTile(
                title: Text("تک بلاگ در گیت هاب", style: theme.displaySmall),
                onTap: () {
                  myLaunchUrl(MyStrings.techBlogGithubUrl);
                },
              ),
              Divider(color: SolidColors.dividerColor),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: SolidColors.scaffoldBg,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              child: Icon(Icons.menu, color: Colors.black),
              onTap: () {
                _key.currentState!.openDrawer();
              },
            ),

            Assets.images.splashScreen.image(height: size.height / 13.6),

            Icon(Icons.search, color: Colors.black),
          ],
        ),
      ),
      body: Stack(
        children: [
          Obx(
            () => IndexedStack(
              index: selectedPageIndex.value,
              children: [
                homeScreen(size: size, theme: theme, bodyMargin: bodyMargin),
                profileScreen(size: size, theme: theme, bodyMargin: bodyMargin),
                RegisterIntro(),
              ],
            ),
          ),

          // Bottom Navigation
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavigation(
              size: size,
              bodyMargin: bodyMargin,
              changeScreen: (int value) {
                selectedPageIndex.value = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  });

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 10,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: GradientColors.bottomNavBackground,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          right: bodyMargin,
          left: bodyMargin,
          bottom: 27,
        ),
        child: Container(
          height: size.height / 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            gradient: LinearGradient(colors: GradientColors.bottomNav),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () => changeScreen(0),
                icon: ImageIcon(
                  Assets.icons.home.provider(),
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.find<RegisterController>().toggleLogin();
                },
                icon: ImageIcon(
                  Assets.icons.write.provider(),
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () => changeScreen(1),
                icon: ImageIcon(
                  Assets.icons.user.provider(),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
