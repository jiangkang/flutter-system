import 'dart:core';

import 'package:flutter_system/utils/db_utils.dart';
import 'package:sqflite/sqflite.dart';

import 'todo_model.dart';

final List<Task> list = [
  Task("掌握一门编程语言"),
  Task("减肥20斤"),
  Task("考托福"),
  Task("考雅思"),
];

Future<Database> todoListDb = DbUtils.openDb(
  "todo.db",
  version: 1,
  createCallback: (db, version) {
    return db.execute(
        "CREATE TABLE todo(taskName TEXT PRIMARY KEY,taskDetail TEXT,startDate TEXT,endDate TEXT,deadline TEXT,taskStatus INTEGER,needRemind BOOL,remindDate TEXT,repeatType INTEGER)");
  },
);

Future<List<Task>> requestTaskList() async {
  final Database db = await todoListDb;
  final List<Map<String, dynamic>> maps = await db.query("todo");
  return List.generate(maps.length, (index) => Task.fromMap(maps[index]));
}

Future updateTask(int index, Task newTask) async {
  final Database db = await todoListDb;
  await db.update("todo", newTask.toMap(),
      where: "taskName= ?", whereArgs: [newTask.taskName]);
}

Future addTask(Task task) async {
  final Database db = await todoListDb;
  await db.insert("todo", task.toMap());
}

Future deleteTask(Task task) async {
  final Database db = await todoListDb;
  await db.delete("todo", where: "taskName = ?", whereArgs: [task.taskName]);
}
