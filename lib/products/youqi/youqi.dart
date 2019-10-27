import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_system/products/youqi/api_youqi.dart';
import 'package:flutter_system/products/youqi/youqi_model.dart';
import 'package:kicons/kicons.dart';

class YouQiHomePage extends StatefulWidget {
  @override
  _YouQiHomePageState createState() => _YouQiHomePageState();
}

class _YouQiHomePageState extends State<YouQiHomePage> {
  YouQiModel _model;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: requestYouQiResponseFromAssets(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          YouQiResponse response = snapshot.data;
          final modelList = response.data;
          _model = modelList.first;
          print("model:${_model.toString()}");
          return Scaffold(
            body: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: _model.bgImgUrl?.isEmpty ?? false
                  ? BoxDecoration(
                      color: _getBgColor(),
                    )
                  : BoxDecoration(
                      image:
                          DecorationImage(image: NetworkImage(_model.bgImgUrl)),
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
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Padding _buildBottomMenu() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
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
                label: Text("123"),
                icon: Icon(AliyunIcon.like),
              ),
              FlatButton.icon(
                onPressed: null,
                label: Text("12"),
                icon: Icon(AliyunIcon.star),
              ),
              FlatButton.icon(
                onPressed: null,
                label: Text("123"),
                icon: Icon(Icons.comment),
              ),
              InkWell(
                child: Icon(Icons.share),
                onTap: null,
              ),
            ],
          ),
          CircleAvatar(
            child: Icon(Icons.person_outline),
          ),
        ],
      ),
    );
  }

  Padding _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: SizedBox(
          width: double.maxFinite,
          height: 240,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(_model.content),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Text(_model.source),
                  InkWell(
                    child: Icon(Icons.details),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopHeader() {
    return SizedBox(
      height: 100,
      child: Row(
        children: <Widget>[
          Text(_model.date),
        ],
      ),
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
}
