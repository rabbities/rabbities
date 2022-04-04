import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'wechat.dart';

class WeChatLayout extends StatefulWidget {
  const WeChatLayout({Key? key}) : super(key: key);

  @override
  _WeChatLayoutState createState() => _WeChatLayoutState();
}

class _WeChatLayoutState extends State<WeChatLayout> {
  int _selectedIndex = 0;

  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 1500), (_timer) {
      setState(() {
        showLoading = false;
      });
      _timer.cancel();
    });
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _defaultPageController.jumpToPage(index);
  }

  final List<String> titles = [
    '微信',
    '通讯录',
    '发现',
    ''
  ];

  final PageController _defaultPageController = PageController(initialPage: 0, keepPage: true);

  bool showLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            Text(
              titles[_selectedIndex],
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
            showLoading
                ? Container(
                    margin: const EdgeInsets.only(left: 6),
                    width: 16,
                    height: 16,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      // backgroundColor: Colors.white,
                    ),
                  )
                : Container(),
          ],
        ),
        actions: _buildAction(),
      ),
      body: PageView(
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
        controller: _defaultPageController,
        children: const <Widget>[
          ChatComponent(),
          ContactComponent(),
          MomentComponent(),
          MeComponent(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
        // backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(FontAwesomeIcons.solidComment),
            icon: Icon(FontAwesomeIcons.comment),
            label: '微信',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.addressBook),
            activeIcon: Icon(FontAwesomeIcons.solidAddressBook),
            label: '通讯录',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(FontAwesomeIcons.solidCompass),
            icon: Icon(FontAwesomeIcons.compass),
            label: '发现',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(FontAwesomeIcons.solidUser),
            icon: Icon(FontAwesomeIcons.user),
            label: '我',
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAction() {
    if (_selectedIndex != 3) {
      return [
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () async {
              await _showMenu();
            })
      ];
    }
    return [
      IconButton(
          icon: const Icon(
            Icons.camera_alt,
            color: Colors.white,
          ),
          onPressed: () {})
    ];
  }

  Future _showMenu() async {
    var style = const TextStyle(color: Colors.white, fontSize: 16);
    await showMenu(context: context, color: Colors.black54, position: const RelativeRect.fromLTRB(2.0, 64.0, 1.0, 0.0), items: <PopupMenuItem<String>>[
      PopupMenuItem<String>(
          textStyle: style,
          value: 'value01',
          child: Row(children: const <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0), child: Icon(Icons.message, color: Colors.white)),
            Text('发起群聊')
          ])),
      PopupMenuItem<String>(
          textStyle: style,
          value: 'value02',
          child: Row(children: const <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0), child: Icon(Icons.person_add, color: Colors.white)),
            Text(
              '添加朋友',
            )
          ])),
      PopupMenuItem<String>(
          textStyle: style,
          value: 'value03',
          child: Row(children: const <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0), child: Icon(Icons.scanner, color: Colors.white)),
            Text('扫一扫')
          ])),
      PopupMenuItem<String>(
          textStyle: style,
          value: 'value04',
          child: Row(children: const <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0), child: Icon(Icons.spellcheck, color: Colors.white)),
            Text('收付款')
          ])),
      PopupMenuItem<String>(
          textStyle: style,
          value: 'value05',
          child: Row(children: const <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0), child: Icon(Icons.email, color: Colors.white)),
            Text('帮助与反馈')
          ]))
    ]);
  }
}
