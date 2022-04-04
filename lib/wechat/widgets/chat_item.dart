import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rabbit/core/core.dart';
import 'package:flutter_rabbit/wechat/chat.dart';
import 'package:get/get.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var assetImage = "assets/images/ins/face${Random().nextInt(5) + 1}.jpg";
    var name = RandomName.randomName(true, 3);
    var rins = Random().nextInt(1000);
    var now = DateTime.now().add(Duration(seconds: rins));

    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: Ink(
        color: Theme.of(context).primaryColor,
        child: ListTile(
          onTap: () {
            Get.to(
              () => ChatLayout(arguments: {
                "name": name,
                "assetImage": assetImage
              }),
            );
          },
          onLongPress: () {},
          isThreeLine: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                name,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                '${now.hour}:${now.minute}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              )
            ],
          ),
          subtitle: const Text("[视频通话]", style: TextStyle(color: Colors.grey)),
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
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                        image: DecorationImage(
                          image: AssetImage(assetImage),
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                ),
                rins % 2 == 0 ? _unReadPointWidget() : _unReadCountWidget(rins),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _unReadCountWidget(int count) {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        height: 18,
        padding: const EdgeInsets.only(left: 6, right: 6),
        child: Center(
          child: Text(
            "$count",
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Widget _unReadPointWidget() {
    return Positioned(
      top: 2,
      right: 2,
      child: Container(
        height: 10,
        width: 10,
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
