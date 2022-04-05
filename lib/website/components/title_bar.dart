import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

const borderColor = Color(0xffE3E6EE);
const textColor = Color(0xff9BA4B0);
const dividerColor = Color(0xffEAEDF3);

class TitleBarWidget extends StatelessWidget {
  const TitleBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return [
      [
        const SizedBox(width: 12),
        const Icon(Icons.search).iconColor(textColor).iconSize(16),
        const SizedBox(width: 10),
        const Text("Type to search. . .").textColor(textColor),
      ].toRow().height(36).border(all: 1, color: borderColor).expanded(),
      const SizedBox(width: 32),
      const Text('语言').textColor(textColor).center().height(36).width(128).border(all: 1, color: borderColor),
    ].toRow().height(64).padding(horizontal: 32).backgroundColor(Colors.white).border(all: 1, color: dividerColor);
  }
}
