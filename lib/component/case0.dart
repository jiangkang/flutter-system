import 'package:flutter/material.dart';

/// 一个封面图 + 1个标题 + 一个头像 + 用户名 + 点赞数
/// TODO: 瀑布流
class ShowCase0 extends StatelessWidget {
  const ShowCase0(
      {Key key,
      this.radius,
      this.imgUrl,
      this.title,
      this.avatarUrl,
      this.username,
      this.likeNum})
      : super(key: key);

  /// card半径
  final double radius;

  /// 图片url
  final String imgUrl;

  /// 标题文本
  final String title;

  /// 图像url
  final String avatarUrl;

  /// 用户名
  final String username;

  /// 点赞数
  final int likeNum;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            imgUrl,
            fit: BoxFit.contain,
          ),
          Text(title),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    maxRadius: 8,
                    child: Image.network(avatarUrl),
                  ),
                  Text(username),
                ],
              ),
              FlatButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.favorite_border),
                  label: Text(likeNum.toString()))
            ],
          )
        ],
      ),
    );
  }
}
