import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class MenuGroupWidget extends StatelessWidget {
  const MenuGroupWidget({Key? key, required this.label, this.menuOpend = true}) : super(key: key);

  final String label;

  final bool menuOpend;

  @override
  Widget build(BuildContext context) {
    if (menuOpend) return Text(label).fontSize(12).textColor(const Color(0xff9BA4B0)).padding(top: 44, left: 24, bottom: 6);
    return Container();
  }
}

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({Key? key, required this.label, required this.icon, this.menuOpend = true}) : super(key: key);

  final String label;
  final Icon icon;

  final bool menuOpend;

  @override
  Widget build(BuildContext context) {
    return [
      icon.iconColor(Colors.white).iconSize(16),
      if (menuOpend) const SizedBox(width: 12),
      if (menuOpend) Text(label).textColor(Colors.white),
    ].toRow(mainAxisAlignment: menuOpend ? MainAxisAlignment.start : MainAxisAlignment.center).padding(all: 12).ripple(hoverColor: const Color(0xff5965DB)).clipRRect(all: 5).gestures(
      onTap: () {
        if (menuOpend) return;

        BotToast.showAttachedWidget(
          targetContext: context,
          onlyOne: true,
          duration: const Duration(seconds: 1),
          preferDirection: PreferDirection.rightCenter,
          attachedBuilder: (_) => Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(label),
            ),
          ),
        );
      },
    ).parent(({required Widget child}) => Container(margin: const EdgeInsets.only(left: 12, right: 12), child: child));
  }
}
