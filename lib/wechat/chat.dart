import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatLayout extends StatefulWidget {
  final Map<String, dynamic> arguments;

  const ChatLayout({Key? key, required this.arguments}) : super(key: key);

  // const ChatLayout({required this.arguments});

  @override
  _ChatLayoutState createState() => _ChatLayoutState();
}

class _ChatLayoutState extends State<ChatLayout> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  bool isShowBottomWidget = false;
  bool speaker = false;

  bool startSpeak = false;
  int startTimeSpeak = 1000;

  bool showOutterFrame = false;

  @override
  void initState() {
    scrollController.animateTo(
      0.0,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: SizedBox(
          width: size.width,
          child: Text(
            widget.arguments['name'],
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
          ),
        ),
//        title: ,
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            reverse: true,
            shrinkWrap: true,
            controller: scrollController,
            children: <Widget>[
              _buildMessageItemWidget(context, 6, "传奇工程师卡马克决定辞职专心搞AI！不再担任Oculus首席技术官，投身通用人工智能研究", true),
              _buildTime("刚刚"),
              _buildMessageItemWidget(context, 0, "hello 你好👋", false),
              _buildMessageItemWidget(context, 0, "hello 你好👋", true),
              _buildMessageItemWidget(context, 1, "assets/images/ins/1.jpg", false),
              _buildMessageItemWidget(context, 1, "assets/images/ins/1.jpg", true),
              _buildTime("今天 12:00"),
              _buildMessageItemWidget(context, 4, "聊天时长 00:36", false),
              _buildMessageItemWidget(context, 4, "聊天时长 00:36", true),
              _buildMessageItemWidget(context, 5, "语音时长 00:56", false),
              _buildMessageItemWidget(context, 5, "语音时长 00:56", true),
              _buildMessageItemWidget(context, 6, "传奇工程师卡马克决定辞职专心搞AI！不再担任Oculus首席技术官，投身通用人工智能研究", false),
              _buildTime("昨天 12:00"),
            ],
          ),
          if (startSpeak)
            SizedBox.fromSize(
              size: size,
              child: Ink(
                  color: showOutterFrame ? Colors.black54 : Colors.transparent,
                  child: InkWell(
                    onHover: (e) {
                      // print('showOutterFrame=$e');
                    },
                    child: Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  const Icon(
                                    FontAwesomeIcons.microphone,
                                    size: 60,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 5),
                                  RichText(
                                    text: TextSpan(
                                      text: '${(startTimeSpeak / 1000)}',
                                      style: const TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold),
                                      children: const <TextSpan>[
                                        TextSpan(text: 's', style: TextStyle(fontWeight: FontWeight.normal)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              width: 200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.reply,
                                    size: 20,
                                    color: Colors.grey[300],
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    '上划取消',
                                    style: TextStyle(color: Colors.grey[300]),
                                  ),
//                                      Icon(
//                                        Icons.translate,
//                                        size: 20,
//                                        color: Colors.grey[300],
//                                      ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            )
          else
            Container(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        // color: Theme.of(context).primaryColor,
        elevation: 0,
        child: _buildBottomInput(context),
      ),
    );
  }

  // ignore: prefer_typing_uninitialized_variables, avoid_init_to_null
  var timer = null;

  Widget _buildBottomInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AnimatedSwitcher(
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return ScaleTransition(child: child, scale: animation);
                  },
                  duration: const Duration(milliseconds: 300),
                  child: IconButton(
                    key: ValueKey('$speaker'),
                    icon: Icon(
                      speaker ? FontAwesomeIcons.keyboard : FontAwesomeIcons.microphoneLines,
                      size: 22,
                    ),
                    onPressed: () {
                      setState(() {
                        speaker = !speaker;
                      });
                    },
                  ),
                  reverseDuration: const Duration(milliseconds: 300),
                ),
                Expanded(
                  child: Ink(
                    padding: EdgeInsets.symmetric(horizontal: speaker ? 0 : 12),
                    decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(6)),
                    height: 42,
                    child: speaker
                        ? InkWell(
                            onTap: () {
                              _resetTimer();
                            },
                            onFocusChange: (e) {},
                            onHighlightChanged: (e) {
//
                            },
                            onTapDown: (e) {
                              _resetTimer();
                              timer = Timer.periodic(const Duration(milliseconds: 90), (timer) {
                                if (startTimeSpeak >= 60000) {
                                  _resetTimer();
                                  return;
                                }
                                setState(() {
                                  startTimeSpeak += 90;
                                });
                              });

                              setState(() {
                                startSpeak = true;
                              });
                            },
                            onTapCancel: () {
                              // print('onTapCancel');
                              _resetTimer();
                            },
                            child: const Center(
                              child: Text('按住说话', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                            ),
                          )
                        : TextField(
                            onTap: () {
                              setState(() {
                                isShowBottomWidget = false;
                              });
                            },
                            controller: _controller,
                            onChanged: (e) {
                              // print('object');
                            },
                            maxLines: 100,
                            onSubmitted: (ss) {
                              // print('ss==$ss');
                              FocusScope.of(context).requestFocus(FocusNode());
                              _controller.text = '';
                              setState(() {
                                isShowBottomWidget = false;
                              });
                            },
                            onEditingComplete: () {},
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
//                        border: OutlineInputBorder(),
                            ),
                          ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.faceSmile,
                    size: 24,
                  ),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    setState(() {
                      isShowBottomWidget = !isShowBottomWidget;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add_circle_outline,
                    size: 28,
                  ),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());

                    setState(() {
                      isShowBottomWidget = !isShowBottomWidget;
                    });
                  },
                ),
              ],
            ),
            isShowBottomWidget
                ? Container(
                    height: 320,
                    color: Colors.blueGrey,
                  )
                : SizedBox(height: MediaQuery.of(context).viewInsets.bottom)
          ],
        ),
      ),
    );
  }

  ///
  /// 重置时间器
  ///
  void _resetTimer() {
    setState(() {
      showOutterFrame = false;
      startSpeak = false;
      startTimeSpeak = 1000;
    });
    if (timer != null) timer.cancel();
  }

  Widget _buildTime(String time) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
          child: Text(
        time,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      )),
    );
  }

  Widget _buildMessageTypeWidget(int messageType, String content, bool isSendMessage) {
    switch (messageType) {
      case 0:
        return Text(content);
      case 1:
        return Ink(width: 120, child: Image(image: AssetImage(content)));
      case 2:
        return Ink(width: 120, child: Image(image: AssetImage(content)));
      case 3:
        break;
      case 4:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            isSendMessage ? Text(content) : Container(),
            const Icon(
              FontAwesomeIcons.video,
              size: 16,
            ),
            !isSendMessage ? Text(content) : Container()
          ],
        );
      case 5:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            isSendMessage ? Text(content) : Container(),
            const Icon(
              FontAwesomeIcons.microphoneLines,
              size: 16,
            ),
            !isSendMessage ? Text(content) : Container(),
          ],
        );
      case 6:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 248,
              child: Text(
                content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 6),
                  width: 200,
                  child: const Text(
                    "卡马克在自己的脸书上发出“告别帖”宣布将不再担任 Oculus 首席技术官。和之前从自己创办的游戏公司离开的缘由一样，他又找到了新的兴趣点。这一次，49 岁的卡马克决定要趁自己还没变老之前投身到「通用人工智能」",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                const Image(
                  image: AssetImage('assets/images/ins/1.jpg'),
                  height: 42,
                  width: 42,
                  fit: BoxFit.cover,
                )
              ],
            )
          ],
        );

      default:
        return Container();
    }
    return Container();
  }

  ///
  /// messageType 0文字  1 图片 2 视频  3 语音  4 语音童话 5 视频通话 6 链接
  ///

  Widget _buildMessageItemWidget(BuildContext context, int messageType, String content, bool isSendMessage) {
    return Row(
      mainAxisAlignment: !isSendMessage ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        isSendMessage
            ? Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                ),
                margin: const EdgeInsets.only(bottom: 20),
                child: _buildMessageTypeWidget(messageType, content, isSendMessage))
            : Container(),
        Ink(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed("user", arguments: widget.arguments);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 12, right: 12),
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage(isSendMessage ? 'assets/images/wechat/me_ic_tx.png' : widget.arguments['assetImage']),
                    fit: BoxFit.fitWidth,
                  )),
            ),
          ),
        ),
        !isSendMessage
            ? Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    isSendMessage ? Container() : Container(margin: const EdgeInsets.only(bottom: 6), child: Text(widget.arguments['name'])),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4.0),
                        ),
                      ),
                      child: _buildMessageTypeWidget(messageType, content, isSendMessage),
                    ),
                  ],
                ))
            : Container()
      ],
    );
  }
}
