import 'package:flutter/material.dart';
import 'package:simple_todo/todo.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Todo")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add title',
              ),
              onChanged: (value) {
                title = value;
              },
              onEditingComplete: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add description',
              ),
              onChanged: (value) {
                description = value;
              },
              onEditingComplete: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (title.isEmpty || description.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Please enter a title and description for your TODO',
                      ),
                    ),
                  );
                } else {
                  Todo todo = Todo(title, description, false);
                  Navigator.pop(context, todo);
                }
              },
              child: const Text("Add TODO"),
            ),
          ],
        ),
      ),
    );
  }
}