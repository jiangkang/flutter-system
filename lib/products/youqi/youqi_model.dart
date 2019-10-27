import 'dart:math';

/// YouQi Model
class YouQiModel {
  /// 背景图片
  final String bgImgUrl;

  /// 背景色
  final String bgColor;

  /// 日期: yyyy-MM-dd,同时作为ID
  final String date;

  /// 内容
  final String content;

  /// 内容来源
  final String source;

  /// 内容细节
  final String contentDetail;

  /// 内容细节网页版url
  final String detailUrl;

  YouQiModel(
      {this.bgImgUrl = "",
      this.bgColor = "",
      this.date = "",
      this.content = "",
      this.source = "",
      this.contentDetail = "",
      this.detailUrl = ""});

  factory YouQiModel.fromJson(Map<String, dynamic> json) {
    return YouQiModel(
        bgImgUrl: json["bgImgUrl"],
        bgColor: json["bgColor"],
        date: json["date"],
        content: json["content"],
        source: json["source"],
        contentDetail: json["contentDetail"],
        detailUrl: json["detailUrl"]);
  }

  @override
  String toString() {
    return 'YouQiModel{bgImgUrl: $bgImgUrl, bgColor: $bgColor, date: $date, content: $content, source: $source, contentDetail: $contentDetail, detailUrl: $detailUrl}';
  }
}

class YouQiResponse {
  final String code;

  final String msg;

  final List<YouQiModel> data;

  YouQiResponse({this.code, this.msg, this.data});

  factory YouQiResponse.fromJson(Map<String, dynamic> json) {
    return YouQiResponse(
        code: json["code"],
        msg: json["msg"],
        data: List<dynamic>.from(json["data"]).map((d) {
          print(d);
          return YouQiModel.fromJson(d);
        }).toList());
  }
}

class MonthAliasResponse {
  final List<String> month1;
  final List<String> month2;
  final List<String> month3;
  final List<String> month4;
  final List<String> month5;
  final List<String> month6;
  final List<String> month7;
  final List<String> month8;
  final List<String> month9;
  final List<String> month10;
  final List<String> month11;
  final List<String> month12;

  MonthAliasResponse(
      {this.month1,
      this.month2,
      this.month3,
      this.month4,
      this.month5,
      this.month6,
      this.month7,
      this.month8,
      this.month9,
      this.month10,
      this.month11,
      this.month12});

  factory MonthAliasResponse.fromJson(Map<String, List<String>> json) {
    return MonthAliasResponse(
        month1: json["month1"],
        month2: json["month2"],
        month3: json["month3"],
        month4: json["month4"],
        month5: json["month5"],
        month6: json["month6"],
        month7: json["month7"],
        month8: json["month8"],
        month9: json["month9"],
        month10: json["month10"],
        month11: json["month11"],
        month12: json["month12"]);
  }

  /// 获取随机名字
  String getRandomName(List<String> names) {
    int index = Random().nextInt(names.length);
    return names[index];
  }
}
