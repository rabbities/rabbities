import 'package:flutter/material.dart';

import 'rabbit/rabbit.dart';
import 'wechat/wechat.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          Expanded(child: RabbitPage()),
          Spacer(),
          SizedBox(
            width: 375,
            child: WeChatLayout(),
          )
        ],
      ),
    );
  }
}
