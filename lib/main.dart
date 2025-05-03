// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:techblog/my_colors.dart';
import 'package:techblog/view/register_intro.dart';

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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale("fa", "")],

      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 2),),
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
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: SolidColors.hintText,
          ),
        ),
      ),
      // home: splashScreen(),
      //   );
      home: RegisterIntro(),
    );
  }
}
