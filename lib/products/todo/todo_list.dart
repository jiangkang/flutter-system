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
                  return ListTileCard(
                    borderRadius: 4,
                    title: Text(_tasks[index].taskName),
                    leading: Checkbox(
                        value: _tasks[index].taskStatus != TaskStatus.TODO,
                        onChanged: (value) {
                          setState(() {
                            if (value) {
                              _tasks[index].taskStatus = TaskStatus.DONE;
                            } else {
                              _tasks[index].taskStatus = TaskStatus.TODO;
                            }
                            updateTask(index, _tasks[index]);
                          });
                        }),
                  );
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
