import 'package:get/get.dart';

class ListOfTodoController extends GetxController {
  List<Map<String, dynamic>> _todoList = [
    {"task": "HTML I", "done": true},
    {"task": "CSS", "done": true},
    {"task": "Responsive design", "done": true},
    {"task": "Git", "done": true},
    {"task": "JavaScript I", "done": true},
    {"task": "JavaScript II", "done": false}
  ];

  get todoList => _todoList;

  void addTodo(Map<String, dynamic> todo) {
    _todoList.add(todo);
    update();
  }

  void changeTodo(int index) {
    _todoList[index]['done'] = !_todoList[index]['done'];
    update();
  }
}
