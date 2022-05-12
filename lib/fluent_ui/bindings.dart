import 'package:get/get.dart';

import 'controller.dart';

class FluentUiBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FluentUiController>(() => FluentUiController());
  }
}
