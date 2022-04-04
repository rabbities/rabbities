import 'package:flutter/material.dart';

class SettingItem {
  String title;
  String url;
  double margin;
  bool center = false;

  SettingItem(this.title, this.url, {this.margin = 0, this.center = false});
}

class SettingsLayout extends StatefulWidget {
  const SettingsLayout({Key? key}) : super(key: key);

  @override
  _SettingsLayoutState createState() => _SettingsLayoutState();
}

class _SettingsLayoutState extends State<SettingsLayout> {
  List<SettingItem> settingItems = [
    SettingItem("账号与安全", "", margin: 12),
    SettingItem("新消息提醒", ""),
    SettingItem("勿扰模式", ""),
    SettingItem("聊天", ""),
    SettingItem("隐私", ""),
    SettingItem("通用", "", margin: 12),
    SettingItem("关于微信", ""),
    SettingItem("帮助与反馈", "", margin: 12),
    SettingItem("插件", "", margin: 12),
    SettingItem("切换账号", "", margin: 12, center: true),
    SettingItem("退出", "", center: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('设置')),
        // appBar: appBarWidget(context, ""),
        body: ListView.builder(
            itemCount: settingItems.length,
            itemBuilder: (context, index) {
              return _buildSettingItem(context, settingItems[index]);
            }));
  }

  Widget _buildSettingItem(BuildContext context, SettingItem item) {
    return Column(
      children: <Widget>[
        Ink(
          color: Theme.of(context).primaryColor,
          child: item.center
              ? ListTile(
                  title: Center(child: Text(item.title)),
                  onTap: () {},
                )
              : ListTile(
                  trailing: const Icon(Icons.navigate_next),
                  title: Text(item.title),
                  onTap: () {},
                ),
        ),
        SizedBox(
          height: item.margin,
        )
      ],
    );
  }
}
