import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class FluentUiPage extends GetView<FluentUiController> {
  const FluentUiPage({Key? key}) : super(key: key);

  // 内容页
  Widget _buildView() {
    return const HelloWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FluentUiController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(),
        body: _buildView(),
      );
    });
    // return FluentApp(
    //   theme: ThemeData(),
    //   home: GetBuilder<FluentUiController>(
    //     builder: (_) {
    //       return NavigationView(
    //         appBar: const NavigationAppBar(title: Text("fluent_ui")),
    //         pane: NavigationPane(
    //           header: _buildView(),
    //           indicator: const EndNavigationIndicator(),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
