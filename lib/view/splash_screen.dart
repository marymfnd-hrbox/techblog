import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/main.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreen();
}

class _splashScreen extends State<splashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      // ignore: use_build_context_synchronously
      Get.offAndToNamed(NamedRoute.routeMainScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.images.splashScreen.image(height: 64),
              SizedBox(height: 32),
              Loading(),
            ],
          ),
        ),
      ),
    );
  }
}
