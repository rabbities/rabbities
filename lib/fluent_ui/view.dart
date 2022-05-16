import 'package:fluent_ui/fluent_ui.dart';
// import 'package:flutter/material.dart';
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
    // return GetBuilder<FluentUiController>(builder: (_) {
    //   return Scaffold(
    //     appBar: AppBar(),
    //     body: _buildView(),
    //   );
    // });
    return FluentApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.teal,
        brightness: Brightness.light,
      ),
      home: GetBuilder<FluentUiController>(
        init: FluentUiController(),
        builder: (_) {
          return NavigationView(
            appBar: const NavigationAppBar(
              // title: Center(child: Text("fluent_ui")),
              automaticallyImplyLeading: false,
            ),
            pane: NavigationPane(
              header: _buildView(),
              displayMode: PaneDisplayMode.compact,
              indicator: const EndNavigationIndicator(),
              items: [
                PaneItem(
                  icon: const Icon(FluentIcons.home),
                  title: const Text('Home'),
                  infoBadge: const InfoBadge(
                    source: Text('9'),
                  ),
                ),
                PaneItem(icon: const Icon(FluentIcons.apps_content), title: const Text('Dashboard')),
              ],
            ),
            content: NavigationBody(
              index: 0,
              children: const [ScaffoldPage()],
            ),
          );
        },
      ),
    );
  }
}
