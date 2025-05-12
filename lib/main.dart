// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/binding.dart';
import 'package:techblog/constant/my_colors.dart';
import 'package:techblog/view/article/manage_article.dart';
import 'package:techblog/view/main/main_screen.dart';
import 'package:techblog/view/article/single.dart';
import 'package:techblog/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa'),
      getPages: [
        GetPage(
          name: NamedRoute.routeMainScreen,
          page: () => MainScreen(),
          binding: RegisterBinding(),
        ),
        GetPage(
          name: NamedRoute.routeSingleArticle,
          page: () => Single(),
          binding: ArticleBinding(),
        ),
        GetPage(
          name: NamedRoute.routeManageArticle,
          page: () => ManageArticle(),
          binding: ArticleManagerBinding(),
        ),
      ],

      theme: lightTheme(),

      home: splashScreen(),
    );
  }

  ThemeData lightTheme() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 2),
        ),
        filled: true,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(Colors.white),
          textStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return const TextStyle(
                fontFamily: "dana",
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: SolidColors.posterTitle,
              );
            }
            return const TextStyle(
              fontFamily: "dana",
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            );
          }),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return SolidColors.seeMore;
            }
            return SolidColors.primaryColor;
          }),
        ),
      ),

      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      fontFamily: "dana",

      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          fontFamily: "dana",
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: SolidColors.posterTitle,
        ),
        displayMedium: TextStyle(
          fontFamily: "dana",
          fontSize: 13,
          fontWeight: FontWeight.w300,
          color: SolidColors.posterSubTitle,
        ),
        bodySmall: TextStyle(
          fontFamily: "dana",
          fontSize: 13,
          fontWeight: FontWeight.w300,
        ),
        headlineMedium: TextStyle(
          fontFamily: "dana",
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
        headlineLarge: TextStyle(
          fontFamily: "dana",
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: SolidColors.seeMore,
        ),
        displaySmall: TextStyle(
          fontFamily: "dana",
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Color.fromARGB(255, 70, 70, 70),
        ),
        displayLarge: TextStyle(
          fontFamily: "dana",
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: SolidColors.hintText,
        ),
        titleLarge: TextStyle(
          fontFamily: 'dana',
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
    );
  }
}

class NamedRoute{
  static String routeMainScreen = "/MainScreen";
  static String routeSingleArticle = "/SingleArticle";
  static String routeManageArticle = "/ManageArticle";
}