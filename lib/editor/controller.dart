import 'package:get/get.dart';

class EditorController extends GetxController {
  EditorController();

  _initData() {
    update(["editor"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  String markdwonText = "# Hello World";

  void setText(String? text) {
    markdwonText = text ?? '# Hello World';
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
