import 'dart:math';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_system/products/youqi/api_youqi.dart';
import 'package:flutter_system/products/youqi/youqi_model.dart';
import 'package:flutter_system/utils/nav_utils.dart';
import 'package:flutter_system/utils/time_utils.dart';
import 'package:kicons/kicons.dart';

class YouQiHomePage extends StatefulWidget {
  @override
  _YouQiHomePageState createState() => _YouQiHomePageState();
}

class _YouQiHomePageState extends State<YouQiHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: requestYouQiResponseFromAssets(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              YouQiResponse response = snapshot.data;
              final modelList = response.data;
              return PageView.builder(
                itemBuilder: (context, index) {
                  return YouQiContentPage(modelList[index]);
                },
                itemCount: modelList.length ?? 0,
                pageSnapping: true,
                reverse: true,
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class YouQiContentPage extends StatefulWidget {
  final YouQiModel model;

  YouQiContentPage(this.model);

  @override
  _YouQiContentPageState createState() => _YouQiContentPageState();
}

class _YouQiContentPageState extends State<YouQiContentPage> {
  YouQiModel _model;

  @override
  void initState() {
    _model = widget.model;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: _model.bgImgUrl?.isEmpty ?? false
            ? BoxDecoration(
                color: _getBgColor(),
              )
            : BoxDecoration(
                image: DecorationImage(image: NetworkImage(_model.bgImgUrl)),
              ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildTopHeader(),
            _buildContent(),
            _buildBottomMenu(),
          ],
        ),
      ),
    );
  }

  Padding _buildBottomMenu() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FlatButton.icon(
                onPressed: null,
                label: Text(
                  "123",
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(
                  AliyunIcon.like,
                  color: Colors.white,
                ),
              ),
              FlatButton.icon(
                onPressed: null,
                label: Text(
                  "123",
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(
                  AliyunIcon.star,
                  color: Colors.white,
                ),
              ),
              FlatButton.icon(
                onPressed: null,
                label: Text(
                  "123",
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(
                  Icons.comment,
                  color: Colors.white,
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                onTap: null,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SizedBox(
              width: 30,
              height: 30,
              child: ClipPath(
                clipper: ShapeBorderClipper(shape: CircleBorder()),
                child: Image.asset("images/landscape1.jpeg"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          child: Container(
            height: 300,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        _model.content,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text("「 ${_model.source} 」"),
                    ),
                    InkWell(
                      onTap: () {
                        NavUtils.openWebView(context,
                            _model.contentDetail ?? "https://jiangkang.tech");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_forward),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopHeader() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FutureBuilder(
                future: requestMonthAliasResponseFromAssets(context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, List<String>> response = snapshot.data;
                    final list =
                        response[DateTime.now().month.toString()] ?? [""];
                    final randomName = list[Random().nextInt(list.length)];
                    return SizedBox(
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            randomName,
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Text(
                            "${TimeUtils.getLunarMonth(_getDateTime())}月${TimeUtils.getLunarDay(_getDateTime())}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
              Column(
                children: <Widget>[
                  CustomPaint(
                    painter: DateBoxPainter(),
                    child: SizedBox(
                        width: 60,
                        height: 60,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Align(
                                child: Text(
                                  _model.date.split("-")[1],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 21),
                                ),
                                alignment: AlignmentDirectional.topStart),
                            Align(
                              child: Text(
                                _model.date.split("-")[2],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 21),
                              ),
                              alignment: AlignmentDirectional.bottomEnd,
                            ),
                          ],
                        )),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  /// 从色值字符串中获取背景色
  Color _getBgColor() {
    if (_model.bgColor == null || _model.bgColor.isEmpty) {
      return Colors.transparent;
    } else {
      int colorInt = int.parse(_model.bgColor.substring(1), radix: 16);
      return Color(colorInt);
    }
  }

  DateTime _getDateTime() {
    final dateString = _model.date.split("-");
    return DateTime(
      int.parse(dateString[0]),
      int.parse(dateString[1]),
      int.parse(dateString[2]),
    );
  }
}

class DateBoxPainter extends CustomPainter {
  final Paint _painter = Paint()
    ..color = Colors.white
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
        Offset(6, size.height - 6), Offset(size.height - 6, 6), _painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
