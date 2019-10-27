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
