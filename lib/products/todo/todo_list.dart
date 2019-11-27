import 'package:flutter/material.dart';
import 'package:flutter_system/component/listview_item.dart';
import 'package:flutter_system/products/todo/todo_api.dart';
import 'package:flutter_system/products/todo/todo_model.dart';

/// to do list
class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
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
