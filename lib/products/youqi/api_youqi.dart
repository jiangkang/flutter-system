import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_system/products/youqi/youqi_model.dart';
import 'package:http/http.dart';

Future<YouQiResponse> requestYouQiResponseFromApi(String url) async {
  return get(url).then((value) {
    return YouQiResponse.fromJson(jsonDecode(value.body));
  }).catchError((err) {
    throw HttpException(err.toString());
  });
}

Future<YouQiResponse> requestYouQiResponseFromAssets(
    BuildContext context) async {
  Future<YouQiResponse> Function(String value) parser = (jsonData) {
    final YouQiResponse response =
        YouQiResponse.fromJson(json.decode(jsonData));
    return SynchronousFuture(response);
  };
  return DefaultAssetBundle.of(context)
      .loadStructuredData<YouQiResponse>("assets/json/youqi.json", parser);
}

//Future<MonthAliasResponse> requestMonthAliasResponseFromAssets(
//    BuildContext context) async {
//  Future<MonthAliasResponse> Function(String value) parser = (jsonData) {
//    final response = MonthAliasResponse.fromJson(json.decode(jsonData));
//    return SynchronousFuture(response);
//  };
//  return DefaultAssetBundle.of(context).loadStructuredData<MonthAliasResponse>(
//      "assets/json/month_traditional.json", parser);
//}

Future<Map<String, List<String>>> requestMonthAliasResponseFromAssets(
    BuildContext context) async {
  Future<Map<String, List<String>>> Function(String value) parser = (jsonData) {
    Map<String, dynamic> map = json.decode(jsonData);
    Map<String, List<String>> result = map.map((key, value) {
      return MapEntry(key, List<String>.from(value));
    });
    return SynchronousFuture(result);
  };
  return DefaultAssetBundle.of(context)
      .loadStructuredData<Map<String, List<String>>>(
          "assets/json/month_traditional.json", parser);
}
