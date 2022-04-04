import 'package:flutter/material.dart';
import 'package:flutter_rabbit/wechat/wechat.dart';
import 'package:get/get.dart';

class MeComponent extends StatefulWidget {
  const MeComponent({Key? key}) : super(key: key);

  @override
  _MeComponentState createState() => _MeComponentState();
}

class _MeComponentState extends State<MeComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 8, top: 12),
          child: Ink(
            color: Theme.of(context).primaryColor,
            child: ListTile(
              contentPadding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 18),
              onTap: () {},
              onLongPress: () {},
              isThreeLine: false,
              title: const Text(
                "一只熊猫🐼",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
              subtitle: Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "微信号：w_0482",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: const <Widget>[
                          Icon(
                            Icons.apps,
                            size: 16,
                            color: Colors.grey,
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: Colors.grey,
                          ),
                        ],
                      )
                    ],
                  )),
              leading: Container(
                height: 48,
                width: 48,
                decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/wechat/me_ic_tx.png"),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
        ),
        ListItemWidget("支付", Icons.payment, false, () {}),
        ListItemWidget("收藏", Icons.collections_bookmark, false, () {}, margin: 0),
        ListItemWidget("相册", Icons.photo, false, () {}, margin: 0),
        ListItemWidget("卡包", Icons.credit_card, false, () {}, margin: 0),
        ListItemWidget("表情", Icons.face, false, () {}),
        ListItemWidget("设置", Icons.settings, false, () {
          Get.to(const SettingsLayout());
        }, margin: 0),
      ],
    );
  }
}
