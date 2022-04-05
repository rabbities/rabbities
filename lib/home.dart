import 'package:flutter/material.dart';
import 'package:flutter_rabbit/routes/app_pages.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("个人练习UI"),
        leading: const Icon(Icons.home),
        actions: [
          IconButton(
              onPressed: () {
                launch("https://github.com/rabbities/rabbities");
              },
              icon: const Icon(FontAwesomeIcons.github))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                title: const Text("兔子 (转载)"),
                onTap: () => Get.toNamed(Routes.RABBIT),
              ),
            ),
            Card(
              child: ListTile(
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                title: const Text("微信 (原创)"),
                onTap: () => Get.toNamed(Routes.WECHAT),
              ),
            ),
            Card(
              child: ListTile(
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                title: const Text("Website (原创)"),
                onTap: () => Get.toNamed(Routes.WEBSITE),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
