import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Todo> _todos = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _addTodo() {
    setState(() {
      final newTodo = Todo(
        title: _titleController.text,
        description: _descriptionController.text,
      );
      _todos.add(newTodo);
      _titleController.clear();
      _descriptionController.clear();
    });
  }

  void _toggleTodo(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteTodo(Todo todo) {
    setState(() {
      _todos.remove(todo);
    });
  }

  void _deleAllTodo() {
    setState(() {
      _todos.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App ToDo'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Enter a new todo',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                icon: const Icon(
                  Icons.title,
                  color: Colors.brown,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description a todo',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                icon: const Icon(
                  Icons.description,
                  color: Colors.brown,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                    if (_titleController.text.isNotEmpty &&
                        _descriptionController.text.isNotEmpty) {
                      _addTodo();
                    }
                  },
                  label: const Text(
                    'Add',
                    style: TextStyle(color: Colors.green),
                  ),
                  icon: const Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
                ),
                TextButton.icon(
                  onPressed: _deleAllTodo,
                  label: const Text(
                    'Delete All',
                    style: TextStyle(color: Colors.red),
                  ),
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                final todo = _todos[index];
                return ListTile(
                  title: Text(todo.title),
                  subtitle: Text(todo.description),
                  leading: Checkbox(
                    value: todo.isDone,
                    onChanged: (bool? value) {
                      _toggleTodo(todo);
                    },
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      _deleteTodo(todo);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
