import 'package:flutter/material.dart';
import 'package:flutter_system/component/listview_item.dart';
import 'package:flutter_system/utils/pickers_utils.dart';
import 'package:share/share.dart';

class ShareDemoPage extends StatefulWidget {
  const ShareDemoPage({Key? key}) : super(key: key);

  @override
  ShareDemoPageState createState() => ShareDemoPageState();
}

class ShareDemoPageState extends State<ShareDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share"),
      ),
      body: ListView(
        children: [
          ListTileCard(
            title: Text("Share Text"),
            onTap: () {
              Share.share("这是一段分享文本");
            },
          ),
          ListTileCard(
            title: Text("Share Text With Subject"),
            onTap: () {
              Share.share("这是一段分享文本", subject: "主题");
            },
          ),
          ListTileCard(
            title: Text("Share Files"),
            onTap: () async {
              final pickedFile = await Pickers.pickImageFromGallery();
              await Share.shareFiles([(pickedFile.path)], text: "美图");
            },
          ),
        ],
      ),
    );
  }
}
