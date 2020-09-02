import 'package:best_toast/best_toast.dart';
import 'package:flutter/material.dart';

class ToastDemo extends StatefulWidget {
  @override
  _ToastDemoState createState() => _ToastDemoState();
}

class _ToastDemoState extends State<ToastDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toast"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("显示文本Toast"),
            onTap: () {
              Toast.showMessage(context, "简单的文本");
            },
          ),
          ListTile(
            title: Text("显示带样式的Toast"),
          ),
          ListTile(
            title: Text("显示图片的Toast"),
          ),
        ],
      ),
    );
  }
}
