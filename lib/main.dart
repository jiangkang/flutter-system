import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_system/generated/i18n.dart';
import 'package:flutter_system/page_routers.dart';

/// App Entry
void main() => runApp(MyApp());

/// App Entry
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.redAccent,
      ),
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
