import 'package:flutter/material.dart';

class AnimBuilderDemo extends StatefulWidget {
  const AnimBuilderDemo({Key? key}) : super(key: key);

  @override
  _AnimBuilderDemoState createState() => _AnimBuilderDemoState();
}

class _AnimBuilderDemoState extends State<AnimBuilderDemo>
    with SingleTickerProviderStateMixin {
  Animation<double>? _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation = Tween<double>(begin: 100.0, end: 360.0).animate(_controller)
      ..addStatusListener((status) {
        setState(() {
          if (_animation!.isCompleted) {
            _controller.reverse();
          } else if (_animation!.isDismissed) {
            _controller.forward();
          }
        });
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedBuilder"),
      ),
      body: InkWell(
        child: GrowTransition(
          animation: _animation,
          child: LogoWidget(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class GrowTransition extends StatelessWidget {
  final Widget? child;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation!,
        builder: (context, w) => SizedBox(
          width: animation!.value,
          height: animation!.value,
          child: w,
        ),
        child: child,
      ),
    );
  }

  const GrowTransition({Key? key, this.child, this.animation}) : super(key: key);
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

void main() => runApp(MaterialApp(
      home: AnimBuilderDemo(),
    ));
