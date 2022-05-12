import 'package:flutter_rabbit/fluent_ui/index.dart';
import 'package:flutter_rabbit/home.dart';
import 'package:flutter_rabbit/rabbit/rabbit.dart';
import 'package:flutter_rabbit/website/website.dart';
import 'package:flutter_rabbit/wechat/index.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: '/',
      page: () => const HomePage(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
    ),
    GetPage(
      name: '/rabbit',
      page: () => const RabbitPage(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
    ),
    GetPage(
      name: '/wechat',
      page: () => const WeChatLayout(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
    ),
    GetPage(
      name: '/fluent',
      page: () => const FluentUiPage(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      binding: FluentUiBinding(),
    ),
    GetPage(
      name: '/website',
      page: () => const WebsitePage(),
      preventDuplicates: false,
      children: [
        GetPage(
          name: _Paths.APP,
          preventDuplicates: false,
          transition: Transition.zoom,
          page: () => const HomeView(),
        ),
        GetPage(
          preventDuplicates: false,
          name: _Paths.DASHBOARD,
          transition: Transition.zoom,
          page: () => const DashboardView(),
        ),
        GetPage(
          preventDuplicates: false,
          name: _Paths.CONVERSATION,
          transition: Transition.zoom,
          page: () => const ConversationView(),
        ),
      ],
    ),
  ];
}
