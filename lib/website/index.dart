import 'package:flutter/material.dart';
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
          const TitleBarWidget(),
          const SizedBox(height: 1),
          // const ConversationWidget(),
        ].toColumn().expanded(),
      ].toRow(),
    );
  }
}
