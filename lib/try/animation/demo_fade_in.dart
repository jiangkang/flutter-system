import 'package:flutter/material.dart';

class FadeInDemo extends StatefulWidget {
  const FadeInDemo({Key? key}) : super(key: key);

  @override
  _FadeInDemoState createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  double _opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FadeIn"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "images/banner.jpg",
              height: 100,
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  _opacity = 1.0;
                });
              },
              child: Text(
                "Show Details",
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
            AnimatedOpacity(
              duration: Duration(seconds: 3),
              opacity: _opacity,
              child: Column(
                children: const [
                  Text('Type: Owl'),
                  Text('Age: 39'),
                  Text('Employment: None'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: FadeInDemo(),
    ));
