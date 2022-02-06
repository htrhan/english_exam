import 'package:english_quiz/ui/constants.dart';
import 'package:english_quiz/ui/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YDSQUİZ',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontSize: 16,
            fontFamily: "SansPro",
            fontWeight: FontWeight.normal,
            wordSpacing: 1,
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontFamily: "SansPro",
            fontWeight: FontWeight.bold,
            fontSize: 12,
            wordSpacing: 1,
          ),
          headline1: TextStyle(
            color: Colors.white,
            fontFamily: "SansPro",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            wordSpacing: 1,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white54,
            fontFamily: "SansPro",
            fontSize: 18,
            fontWeight: FontWeight.normal,
            wordSpacing: 1,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
