import 'todo_model.dart';

final List<Task> list = [
  Task("掌握一门编程语言"),
  Task("减肥20斤"),
  Task("考托福"),
  Task("考雅思"),
];

Future<List<Task>> requestTaskList() async {
  return await list;
}

void updateTask(int index, Task newTask) {
  list[index] = newTask;
}

void addTask(Task task) {
  list.add(task);
}
