import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class ConversationView extends StatelessWidget {
  const ConversationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return [
      [
        const _TitleWidgt(),
        const SizedBox(height: 1),
        const _ChatItemWidget(),
        const SizedBox(height: 1),
        const _ChatItemWidget(),
        const SizedBox(height: 1),
        const _ChatItemWidget(),
        const SizedBox(height: 1),
        const _ChatItemWidget(),
      ]
          .toColumn(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .width(340)
          .parent(
            ({required child}) => SingleChildScrollView(
              child: child,
              controller: ScrollController(),
            ),
          ),
      const Spacer()
    ]
        .toRow(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
        )
        .parent(
          ({required child}) => SizedBox(
            child: child,
            height: double.infinity,
          ),
        );
  }
}

class _ChatItemWidget extends StatelessWidget {
  const _ChatItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return [
      Image.asset("assets/images/icon-128.png", width: 42, height: 42).clipRRect(all: 8),
      const SizedBox(width: 12),
      [
        [
          const Text('设计团队').fontSize(16).textColor(const Color(0xff323E4A)).width(180),
          const Text('4:01 PM').fontSize(12).textColor(const Color(0xff8D97A5)),
        ].toRow(),
        const SizedBox(height: 4),
        const Text('小红：原型重写，再提交设计！', maxLines: 2).fontSize(12).textColor(const Color(0xff51606D)).width(180),
      ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    ]
        .toRow(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .padding(top: 30, horizontal: 30, bottom: 24)
        .width(340)
        .ripple(hoverColor: const Color(0xffF7F9FE))
        .backgroundColor(Colors.white)
        .gestures(
          onTap: () {},
        );
  }
}

class _TitleWidgt extends StatelessWidget {
  const _TitleWidgt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return [
      const Text('所有消息').textColor(const Color(0xff323E4A)),
      const Text('新消息')
          .fontSize(10)
          .textColor(
            const Color(0xff5965DB),
          )
          .padding(horizontal: 4, vertical: 4)
          .backgroundColor(
            const Color(0xffEBEDFB),
          )
          .clipRRect(all: 3)
    ]
        .toRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        )
        .padding(
          horizontal: 32,
        )
        .backgroundColor(Colors.white)
        .height(44);
  }
}
