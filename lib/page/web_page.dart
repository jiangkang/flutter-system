import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  final String? title;

  final String? webUrl;

  @override
  _WebPageState createState() {
    return _WebPageState();
  }

  const WebPage(this.title, this.webUrl, {Key? key}) : super(key: key);
}

class _WebPageState extends State<WebPage> {
  late bool _loadFinished;

  @override
  void initState() {
    _loadFinished = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        centerTitle: true,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              });
        }),
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          WebView(
            initialUrl: widget.webUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (url) {
              setState(() {
                _loadFinished = true;
              });
            },
            onWebViewCreated: (controller) {},
            navigationDelegate: (NavigationRequest request) {
              return NavigationDecision.navigate;
            },
          ),
          Visibility(
            visible: !_loadFinished,
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
