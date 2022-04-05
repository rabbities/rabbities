import 'package:flutter/material.dart';
import 'package:flutter_rabbit/core/configs/menus.dart';
import 'package:flutter_rabbit/website/website.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

class SiderBarWidget extends StatelessWidget {
  const SiderBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WebsiteController>(
        init: WebsiteController(),
        builder: (c) {
          final menuOpend = c.sidebarOpen;
          return Container(
            width: menuOpend ? 255 : 64,
            color: const Color(0xff1E2933),
            child: ListView.builder(
              controller: ScrollController(),
              itemCount: APPMENUS.length + 2 + 1,
              itemBuilder: (context, index) {
                if (index == APPMENUS.length + 2) return SiderFooter(menuOpend: menuOpend);

                if (index == 0) {
                  return SiderHeaders(
                    menuOpend: menuOpend,
                    onPressed: () => c.toggle(),
                  );
                }
                if (index == 1) return SiderUser(menuOpend: menuOpend);

                final menu = APPMENUS[index - 2];

                return GetRouterOutlet.builder(builder: (context, delegate, currentRoute) {
                  return MenuGroupWidget(
                    onPressed: (menu) {
                      delegate.toNamed(menu.url!);
                      c.setRoutes(menu);
                    },
                    label: menu.label,
                    menuOpend: menuOpend,
                    children: menu.children,
                  );
                });
              },
            ),
          );
        });
  }
}

class SiderHeaders extends StatelessWidget {
  const SiderHeaders({Key? key, required this.menuOpend, this.onPressed}) : super(key: key);
  final bool menuOpend;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return [
      if (menuOpend) const Text('Project Dashboard').fontSize(16).textColor(Colors.white),
      if (menuOpend) const Spacer(),
      IconButton(
        onPressed: onPressed,
        icon: Icon(menuOpend ? Icons.menu_open : Icons.menu, color: Colors.white),
      )
    ].toRow().padding(all: menuOpend ? 24 : 12).border(bottom: 1, color: const Color(0xff323E4A));
  }
}

class SiderFooter extends StatelessWidget {
  final bool menuOpend;

  const SiderFooter({Key? key, required this.menuOpend}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return menuOpend
        ? [
            const Text("版权所有 🐼一只熊猫 ©2022").fontSize(12).textColor(Colors.white),
            const SizedBox(height: 12),
            const Text("Created with love for the community of designers and project managers.").textColor(const Color(0xff9BA4B0)),
            const SizedBox(height: 12),
          ]
            .toColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
            )
            .padding(
              left: 24,
              vertical: 20,
            )
            .border(
              top: 1,
              color: const Color(0xff323E4A),
            )
        : Container();
  }
}

class SiderUser extends StatelessWidget {
  const SiderUser({Key? key, required this.menuOpend}) : super(key: key);
  final bool menuOpend;
  @override
  Widget build(BuildContext context) {
    return [
      Image.asset('assets/images/icon-128.png', width: 35, height: 35).clipOval(),
      if (menuOpend) const SizedBox(width: 12),
      if (menuOpend)
        [
          const Text('一只熊猫').fontSize(16).textColor(Colors.white),
          const Text('Web Designer').fontSize(12).textColor(const Color(0xff9BA4B0)),
        ].toColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
    ]
        .toRow(crossAxisAlignment: CrossAxisAlignment.center)
        .padding(
          left: menuOpend ? 24 : 16,
          vertical: 22,
        )
        .border(
          bottom: 1,
          color: const Color(0xff323E4A),
        )
        .ripple();
  }
}
