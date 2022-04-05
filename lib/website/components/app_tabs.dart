import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rabbit/website/website.controller.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

class AppTabsWidget extends StatelessWidget {
  const AppTabsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WebsiteController>(
      init: WebsiteController(),
      builder: (c) {
        return GetRouterOutlet.builder(builder: (context, delegate, currentRoute) {
          return Container(
            height: 42,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            color: Colors.white,
            width: double.infinity,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: c.routes.length,
              itemBuilder: (context, index) {
                final menu = c.routes[index];
                final current = menu.url == c.current;
                return Listener(
                  onPointerDown: (event) async {
                    if (event.kind == PointerDeviceKind.mouse && event.buttons == kSecondaryMouseButton) {
                      final overlay = Overlay.of(context)?.context.findRenderObject() as RenderBox;
                      final menuItem = await showMenu<int>(
                          context: context,
                          items: [
                            PopupMenuItem(child: const Text('关闭当前').fontSize(12), value: 1),
                            PopupMenuItem(child: const Text('关闭右侧').fontSize(12), value: 2),
                            PopupMenuItem(child: const Text('关闭其他').fontSize(12), value: 3),
                          ],
                          position: RelativeRect.fromSize(event.position & const Size(100.0, 100.0), overlay.size));
                      // Check if menu item clicked
                      switch (menuItem) {
                        case 1:
                          c.delete(delegate, menu);
                          break;
                        case 2:
                          c.deleteRight(delegate, menu);
                          break;
                        case 3:
                          c.deleteOthers(delegate, menu);
                          break;
                        default:
                      }
                    }
                  },
                  child: [
                    const SizedBox(width: 6),
                    menu.icon!.iconSize(16).iconColor(current ? const Color(0xff5965DB) : Colors.grey),
                    const SizedBox(width: 6),
                    Text(menu.label)
                        .textColor(
                          current ? const Color(0xff5965DB) : Colors.grey,
                        )
                        .center(),
                    const SizedBox(width: 12),
                    const Icon(Icons.close)
                        .iconColor(
                          current ? const Color(0xff5965DB) : Colors.grey,
                        )
                        .iconSize(16)
                        .ripple()
                        .gestures(onTap: () => c.delete(delegate, menu)),
                    const SizedBox(width: 6),
                  ]
                      .toRow()
                      .border(
                        all: 1,
                        color: current ? const Color(0xff5965DB) : Colors.grey,
                      )
                      .borderRadius(all: 6)
                      .ripple()
                      .gestures(
                    onTap: () {
                      delegate.toNamed(menu.url!);
                      c.setRoutes(menu);
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 8),
            ),
          );
        });
      },
    );
  }
}
