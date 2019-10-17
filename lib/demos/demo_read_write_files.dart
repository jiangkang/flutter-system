import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_system/component/listview_item.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReadWriteFileDemo extends StatefulWidget {
  @override
  _ReadWriteFileDemoState createState() {
    return _ReadWriteFileDemoState();
  }
}

class _ReadWriteFileDemoState extends State<ReadWriteFileDemo> {
  int _counter;
  final CounterStorage _counterStorage = CounterStorage();

  @override
  void initState() {
    _counter = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read and Write File"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          ListTileCard(
            title: Text("getTemporaryDirectory()"),
            borderRadius: 4,
            onTap: () {
              getTemporaryDirectory().then((value) {
                _showDialog("getTemporaryDirectory()", value.absolute.path);
              }).catchError((err) {
                _showDialog("Error", err.toString());
              });
            },
          ),
          ListTileCard(
            title: Text("getApplicationSupportDirectory()"),
            borderRadius: 4,
            onTap: () {
              getApplicationSupportDirectory().then((value) {
                _showDialog(
                    "getApplicationSupportDirectory()", value.absolute.path);
              }).catchError((err) {
                _showDialog("Error", err.toString());
              });
            },
          ),
          ListTileCard(
            title: Text("getApplicationDocumentsDirectory()"),
            borderRadius: 4,
            onTap: () {
              getApplicationDocumentsDirectory().then((value) {
                _showDialog(
                    "getApplicationDocumentsDirectory()", value.absolute.path);
              }).catchError((err) {
                _showDialog("Error", err.toString());
              });
            },
          ),
          ListTileCard(
            title: Text("getExternalStorageDirectory()"),
            borderRadius: 4,
            onTap: () {
              getExternalStorageDirectory().then((value) {
                _showDialog(
                    "getExternalStorageDirectory()", value.absolute.path);
              }).catchError((err) {
                _showDialog("Error", err.toString());
              });
            },
          ),
          ListTileCard(
            title: Text("write a counter to file"),
            borderRadius: 4,
            onTap: () {
              _counterStorage.writeCounter(_counter);
            },
          ),
          ListTileCard(
            title: Text("read a counter from file"),
            borderRadius: 4,
            onTap: () {
              _counterStorage.readCounter().then((value) {
                _showDialog("Counter", value.toString());
              }).catchError((err) {
                _showDialog("Error", err.toString());
              });
            },
          ),
          ListTileCard(
            borderRadius: 4,
            title: Text("Read key value from xml"),
            onTap: () {
              _showDialog(
                  "JK", KeyValueStorage.getString("jk", "default value"));
            },
          ),
          ListTileCard(
            borderRadius: 4,
            title: Text("Write key value from xml"),
            onTap: () {
              KeyValueStorage.saveString("jk", "https://jiangkang.tech")
                  .then((value) {
                _showDialog("jk", value ? "Success" : "Failed");
              }).catchError((err) {
                _showDialog("Error", err.toString());
              });
            },
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showDialog(String title, String content) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(content),
            ));
  }
}

class KeyValueStorage {
  static Future<SharedPreferences> get _prefs async {
    return await SharedPreferences.getInstance();
  }

  static Future<bool> saveString(String key, String value) async {
    final prefs = await _prefs;
    return prefs.setString(key, value);
  }

  static Future<bool> saveInt(String key, int value) async {
    final prefs = await _prefs;
    return prefs.setInt(key, value);
  }

  static Future<bool> saveDouble(String key, double value) async {
    final prefs = await _prefs;
    return prefs.setDouble(key, value);
  }

  static Future<bool> saveBool(String key, bool value) async {
    final prefs = await _prefs;
    return prefs.setBool(key, value);
  }

  static Future<bool> saveStringList(String key, List<String> value) async {
    final prefs = await _prefs;
    return prefs.setStringList(key, value);
  }

  static String getString(String key, String defaultValue) {
    _prefs.then((value) {
      return value.getString(key);
    }).catchError((err) {
      return defaultValue;
    });
    return defaultValue;
  }
}

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File("$path/couter.txt");
  }

  Future<int> readCounter() async {
    final file = await _localFile;
    String content = await file.readAsString();
    return int.parse(content);
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    return file.writeAsString("$counter");
  }
}
