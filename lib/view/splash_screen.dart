import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/main_screen.dart';
import 'package:techblog/component/my_colors.dart';

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
      Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => home()));
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
              SpinKitFadingCube(color: SolidColors.primaryColor, size: 28.0),
            ],
          ),
        ),
      ),
    );
  }
}
