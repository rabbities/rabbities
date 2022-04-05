import 'package:flutter/material.dart';
import 'package:flutter_rabbit/website/website.controller.dart';
import 'package:flutter_rabbit/website/website.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
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
            child: ListView(
              controller: ScrollController(),
              children: [
                [
                  if (menuOpend) const Text('Project Dashboard').fontSize(16).textColor(Colors.white),
                  if (menuOpend) const Spacer(),
                  IconButton(
                    onPressed: () => c.toggle(),
                    icon: Icon(menuOpend ? Icons.menu_open : Icons.menu, color: Colors.white),
                  )
                ].toRow().padding(all: menuOpend ? 24 : 12).border(bottom: 1, color: const Color(0xff323E4A)),
                [
                  Image.asset('assets/images/icon-128.png', width: 35, height: 35).clipOval(),
                  if (menuOpend) const SizedBox(width: 12),
                  if (menuOpend)
                    [
                      const Text('一只熊猫').fontSize(16).textColor(Colors.white),
                      const Text('Web Designer').fontSize(12).textColor(const Color(0xff9BA4B0)),
                    ].toColumn(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start),
                ].toRow(crossAxisAlignment: CrossAxisAlignment.center).padding(left: menuOpend ? 24 : 16, vertical: 22).border(bottom: 1, color: const Color(0xff323E4A)).ripple(), //.gestures(onTap: () => c.toggle()),
                MenuGroupWidget(label: '菜单', menuOpend: menuOpend),
                MenuItemWidget(menuOpend: menuOpend, icon: const Icon(Icons.dashboard_rounded), label: '首页'),
                MenuItemWidget(menuOpend: menuOpend, icon: const Icon(Icons.group_rounded), label: '好友'),
                MenuItemWidget(menuOpend: menuOpend, icon: const Icon(Icons.document_scanner_rounded), label: '文档'),
                MenuItemWidget(menuOpend: menuOpend, icon: const Icon(Icons.chat_rounded), label: '对话'),
                MenuItemWidget(menuOpend: menuOpend, icon: const Icon(Icons.task_rounded), label: '项目'),
                MenuItemWidget(menuOpend: menuOpend, icon: const Icon(Icons.schedule_rounded), label: '计划'),
                MenuItemWidget(menuOpend: menuOpend, icon: const Icon(Icons.payment_rounded), label: '支付'),
                MenuGroupWidget(menuOpend: menuOpend, label: '支持'),
                MenuItemWidget(menuOpend: menuOpend, icon: const Icon(Icons.contact_support_rounded), label: '需要帮助'),
                MenuItemWidget(menuOpend: menuOpend, icon: const Icon(Icons.email_rounded), label: '联系我们'),
                MenuGroupWidget(menuOpend: menuOpend, label: '设置'),
                MenuItemWidget(menuOpend: menuOpend, icon: const Icon(Icons.settings_rounded), label: '账号安全'),
                MenuItemWidget(menuOpend: menuOpend, icon: const Icon(Icons.nightlight_rounded), label: '夜间模式'),
                MenuItemWidget(menuOpend: menuOpend, icon: const Icon(Icons.logout_rounded), label: '退出登录'),
                const SizedBox(height: 12),
                if (menuOpend)
                  [
                    const Text("版权所有 🐼一只熊猫 ©2022").fontSize(12).textColor(Colors.white),
                    const SizedBox(height: 12),
                    const Text("Created with love for the community of designers and project managers.").textColor(const Color(0xff9BA4B0)),
                    const SizedBox(height: 12),
                  ].toColumn(crossAxisAlignment: CrossAxisAlignment.start).padding(left: 24, vertical: 20).border(top: 1, color: const Color(0xff323E4A)),
              ],
            ),
          );
        });
  }
}
