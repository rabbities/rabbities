import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Center(
            child: Container(
              height: 32,
              width: 32,
              decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/wechat/me_ic_tx.png"),
                    fit: BoxFit.fitWidth,
                  )),
            ),
          ),
          _unReadPointWidget(),
        ],
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
