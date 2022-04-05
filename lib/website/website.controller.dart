import 'package:flutter_rabbit/core/configs/menus.dart';
import 'package:flutter_rabbit/routes/app_pages.dart';
import 'package:get/get.dart';

class WebsiteController extends GetxController {
  bool sidebarOpen = true;

  String current = Routes.DASHBOARD;

  List<MenuGroup> routes = [
    APPMENUS[0].children[0],
  ];

  setRoutes(MenuGroup menu) {
    current = menu.url!;
    if (!routes.contains(menu)) {
      routes.add(menu);
    }
    update();
  }

  toggle() {
    sidebarOpen = !sidebarOpen;
    update();
  }

  delete(GetDelegate delegate, MenuGroup menu) {
    final index = routes.indexOf(menu);
    if (index != 0) routes.remove(menu);
    current = routes[index - 1].url!;
    refresh();
    delegate.toNamed(current);
  }

  void deleteRight(GetDelegate delegate, MenuGroup menu) {
    final index = routes.indexOf(menu);
    routes.length = index + 1;
    refresh();
    if (current == menu.url) return;
    current = routes[index].url!;
    delegate.toNamed(current);
  }

  void deleteOthers(GetDelegate delegate, MenuGroup menu) {
    routes = [
      menu
    ];
    refresh();
  }
}
