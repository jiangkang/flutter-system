import 'package:flutter/material.dart';
import 'package:flutter_system/products/youqi/widgets/youqi_top_header.dart';
import 'package:flutter_system/products/youqi/youqi_model.dart';
import 'package:flutter_system/utils/nav_utils.dart';
import 'package:kicons/kicons.dart';

class YouQiContentPage extends StatefulWidget {
  final YouQiModel model;

  const YouQiContentPage(this.model, {Key? key}) : super(key: key);

  @override
  _YouQiContentPageState createState() => _YouQiContentPageState();
}

class _YouQiContentPageState extends State<YouQiContentPage> {
  late YouQiModel _model;

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
                image: DecorationImage(image: NetworkImage(_model.bgImgUrl!)),
              ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            YouQiTopHeader(model: _model),
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
              TextButton.icon(
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
              TextButton.icon(
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
              TextButton.icon(
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
                onTap: null,
                child: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
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
                        _model.content!,
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

  /// 从色值字符串中获取背景色
  Color _getBgColor() {
    if (_model.bgColor == null || _model.bgColor!.isEmpty) {
      return Colors.transparent;
    } else {
      int colorInt = int.parse(_model.bgColor!.substring(1), radix: 16);
      return Color(colorInt);
    }
  }
}
