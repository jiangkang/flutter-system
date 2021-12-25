import 'package:flutter/material.dart';

class GifDemo extends StatefulWidget {
  const GifDemo({Key? key}) : super(key: key);

  @override
  _GifDemoState createState() => _GifDemoState();
}

class _GifDemoState extends State<GifDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gif Demo"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}

class GifImage extends StatefulWidget {
  final bool showOnlyFirstFrame;

  const GifImage({Key? key, this.showOnlyFirstFrame = false}) : super(key: key);

  @override
  _GifImageState createState() => _GifImageState();
}

class _GifImageState extends State<GifImage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Image(image: NetworkImage(""));
      } else {
        return CircularProgressIndicator();
      }
    });
  }
}
