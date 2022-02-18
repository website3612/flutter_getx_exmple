import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'get_controller/list_of_todo_controller.dart';

class AddTodo extends StatelessWidget {
  final ListOfTodoController todoController = Get.find();
  var _todoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Todos"),
        ),
        body: Column(
          children: [
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
