import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_system/component/listview_item.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// SQLite Demo
class SQLiteDemo extends StatefulWidget {
  @override
  _SQLiteDemoState createState() {
    return _SQLiteDemoState();
  }
}

class _SQLiteDemoState extends State<SQLiteDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLite"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              insertDog(Dog(
                id: Random().nextInt(100),
                name: "Item${Random().nextInt(1000)}",
                age: Random().nextInt(100),
              )).then((value) {
                setState(() {});
              }).catchError((err) {
                print("err:$err");
              });
            },
            child: Text("Insert"),
          ),
          RaisedButton(
            onPressed: () {
              updateDog(Dog(
                id: Random().nextInt(100),
                name: "Item${Random().nextInt(1000)}",
                age: Random().nextInt(100),
              )).then((value) {
                setState(() {});
              }).catchError((err) {
                print("err:$err");
              });
            },
            child: Text("Update"),
          ),
          RaisedButton(
            onPressed: () {
              deleteDog(Random().nextInt(100)).then((value) {
                setState(() {});
              }).catchError((err) {
                print("err:$err");
              });
            },
            child: Text("Delete"),
          ),
          Expanded(
            child: FutureBuilder<List<Dog>>(
                future: fetchDogs(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return ListTileCard(
                            borderRadius: 4,
                            title:
                                Text(snapshot.data[index].toMap().toString()),
                          );
                        });
                  }
                  return CircularProgressIndicator();
                }),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          database;
        },
        child: Icon(Icons.data_usage),
      ),
    );
  }
}

/// 创建数据库和数据表
Future<Database> database = openDatabase(
  join('dog.db'),
  onCreate: (db, version) {
    return db.execute(
        "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)");
  },
  version: 1,
);

/// 向数据库中插入数据
Future<void> insertDog(Dog dog) async {
  final Database db = await database;
  await db.insert("dogs", dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

/// 从数据库中获取数据列表
Future<List<Dog>> fetchDogs() async {
  final Database db = await database;
  final List<Map<String, dynamic>> maps = await db.query("dogs");
  return List.generate(maps.length, (index) {
    return Dog(
        id: maps[index]["id"],
        name: maps[index]["name"],
        age: maps[index]["age"]);
  });
}

/// 更新数据库项
Future<void> updateDog(Dog dog) async {
  final Database db = await database;
  await db.update("dogs", dog.toMap(), where: "id = ?", whereArgs: [dog.id]);
}

/// 删除数据库项
Future<void> deleteDog(int id) async {
  final Database db = await database;
  await db.delete("dogs", where: "id = ?", whereArgs: [id]);
}

class Dog {
  final int id;
  final String name;
  final int age;

  Dog({this.id, this.name, this.age});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}
