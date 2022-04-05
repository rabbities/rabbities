import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Logger().d("appp===========");
    return const Text("app view");
  }
}
