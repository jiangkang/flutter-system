import 'package:flutter/material.dart';
import 'package:kicons/kicons.dart';

class IconFont extends StatefulWidget {
  const IconFont({Key? key}) : super(key: key);

  @override
  IconFontState createState() => IconFontState();
}

class IconFontState extends State<IconFont> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IconFont"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Emoji",
                    style: TextStyle(fontSize: 21),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    width: 50,
                    child: Divider(
                      color: Colors.redAccent,
                      thickness: 2,
                    ),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 7,
                  children: EmojiIcon.toList().map((data) {
                    return Icon(data);
                  }).toList(),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Aliyun",
                    style: TextStyle(fontSize: 21),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    width: 50,
                    child: Divider(
                      color: Colors.redAccent,
                      thickness: 2,
                    ),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 7,
                  children: AliyunIcon.toList().map((data) {
                    return Icon(data);
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
