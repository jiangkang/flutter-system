import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_system/common/model_binding.dart';
import 'package:flutter_system/constants/const_key_value.dart';
import 'package:flutter_system/generated/i18n.dart';
import 'package:flutter_system/page_routers.dart';
import 'package:flutter_system/theme/custom_themes.dart';
import 'package:flutter_system/utils/sp_utils.dart';

/// App Entry
void main() {
  /// 错误处理
  handleError();

  runApp(MyApp());
}

void handleError() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Center(
        child: Text(
          "好像发生了什么错误！",
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.blueAccent, fontSize: 32),
        ),
      ),
    );
  };
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemesNotifier>(context);
    return ModelBinding(
      initialSettings: AppSettings(themeData: ThemeData.light()),
      child: Builder(
        builder: (context) {
          SpUtils.getBool(keyIsDarkMode, false).then((value) {
            AppSettings.update(context,
                AppSettings(themeData: value ? dartTheme : lightTheme));
          });
          return MaterialApp(
            title: 'Flutter System',
            // theme: themeProvider?.currentTheme ?? lightTheme,
            theme: AppSettings.of(context).themeData,
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
        },
      ),
    );
  }
}
