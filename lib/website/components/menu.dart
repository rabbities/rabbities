import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rabbit/core/configs/menus.dart';
import 'package:flutter_rabbit/website/website.controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:styled_widget/styled_widget.dart';

class MenuGroupWidget extends StatelessWidget {
  const MenuGroupWidget({
    Key? key,
    required this.label,
    this.menuOpend = true,
    required this.children,
    this.onPressed,
  }) : super(key: key);

  final String label;

  final bool menuOpend;

  final List<MenuGroup> children;

  final Function(MenuGroup menu)? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: children.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Text(label).fontSize(12).textColor(const Color(0xff9BA4B0)).padding(
                top: 32,
                left: menuOpend ? 24 : 20,
                bottom: 6,
              );
        }

        final menu = children[index - 1];

        return MenuItemWidget(menu: menu, menuOpend: menuOpend, onPressed: onPressed);
      },
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({Key? key, required this.menu, this.menuOpend = true, this.onPressed}) : super(key: key);

  final MenuGroup menu;

  final bool menuOpend;

  final Function(MenuGroup menu)? onPressed;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WebsiteController>(
        init: WebsiteController(),
        builder: (c) {
          final current = c.current == menu.url;
          return [
            menu.icon!.iconColor(Colors.white).iconSize(16),
            if (menuOpend) const SizedBox(width: 12),
            if (menuOpend) Text(menu.label).textColor(Colors.white),
          ]
              .toRow(mainAxisAlignment: menuOpend ? MainAxisAlignment.start : MainAxisAlignment.center)
              .padding(all: 12)
              .backgroundColor(
                current ? const Color(0xff5965DB) : Colors.transparent,
              )
              .ripple(hoverColor: const Color(0xff5965DB))
              .clipRRect(all: 5)
              .gestures(
            onTap: () {
              if (menu.url != null) onPressed!(menu);

              if (menuOpend) return;

              BotToast.showAttachedWidget(
                targetContext: context,
                onlyOne: true,
                duration: const Duration(seconds: 1),
                preferDirection: PreferDirection.rightCenter,
                attachedBuilder: (_) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(menu.label),
                  ),
                ),
              );
            },
          ).parent(
            ({required Widget child}) => Container(
              margin: const EdgeInsets.only(
                left: 12,
                top: 8,
                right: 12,
              ),
              child: child,
            ),
          );
        });
  }
}
