import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rabbit/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());

  if (Platform.isAndroid) {
    // Android 状态栏透明
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Rabbities',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(elevation: 0),
        primaryColor: Colors.white,
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color.fromRGBO(247, 247, 247, 1),
        backgroundColor: const Color(0xFFE5E5E5),
        dividerColor: Colors.white54,
      ),
      home: const HomePage(),
    );
  }
}
