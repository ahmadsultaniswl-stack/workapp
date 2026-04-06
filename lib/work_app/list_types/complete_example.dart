import 'package:flutter/material.dart';

class CompleteListExample extends StatefulWidget {
  const CompleteListExample({super.key});

  @override
  _CompleteListExampleState createState() => _CompleteListExampleState();
}

class _CompleteListExampleState extends State<CompleteListExample> {
  List<Map<String, dynamic>> items = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadInitialItems();
  }

  void _loadInitialItems() {
    items = [
      {
        'title': 'Flutter Tutorial',
        'description': 'Learn Flutter basics',
        'completed': false,
      },
      {
        'title': 'Build UI',
        'description': 'Create beautiful interfaces',
        'completed': false,
      },
      {
        'title': 'State Management',
        'description': 'Learn GetX, Provider',
        'completed': true,
      },
      {
        'title': 'API Integration',
        'description': 'Connect to backend',
        'completed': false,
      },
    ];
  }

  void _addItem() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        items.insert(0, {
          'title': _controller.text,
          'description': 'New item added',
          'completed': false,
        });
        _controller.clear();
      });
    }
  }

  void _toggleCompleted(int index) {
    setState(() {
      items[index]['completed'] = !items[index]['completed'];
    });
  }

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complete List Example'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_sweep),
            onPressed: () {
              setState(() {
                items.removeWhere((item) => item['completed'] == true);
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Add item input
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter new item',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onSubmitted: (_) => _addItem(),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(onPressed: _addItem, child: Text('Add')),
              ],
            ),
          ),
          Divider(height: 1),
          // List with separators
          Expanded(
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (context, index) => Container(
                height: 1,
                color: Colors.grey[200],
                margin: EdgeInsets.symmetric(horizontal: 16),
              ),
              itemBuilder: (context, index) {
                final item = items[index];
                return Dismissible(
                  key: Key(item['title']),
                  background: Container(
                    color: Colors.green,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(Icons.check, color: Colors.white),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      _deleteItem(index);
                    } else {
                      _toggleCompleted(index);
                    }
                  },
                  child: ListTile(
                    leading: Checkbox(
                      value: item['completed'],
                      onChanged: (_) => _toggleCompleted(index),
                    ),
                    title: Text(
                      item['title'],
                      style: TextStyle(
                        decoration: item['completed']
                            ? TextDecoration.lineThrough
                            : null,
                        color: item['completed'] ? Colors.grey : null,
                      ),
                    ),
                    subtitle: Text(item['description']),
                    trailing: IconButton(
                      icon: Icon(Icons.delete_outline),
                      onPressed: () => _deleteItem(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
