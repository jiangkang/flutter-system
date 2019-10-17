import 'package:flutter/material.dart';
import 'package:flutter_system/constants/const_key_value.dart';
import 'package:flutter_system/theme/custom_themes.dart';
import 'package:flutter_system/utils/sp_utils.dart';
import 'package:provider/provider.dart';

/// 设置页
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;

  @override
  void initState() {
    SpUtils.getBool(keyIsDarkMode, false).then((value) {
      setState(() {
        _isDarkMode = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置页"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          SwitchListTile(
            title: Text("深色模式"),
            value: _isDarkMode,
            onChanged: (newValue) {
              setState(() {
                SpUtils.saveBool(keyIsDarkMode, newValue);
                _isDarkMode = newValue;
                Provider.of<ThemesNotifier>(context)
                    .setCurrentTheme(newValue ? dartTheme : lightTheme);
              });
            },
            activeColor: Theme.of(context).accentColor,
          ),
        ],
      )),
    );
  }
}
