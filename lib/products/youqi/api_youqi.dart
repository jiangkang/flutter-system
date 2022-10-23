import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_system/products/youqi/youqi_model.dart';
import 'package:http/http.dart';

Future<YouQiResponse> requestYouQiResponseFromApi(String url) async {
  final uri = Uri.parse(url);
  return get(uri).then((value) {
    return YouQiResponse.fromJson(jsonDecode(value.body));
  }).catchError((err) {
    throw HttpException(err.toString());
  });
}

Future<YouQiResponse> requestYouQiResponseFromAssets(
    BuildContext context) async {
  String json = await rootBundle.loadString("assets/json/youqi.json");
  return YouQiResponse.fromJson(jsonDecode(json));
}

Future<Map<String, List<String>>> requestMonthAliasResponseFromAssets(
    BuildContext context) async {
  parser(jsonData) {
    Map<String, dynamic> map = json.decode(jsonData);
    Map<String, List<String>> result = map.map((key, value) {
      return MapEntry(key, List<String>.from(value));
    });
    return SynchronousFuture(result);
  }
  return DefaultAssetBundle.of(context)
      .loadStructuredData<Map<String, List<String>>>(
          "assets/json/month_traditional.json", parser);
}
