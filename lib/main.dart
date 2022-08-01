import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App',
      home: TodoList(),
    );
  }
}

// Define a custom Form widget.
class TodoList extends StatefulWidget {

  @override
  State<TodoList> createState() => _TodoListState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _TodoListState extends State<TodoList> {

  final List<String> _todoList = <String>[];

  final myTitle = TextEditingController();
  final myDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO App'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: myTitle,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 3),
                ),
                border: OutlineInputBorder(),
                hintText: 'title',
                hintStyle: TextStyle(fontSize: 20, color: Colors.blue),
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
            controller: myDescription,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 3),
              ),
              border: OutlineInputBorder(),
              hintText: 'description',
              hintStyle: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),),
          ListView(
            shrinkWrap: true,
            children: _getItems(),
          )
      ],),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _addTodoItem(myTitle.text, myDescription.text);},
          child: const Icon(Icons.add)
      ),
    );
  }
  void _addTodoItem(String title, String description) {
    // Wrapping it inside a set state will notify
    // the app that the state has changed
    setState(() {
      _todoList.add(title);
      _todoList.add(description);
    });
  }

  // this Generate list of item widgets
  Widget _buildTodoItem(String title) {
    return ListTile(title: Text(title));
  }
  List<Widget> _getItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (String title in _todoList) {
      _todoWidgets.add(_buildTodoItem(title));
    }
    return _todoWidgets;
  }
}