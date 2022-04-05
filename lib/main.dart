import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rabbit/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());

  if (GetPlatform.isAndroid) {
    // Android 状态栏透明
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

final botToastBuilder = BotToastInit();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Rabbities',
      builder: (context, child) {
        child = botToastBuilder(context, child);
        return child;
      },
      navigatorObservers: [
        BotToastNavigatorObserver()
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'HanSans',
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
