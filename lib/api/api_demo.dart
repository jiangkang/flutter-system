import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

const String HOST_DEMO = "https://api.apiopen.top";

const String defaultPage = "0";

const String defaultCount = "30";

/// 获取图片列表
Future<ImageResponse> fetchImages() async {
  return getImages().then((response) {
    return ImageResponse.fromJson(json.decode(response.body));
  }).catchError((error) {
    throw HttpException("statusCode: ${error.toString()}");
  });
}

Future<Response> getImages() => get("$HOST_DEMO/getImages",
    headers: {"page": defaultPage, "count": defaultCount});

/// 获取新闻列表
Future<Response> getNews() => get("$HOST_DEMO/getWangYiNews",
    headers: {"page": defaultPage, "count": defaultCount});

/// 获取城市列表
Future<Response> getWeather(String city) =>
    get("$HOST_DEMO/weatherApi", headers: {"city": city});

/// 获取唐诗列表
Future<Response> getTangPoets() => get("$HOST_DEMO/getTangPoetry",
    headers: {"page": defaultPage, "count": defaultCount});

/// 获取宋诗列表
Future<Response> getSongPoets() => get("$HOST_DEMO/getSongPoetry",
    headers: {"page": defaultPage, "count": defaultCount});

/// 获取一首随机的诗词
Future<Response> getRecPoet() => get("$HOST_DEMO/recommendPoetry");

/// Model:图片列表响应
class ImageResponse {
  final int code;
  final String message;
  final List<Map<String, dynamic>> result;

  ImageResponse(this.code, this.message, this.result);

  factory ImageResponse.fromJson(Map<String, dynamic> json) => ImageResponse(
      json["code"] as int,
      json["message"] as String,
      List<Map<String, dynamic>>.from(json["result"]));
}

/// Model:图片数据
class ImageBean {
  final String img;
  final String publishedAt;

  ImageBean({this.img, this.publishedAt});

  factory ImageBean.fromJson(Map<String, String> json) {
    return ImageBean(img: json["img"], publishedAt: json["publishedAt"]);
  }
}
