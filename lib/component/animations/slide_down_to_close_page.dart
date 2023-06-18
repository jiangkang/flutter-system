import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SlideDownToClosePage extends StatefulWidget {
  const SlideDownToClosePage({Key? key}) : super(key: key);

  @override
  State<SlideDownToClosePage> createState() => _SlideDownToClosePageState();
}

class _SlideDownToClosePageState extends State<SlideDownToClosePage> {

  double _scrollPos = 0.0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red,
      statusBarBrightness: Brightness.light
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + _scrollPos + 64),
        child: GestureDetector(
          onVerticalDragDown: (details) {

          },
          onVerticalDragUpdate: (details) {
            final dy = details.delta.dy;
            debugPrint("dy:$dy");
            setState(() {
              _scrollPos +=dy;
            });
          },
          onVerticalDragEnd: (details) {},
          child: Container(
            width: double.infinity,
            color: Colors.cyan,
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.keyboard_arrow_down),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
