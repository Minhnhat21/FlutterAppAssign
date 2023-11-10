
import 'package:flutter/material.dart';
import 'package:learn_flutter/my_cinema.dart';
import 'package:learn_flutter/my_classroom_page.dart';
import 'package:learn_flutter/my_home_page.dart';
import 'package:learn_flutter/views/screen/mailandphone_register_ig.dart';
import 'package:learn_flutter/views/screen/my_instagram_app.dart';
import 'package:learn_flutter/slideshow.dart';
import 'package:learn_flutter/views/screen/password_register_ig.dart';
import 'package:learn_flutter/views/screen/profile_account_ig.dart';
import 'package:learn_flutter/views/screen/successfull_register_ig.dart';
import 'package:learn_flutter/views/screen/username_register_ig.dart';

import 'views/screen/login_ig.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello App",
      home: const LoginInstagram(),
      theme: ThemeData(
        brightness: Brightness.dark,
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        //scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        fontFamily: 'Nunito'
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
