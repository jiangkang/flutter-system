
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_system/products/youqi/api_youqi.dart';
import 'package:flutter_system/products/youqi/widgets/date_box_painter.dart';
import 'package:flutter_system/products/youqi/youqi_model.dart';
import 'package:flutter_system/utils/time_utils.dart';

class YouQiTopHeader extends StatefulWidget {

  final YouQiModel model;

  const YouQiTopHeader({super.key, required this.model});

  @override
  State<YouQiTopHeader> createState() => _YouQiTopHeaderState();
}

class _YouQiTopHeaderState extends State<YouQiTopHeader> {

  late Future<Map<String, List<String>>> _monthAliasFuture;

  late YouQiModel _model;

  @override
  void initState() {
    _model = widget.model;
    _monthAliasFuture = requestMonthAliasResponseFromAssets(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                future: _monthAliasFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                    Map<String, List<String>> response =
                    snapshot.data as Map<String, List<String>>;
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
                                alignment: AlignmentDirectional.topStart,
                                child: Text(
                                  _model.date!.split("-")[1],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 21),
                                )),
                            Align(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: Text(
                                _model.date!.split("-")[2],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 21),
                              ),
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

  DateTime _getDateTime() {
    final dateString = _model.date!.split("-");
    return DateTime(
      int.parse(dateString[0]),
      int.parse(dateString[1]),
      int.parse(dateString[2]),
    );
  }
}
