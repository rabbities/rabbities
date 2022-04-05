import 'package:flutter/material.dart';
import 'package:flutter_rabbit/routes/app_pages.dart';

// enum MenuType{};

class MenuGroup {
  String label;
  Icon? icon;
  String? url;

  List<MenuGroup> children;

  MenuGroup({
    required this.label,
    this.icon,
    this.url,
    this.children = const [],
  });
}

// ignore: non_constant_identifier_names
List<MenuGroup> APPMENUS = [
  MenuGroup(label: "菜单", children: [
    MenuGroup(label: "首页", icon: const Icon(Icons.dashboard_rounded), url: Routes.DASHBOARD),
    MenuGroup(label: "好友", icon: const Icon(Icons.group_rounded), url: Routes.APP),
    MenuGroup(label: "文档", icon: const Icon(Icons.document_scanner_rounded)),
    MenuGroup(label: "对话", icon: const Icon(Icons.chat_rounded), url: Routes.CONVERSATION),
    MenuGroup(label: "项目", icon: const Icon(Icons.task_rounded)),
    MenuGroup(label: "计划", icon: const Icon(Icons.schedule_rounded)),
    MenuGroup(label: "支付", icon: const Icon(Icons.payment_rounded)),
  ]),
  MenuGroup(label: "支持", children: [
    MenuGroup(label: "需要帮助", icon: const Icon(Icons.contact_support_rounded)),
    MenuGroup(label: "联系我们", icon: const Icon(Icons.email_rounded)),
  ]),
  MenuGroup(label: "设置", children: [
    MenuGroup(label: "账号安全", icon: const Icon(Icons.settings_rounded)),
    MenuGroup(label: "夜间模式", icon: const Icon(Icons.nightlight_rounded)),
    MenuGroup(label: "退出登录", icon: const Icon(Icons.logout_rounded)),
  ]),
];
