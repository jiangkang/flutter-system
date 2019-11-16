import 'package:flutter/material.dart';
import 'package:flutter_system/component/listview_item.dart';

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
            title: Text("General Dialog"),
            onTap: () {
              showGeneralDialog<void>(
                  context: context,
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return Text("sdsdsdsd");
                  });
            },
          )
        ],
      ),
    );
  }
}
