import 'package:flutter/material.dart';

class UserLayout extends StatefulWidget {
  final Map<String, dynamic> arguments;

  const UserLayout({Key? key, required this.arguments}) : super(key: key);

  @override
  _UserLayoutState createState() => _UserLayoutState();
}

class _UserLayoutState extends State<UserLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {
                _showBottomSheet();
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          _buildHeader(),
          const SizedBox(height: 2),
          _buildItem("电话号码", false, "155****8888"),
          const SizedBox(height: 12),
          _buildItem("朋友圈", true, null),
          const SizedBox(height: 2),
          _buildItem("更多信息", true, null),
          const SizedBox(height: 12),
          _buildMessageItem(Icons.message, "发消息", () {
            Navigator.of(context).pushNamed('chat', arguments: widget.arguments);
          }),
          const SizedBox(height: 2),
          _buildMessageItem(Icons.videocam, "发视频", () {}),
        ],
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Ink(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
                color: Colors.grey[50], // or some other color
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
            child: Column(
              children: <Widget>[
                _buildSheetItem('设置备注和标签'),
                const SizedBox(height: 2),
                _buildSheetItem('把他/她推荐给朋友'),
                const SizedBox(height: 2),
                _buildSheetItem('取消星标朋友'),
                const SizedBox(height: 2),
                _buildSheetItem('设置朋友圈和视频动态权限'),
                const SizedBox(height: 2),
                _buildSheetItem('加入黑名单'),
                const SizedBox(height: 2),
                _buildSheetItem('投诉'),
                const SizedBox(height: 2),
                _buildSheetItem('添加到桌面'),
                const SizedBox(height: 2),
                _buildSheetItem('删除'),
                const SizedBox(height: 12),
                _buildSheetItem('取消'),
                // SizedBox(height: 56),
              ],
            ),
          );
        });
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.only(top: 20, bottom: 20, left: 18, right: 18),
        onTap: () {},
        onLongPress: () {},
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(children: <Widget>[
              Text(widget.arguments['name'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              const Icon(Icons.person, color: Colors.green)
            ]),
            const Icon(Icons.star, color: Colors.orange)
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: const Text(
                "微信号：w_0482",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: const Text(
                "地区：湖南 长沙",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
        leading: Container(
          height: 64,
          width: 60,
          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(6.0)), image: DecorationImage(image: AssetImage(widget.arguments['assetImage']), fit: BoxFit.cover)),
        ),
      ),
    );
  }

  Widget _buildItem(String title, bool showLeft, String? subTitle) {
    return Ink(
      color: Colors.white,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(title),
                  subTitle != null
                      ? Container(
                          margin: const EdgeInsets.only(left: 12),
                          child: const Text(
                            "1555***0999",
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      : Container(),
                ],
              ),
              showLeft
                  ? const Icon(
                      Icons.navigate_next,
                      color: Colors.grey,
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageItem(IconData icons, String title, GestureTapCallback onTap) {
    return Ink(
        color: Colors.white,
        child: InkWell(
            onTap: onTap,
            child: Container(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 12, bottom: 12),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                  Icon(icons, color: Colors.blue[400]),
                  const SizedBox(width: 12),
                  Text(title, style: TextStyle(color: Colors.blue[400])),
                ]))));
  }

  Widget _buildSheetItem(String title) {
    return Ink(
        color: Colors.white,
        child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(padding: const EdgeInsets.only(left: 18, right: 18, top: 12, bottom: 12), child: Center(child: Text(title)))));
  }
}
