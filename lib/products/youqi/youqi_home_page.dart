import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_system/products/youqi/api_youqi.dart';
import 'package:flutter_system/products/youqi/youqi_model.dart';
import 'package:flutter_system/utils/nav_utils.dart';
import 'package:flutter_system/utils/time_utils.dart';
import 'package:kicons/kicons.dart';

import 'widgets/youqi_content_page.dart';

class YouQiHomePage extends StatefulWidget {
  const YouQiHomePage({Key? key}) : super(key: key);

  @override
  _YouQiHomePageState createState() => _YouQiHomePageState();
}

class _YouQiHomePageState extends State<YouQiHomePage> {
  late Future<YouQiResponse> _youQiResponseFuture;

  @override
  void initState() {
    _youQiResponseFuture = requestYouQiResponseFromAssets(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<YouQiResponse>(
          future: _youQiResponseFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              YouQiResponse response = snapshot.data as YouQiResponse;
              final modelList = response.data ?? [];
              return PageView.builder(
                itemBuilder: (context, index) {
                  return YouQiContentPage(modelList[index]);
                },
                itemCount: modelList.length,
                pageSnapping: true,
                reverse: true,
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
