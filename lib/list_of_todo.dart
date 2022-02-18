import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_exmple/add_todo.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'get_controller/list_of_todo_controller.dart';

class ListOfTodo extends StatelessWidget {
  final todoController = Get.put(ListOfTodoController());

  var _todoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Todos"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(AddTodo());
                },
                icon: Icon(Icons.navigate_next))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: GetBuilder<ListOfTodoController>(
                builder: (listTodoCtr) {
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          title: Text(listTodoCtr.todoList[index]['task']),
                          trailing: Switch(
                            value: listTodoCtr.todoList[index]['done'],
                            onChanged: (bool value) {
                              listTodoCtr.changeTodo(index);
                            },
                          ));
                    },
                    itemCount: listTodoCtr.todoList.length,
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _todoTextController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        todoController.addTodo(
                            {"task": _todoTextController.text, "done": false});
                        _todoTextController.clear();
                      },
                      child: Text("Save"))
                ],
              ),
            ),
          ],
        ));
  }
}
