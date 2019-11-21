import 'package:flutter/material.dart';
import 'package:flutter_system/component/listview_item.dart';
import 'package:flutter_system/utils/ui_utils.dart';

class DialogsPage extends StatefulWidget {
  @override
  _DialogsPageState createState() => _DialogsPageState();
}

class _DialogsPageState extends State<DialogsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialogs"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTileCard(
            title: Text("Date Picker"),
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1949, 10, 1),
                lastDate: DateTime(2025, 10, 1),
              ).then((dateSelected) {
                showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("选中的日期"),
                        content: Text(dateSelected == null
                            ? "你还未选中日期"
                            : "你选中的日期是${dateSelected.year}-${dateSelected.month}-${dateSelected.day}"),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("确定"))
                        ],
                      );
                    });
              });
            },
          ),
          ListTileCard(
            title: Text("Time Picker"),
            subtitle: Text("12小时制"),
            onTap: () {
              showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(alwaysUse24HourFormat: false),
                      child: child,
                    );
                  });
            },
          ),
          ListTileCard(
            title: Text("Time Picker"),
            subtitle: Text("24小时制"),
            onTap: () {
              showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(alwaysUse24HourFormat: true),
                      child: child,
                    );
                  });
            },
          ),
          ListTileCard(
            title: Text("Dialog"),
            onTap: () {
              showDialog<void>(
                  context: context,
                  builder: (context) => SimpleDialog(
                        title: Text("警告"),
                        children: <Widget>[
                          SimpleDialogOption(
                            onPressed: () {},
                            child: Text("您的技能值过低！！！请及时补充技能！！"),
                          ),
                          SimpleDialogOption(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("确认")),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("取消")),
                              ],
                            ),
                          )
                        ],
                        shape: roundedRectBorder(6),
                      ));
            },
          ),
          Builder(
            builder: (BuildContext context) => ListTileCard(
              title: Text("获取操作结果"),
              onTap: () async {
                final result = await showDialog<String>(
                    context: context,
                    builder: (context) => SimpleDialog(
                          title: Text("你喜欢Flutter还是React Native？"),
                          children: <Widget>[
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.of(context).pop("Flutter");
                              },
                              child: Text("Flutter"),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.of(context).pop("React Native");
                              },
                              child: Text("React Native"),
                            )
                          ],
                          shape: roundedRectBorder(6),
                        ));
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text(result)));
              },
            ),
          ),
          ListTileCard(
            title: Text("AboutDialog"),
            onTap: () {
              showAboutDialog(
                  context: context,
                  applicationName: "Flutter System",
                  applicationVersion: "1.0",
                  applicationLegalese: "这里是一些说明");
            },
          ),
          ListTileCard(
            title: Text("AlertDialog"),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text("Title"),
                        content: Text("Content Content Content Content"),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Submit"))
                        ],
                      ));
            },
          )
        ],
      ),
    );
  }
}
