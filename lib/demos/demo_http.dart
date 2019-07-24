import 'package:flutter/material.dart';
import 'package:flutter_system/api/api_demo.dart';
import 'package:flutter_system/common/res_constants.dart';
import 'package:flutter_system/utils/nav_utils.dart';

class HttpDemo extends StatefulWidget {
  @override
  _HttpDemoState createState() {
    return _HttpDemoState();
  }
}

class _HttpDemoState extends State<HttpDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Http Demo"),
        ),
        body: SafeArea(
            child: FutureBuilder<ImageResponse>(
          future: fetchImages(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 6),
                  itemCount: snapshot.data.result.length,
                  itemBuilder: (context, index) {
                    final Map<String, dynamic> bean =
                        (snapshot.data.result)[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      child: InkWell(
                        child: FadeInImage.assetNetwork(
                          image: bean["img"] ?? IMG_URL0,
                          placeholder: "images/loading.gif",
                        ),
                        onTap: () {
                          NavUtils.openWebView(context,
                              "https://github.com/jiangkang/flutter-system");
                        },
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(child: Text("Error occurs! ${snapshot.error}"));
            }
            return Center(child: CircularProgressIndicator());
          },
        )));
  }
}
