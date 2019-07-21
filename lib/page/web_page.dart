import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  final String title;

  final String webUrl;

  @override
  _WebPageState createState() {
    return _WebPageState();
  }

  WebPage(this.title, this.webUrl);
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: widget.webUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
