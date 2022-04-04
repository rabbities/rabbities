import 'package:flutter/material.dart';
import 'package:flutter_rabbit/core/core.dart';

Color nameColor = const Color.fromRGBO(97, 106, 137, 1);

class MomentLayout extends StatefulWidget {
  const MomentLayout({Key? key}) : super(key: key);

  @override
  _MomentLayoutState createState() => _MomentLayoutState();
}

class _MomentLayoutState extends State<MomentLayout> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              primary: true,
              elevation: 0,
              stretch: true,
              centerTitle: false,
              title: const Text('朋友圈'),
              forceElevated: true,
              automaticallyImplyLeading: true,
              pinned: true,
//              titleSpacing: NavigationToolbar.kMiddleSpacing,
              expandedHeight: 220.0,
              floating: false,
              snap: false,
              flexibleSpace: const FlexibleSpaceBar(
                collapseMode: CollapseMode.none,
                background: Image(
                  image: AssetImage("assets/images/ins/1.jpg"),
                  fit: BoxFit.cover,
                ),
                centerTitle: false,
                stretchModes: [
                  StretchMode.fadeTitle,
                  StretchMode.blurBackground,
                  StretchMode.zoomBackground,
                ],
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.camera_alt,
                  ),
                  tooltip: 'Add new entry',
                  onPressed: () {
                    /* ... */
                  },
                ),
              ],
            ),
          ];
        },
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              var name = RandomName.randomName(false, 4);

              return Container(
                margin: const EdgeInsets.only(top: 4, bottom: 12, left: 18, right: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Ink(
                      height: 42,
                      width: 42,
                      decoration: const BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                          image: DecorationImage(
                            image: AssetImage("assets/images/wechat/me_ic_tx.png"),
                            fit: BoxFit.fitWidth,
                          )),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            name,
                            style: TextStyle(color: nameColor),
                          ),
                          const SizedBox(height: 5),
                          const Text("今天是个好日常"),
                          const SizedBox(height: 4),
                          Row(
                            children: <Widget>[
                              Ink(
                                height: 96,
                                width: 96,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(1.0),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/ins/4.jpg"),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              const SizedBox(width: 4),
                              Ink(
                                height: 96,
                                width: 96,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(1.0),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/ins/6.jpg"),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              const SizedBox(width: 4),
                              Ink(
                                height: 96,
                                width: 96,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(1.0),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/ins/3.jpg"),
                                      fit: BoxFit.cover,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text("湖南 长沙", style: TextStyle(fontSize: 11, color: Colors.grey.withOpacity(0.7))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("42分钟以前", style: TextStyle(fontSize: 11, color: Colors.grey.withOpacity(0.7))),
                              IconButton(icon: const Icon(Icons.more_horiz), color: Colors.grey.withOpacity(0.7), onPressed: () {})
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 6, right: 6, bottom: 4, top: 4),
                            color: Theme.of(context).primaryColor.withOpacity(0.2),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    const Icon(
                                      Icons.favorite_border,
                                      color: Color.fromRGBO(97, 106, 137, 1),
                                      size: 15,
                                    ),
                                    Text(
                                      RandomName.randomName(false, 4),
                                      style: TextStyle(color: nameColor),
                                    ),
                                    Text(
                                      RandomName.randomName(true, 3),
                                      style: TextStyle(color: nameColor),
                                    ),
                                    Text(
                                      RandomName.randomName(true, 2),
                                      style: TextStyle(color: nameColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  height: 1,
                                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 6, right: 6, bottom: 4, top: 4),
                            color: Theme.of(context).primaryColor.withOpacity(0.2),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "张宣言",
                                      style: TextStyle(color: nameColor),
                                    ),
                                    Text(
                                      "：有合适的妹子不",
                                      style: TextStyle(color: Theme.of(context).primaryColorLight),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
