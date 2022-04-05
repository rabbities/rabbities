import 'package:get/get_state_manager/get_state_manager.dart';

class WebsiteController extends GetxController {
  bool sidebarOpen = true;

  toggle() {
    sidebarOpen = !sidebarOpen;
    update();
  }
}
