import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_system/constants/const_key_value.dart';
import 'package:flutter_system/generated/i18n.dart';
import 'package:flutter_system/page_routers.dart';
import 'package:flutter_system/utils/sp_utils.dart';

/// App Entry
void main() {
  SpUtils.getBool(keyIsDarkMode, false).then((value) {
    runApp(MyApp(
      isDarkMode: value,
    ));
  });
}

/// App Entry
class MyApp extends StatefulWidget {
  final bool isDarkMode;

  const MyApp({Key key, this.isDarkMode}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter System',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.redAccent,
          brightness: widget.isDarkMode ? Brightness.dark : Brightness.light),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: pageRouters,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
