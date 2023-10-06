
import 'package:flutter/material.dart';
import 'package:learn_flutter/my_cinema.dart';
import 'package:learn_flutter/my_classroom_page.dart';
import 'package:learn_flutter/my_home_page.dart';
import 'package:learn_flutter/slideshow.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello App",
      home: MyCinema(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        fontFamily: 'Nunito'
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
