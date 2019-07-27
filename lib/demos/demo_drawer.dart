import 'package:flutter/material.dart';
import 'package:flutter_system/component/listview_item.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerDemo extends StatefulWidget {
  @override
  _DrawerDemoState createState() => _DrawerDemoState();
}

class _DrawerDemoState extends State<DrawerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer Demo"),
        centerTitle: true,
        actions: <Widget>[
          InkWell(
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.arrow_back),
            ),
            onTap: () => Navigator.of(context).pop(),
          )
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
            child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("images/landscape0.jpeg")),
                ),
                child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "Flutter System",
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ))),
            ListTile(
              title: Text("Github"),
            ),
            ListTile(
              title: Text("博客"),
            ),
            ListTile(
              title: Text("微信公众号"),
              trailing: Text("超光速"),
            ),
            ListTile(
              title: Text("建议与反馈"),
            )
          ],
        )),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return SafeArea(
              child: ListView(
            children: <Widget>[
              ListTileCard(
                  borderRadius: 4.0,
                  title: Text("Show a SnackBar"),
                  onTap: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("欢迎关注微信公众号:超光速"),
                      backgroundColor: Theme.of(context).accentColor,
                      action: SnackBarAction(
                          label: "关注",
                          textColor: Colors.white,
                          onPressed: () {
                            launch(
                                "https://mp.weixin.qq.com/mp/profile_ext?action=home&__biz=MjM5ODQ5OTIzMw==#wechat_redirect");
                          }),
                    ));
                  }),
              ListTileCard(
                title: Text("Show a BottomSheet"),
                onTap: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(8)),
                      context: context,
                      builder: (context) => BottomSheet(
                          onClosing: () {},
                          builder: (BuildContext context) => ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) => ListTile(
                                    title: Text("Item:$index"),
                                  ))));
                },
              )
            ],
          ));
        },
      ),
    );
  }
}
