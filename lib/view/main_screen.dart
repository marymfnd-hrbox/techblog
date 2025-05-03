import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/my_colors.dart';
import 'package:techblog/view/home_screen.dart';
import 'package:techblog/view/profile_screen.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 10;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: SolidColors.scaffoldBg,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.menu, color: Colors.black),
            Assets.images.splashScreen.image(height: size.height / 13.6),
            Icon(Icons.search, color: Colors.black),
          ],
        ),
      ),
      body: Stack(
        children: [
          IndexedStack(
            index: selectedPageIndex,
            children: [
              homeScreen(size: size, theme: theme, bodyMargin: bodyMargin),
              profileScreen(size: size, theme: theme, bodyMargin: bodyMargin),
            ],
          ),

          // Bottom Navigation
          BottomNavigation(
            size: size,
            bodyMargin: bodyMargin,
            changeScreen: (int value) {
              setState(() {
                selectedPageIndex = value;
              });
            },
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
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
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
                  onPressed: () => changeScreen(2),
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
      ),
    );
  }
}
