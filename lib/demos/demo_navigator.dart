import 'package:flutter/material.dart';
import 'package:flutter_system/demos/demo_scrollable.dart';
import 'package:flutter_system/demos/demos.dart';
import 'package:flutter_system/widgets/route_builder.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runDemo(NavigatorDemo());
}

mixin RouteLifecycleObserver<S extends StatefulWidget> on State<S> implements RouteAware{

  @override
  void initState() {
    debugPrint(">>> mixin initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    debugPrint(">>> mixin didChangeDependencies");
    demoRouteObserver.subscribe(this, ModalRoute.of(context) as Route<dynamic>);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    debugPrint(">>> mixin dispose");
    demoRouteObserver.unsubscribe(this);
    super.dispose();
  }

  /// 当前页面被pop
  @override
  void didPop() {
    debugPrint(">>> mixin didPop");
  }

  /// 从top route pop回到当前页面
  @override
  void didPopNext() {
    debugPrint(">>> mixin didPopNext");
  }

  /// 从别的页面Push到当前页面
  @override
  void didPush() {
    debugPrint(">>> mixin didPush");
  }

  /// 从当前页面Push其他页面
  @override
  void didPushNext() {
    debugPrint(">>> mixin didPushNext");
  }
}

class NavigatorDemo extends StatefulWidget {
  const NavigatorDemo({Key? key}) : super(key: key);

  @override
  _NavigatorDemoState createState() => _NavigatorDemoState();
}

class _NavigatorDemoState extends State<NavigatorDemo> with RouteLifecycleObserver {
  String _currentState = "";

  @override
  void initState() {
    debugPrint(">>> initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    debugPrint(">>> didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    debugPrint(">>> didDispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator Demo"),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("当前状态:$_currentState"),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(KRoute(builder: (context) => ScrollableDemo())).then((value) {
                  debugPrint(">>> 返回结果:$value");
                });
              },
              child: Text("简单跳转")),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScrollableDemo()));
              },
              child: Text("简单跳转，然后回传结果")),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => NavigatorDemo()));
              },
              child: Text("跳转另一个当前页面")),
        ],
      )),
    );
  }

  /// 当前页面被pop
  @override
  void didPop() {
    setState(() {
      _currentState = "didPop";
    });
    debugPrint(">>> didPop");
    super.didPop();
  }

  /// 从top route pop回到当前页面
  @override
  void didPopNext() {
    setState(() {
      _currentState = "didPopNext";
    });
    debugPrint(">>> didPopNext");
    super.didPopNext();
  }

  /// 从别的页面Push到当前页面
  @override
  void didPush() {
    setState(() {
      _currentState = "didPush";
    });
    debugPrint(">>> didPush");
    super.didPush();
  }

  /// 从当前页面Push其他页面
  @override
  void didPushNext() {
    setState(() {
      _currentState = "didPushNext";
    });
    debugPrint(">>> didPushNext");
    super.didPushNext();
  }
}
