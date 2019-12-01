import 'package:flutter/material.dart';
import 'package:flutter_system/component/listview_item.dart';
import 'package:flutter_system/products/todo/todo_api.dart';
import 'package:flutter_system/products/todo/todo_model.dart';
import 'package:flutter_system/utils/ui_utils.dart';

/// to do list
class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  bool _fbVisible = true;

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task List"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: requestTaskList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final List<Task> _tasks = snapshot.data;
              if (_tasks.isEmpty) {
                addTask(Task("新增计划"));
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  final _task = _tasks[index];
                  return TaskListItem(index, _task);
                },
                itemCount: _tasks.length,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Some error occurs"),
              );
            } else {
              return Center(
                child: Text("Empty data"),
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Builder(
        builder: (context) => Visibility(
          visible: _fbVisible,
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                _fbVisible = !_fbVisible;
              });
              showBottomSheet(
                shape: roundedRectBorder(4),
                context: context,
                builder: (context) => AddTaskDialog(focusNode: _focusNode),
              );
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

class TaskListItem extends StatefulWidget {
  final Task task;

  final int index;

  TaskListItem(this.index, this.task);

  @override
  _TaskListItemState createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  Task _task;

  @override
  void initState() {
    super.initState();
    _task = widget.task;
  }

  @override
  Widget build(BuildContext context) {
    return ListTileCard(
      borderRadius: 4,
      title: Text(
        _task.taskName,
        style: TextStyle(
          decoration: _task.taskStatus == TaskStatus.DONE
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          decorationColor: Colors.grey,
          decorationThickness: 2,
        ),
      ),
      leading: Checkbox(
          value: _task.taskStatus != TaskStatus.TODO,
          onChanged: (value) {
            setState(() {
              if (value) {
                _task.taskStatus = TaskStatus.DONE;
              } else {
                _task.taskStatus = TaskStatus.TODO;
              }
            });
            updateTask(widget.index, _task);
          }),
    );
  }
}

class AddTaskDialog extends StatefulWidget {
  final FocusNode focusNode;

  AddTaskDialog({this.focusNode});

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      String result = _controller.value as String;
                      if (result == null || result.isEmpty) {
                        showSnackBar(context, "内容不能为空");
                      } else {
                        addTask(Task(result));
                      }
                    })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Chip(
                  label: Text("设置截止日期"),
                  avatar: Icon(Icons.calendar_today),
                ),
                Chip(
                  label: Text("提醒我"),
                  avatar: Icon(Icons.alarm),
                ),
                Chip(
                  label: Text("重复"),
                  avatar: Icon(Icons.repeat),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
