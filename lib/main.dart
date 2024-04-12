import 'package:flutter/material.dart';
import 'package:motion/Screen/Splash_Screen.dart';
import 'package:motion/Screen/news_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: SplashScreen(),
      routes: {'/news-screen': (context) => const NewsScreen()},
    );
  }
}

