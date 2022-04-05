import 'package:flutter/material.dart';
import 'package:flutter_rabbit/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'website.dart';

class WebsitePage extends StatelessWidget {
  const WebsitePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFD),
      body: [
        const SiderBarWidget(),
        [
          const AppTabsWidget(),
          const SizedBox(height: 2),
          GetRouterOutlet(
            initialRoute: Routes.DASHBOARD,
            anchorRoute: Routes.WEBSITE,
            // delegate: delegate,
            key: Get.nestedKey(Routes.WEBSITE),
          ).expanded(),
          // const ConversationWidget(),
        ].toColumn().expanded(),
      ].toRow(),
    );
  }
}
