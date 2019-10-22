import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_system/constants/const_key_value.dart';
import 'package:flutter_system/generated/i18n.dart';
import 'package:flutter_system/page_routers.dart';
import 'package:flutter_system/theme/custom_themes.dart';
import 'package:flutter_system/utils/sp_utils.dart';
import 'package:provider/provider.dart';

/// App Entry
void main() {
  runApp(ChangeNotifierProvider<ThemesNotifier>.value(
    value: ThemesNotifier(),
    child: MyApp(),
  ));
}

/// App Entry
class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SpUtils.getBool(keyIsDarkMode, false).then((value) {
      Provider.of<ThemesNotifier>(context, listen: false)
          .setCurrentTheme(value ? dartTheme : lightTheme);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesNotifier>(context);
    return MaterialApp(
      title: 'Flutter System',
      theme: themeProvider?.currentTheme ?? lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: appRouters,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
