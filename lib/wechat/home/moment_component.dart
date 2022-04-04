import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../wechat.dart';

class MomentComponent extends StatefulWidget {
  const MomentComponent({Key? key}) : super(key: key);

  @override
  _ContactComponentState createState() => _ContactComponentState();
}

class _ContactComponentState extends State<MomentComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      const SizedBox(height: 12),
      ListItemWidget("朋友圈", Icons.supervised_user_circle, true, () {
        // Navigator.of(context).pushNamed('momennt');

        Get.to(() => const MomentLayout());
      }),
      ListItemWidget("购物", Icons.shopping_cart, false, () {})
    ]);
  }
}

class ListItemWidget extends StatelessWidget {
  final String title;
  final bool showAvatar;
  final IconData icon;
  final GestureTapCallback onTap;
  final double margin;

  const ListItemWidget(this.title, this.icon, this.showAvatar, this.onTap, {Key? key, this.margin = 8}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: margin),
      child: Ink(
        color: Theme.of(context).primaryColor,
        child: ListTile(
          onTap: onTap,
          title: Text(
            title,
          ),
          leading: Icon(icon),
          trailing: SizedBox(
            width: 128,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                showAvatar ? const AvatarWidget() : Container(),
                const Icon(Icons.navigate_next),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
