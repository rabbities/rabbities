import 'package:flutter/material.dart';

class ContactComponent extends StatefulWidget {
  const ContactComponent({Key? key}) : super(key: key);

  @override
  _ContactComponentState createState() => _ContactComponentState();
}

class _ContactComponentState extends State<ContactComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      const SizedBox(height: 12),
      Ink(
        color: Theme.of(context).primaryColor,
        child: ListTile(
          contentPadding: const EdgeInsets.only(top: 8, bottom: 8, left: 18, right: 18),
          onTap: () {},
          onLongPress: () {},
          isThreeLine: false,
          title: const Text(
            "新朋友",
          ),
          leading: SizedBox(
            width: 64,
            height: 64,
            child: Stack(
              fit: StackFit.loose,
              children: <Widget>[
                Center(
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                        image: DecorationImage(
                          image: AssetImage("assets/images/wechat/pangyuhao.jpg"),
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                ),
//                _unReadCountWidget(),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
