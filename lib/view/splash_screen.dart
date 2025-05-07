import 'package:flutter/material.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/main_screen.dart';

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
      .pushReplacement(MaterialPageRoute(builder: (context) => MainScreen()));
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
