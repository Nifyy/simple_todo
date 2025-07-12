import 'package:flutter/material.dart';
import 'package:simple_todo/detail_screen.dart';
import 'package:simple_todo/todo.dart';
import 'package:simple_todo/add_todo.dart'; // Assuming AddTodo is here

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50, // Light purple background
      appBar: AppBar(title: const Text('Todo List')),
body: todos.isEmpty
    ? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.inbox,
              size: 64,
              color: Colors.purple,
            ),
            const SizedBox(height: 16),
            const Text(
              'There are no TODOS, click the plus button to add one.',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      )
    : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(todos[index].title),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailScreen(),
                          settings: RouteSettings(
                            arguments: todos[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateAndDisplayAddTodo(context);
        },
        backgroundColor: Colors.purple.shade100, // Light purple FAB
        foregroundColor: Colors.black, // Icon color
        elevation: 6, // Shadow
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _navigateAndDisplayAddTodo(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddTodo(),
      ),
    );

    if (!context.mounted) return;

    if (result != null && result is Todo) {
      setState(() {
        todos.add(result);
      });
    }
  }
}