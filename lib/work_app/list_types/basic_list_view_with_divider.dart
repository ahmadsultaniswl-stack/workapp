import 'package:flutter/material.dart';

import 'interactive_list.dart';

class BasicListWithDivider extends StatelessWidget {
  final List<String> items = [
    'Apple',
    'Banana',
    'Orange',
    'Mango',
    'Grapes',
    'Strawberry',
    'Watermelon',
    'Pineapple',
    'Kiwi',
    'Peach',
    'Blueberry',
    'Grapefruit',
    'Guava',
    'Pear',
  ];

  BasicListWithDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Basic List with Divider')),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
        // itemBuilder: (context, index) {
        //   return ListTile(
        //     leading: CircleAvatar(child: Text('${index + 1}')),
        //     title: Text(items[index]),
        //     trailing: Icon(Icons.arrow_forward_ios, size: 16),
        //     onTap: () {
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         SnackBar(content: Text('Selected: ${items[index]}')),
        //       );
        //     },
        //   );
        // },
        // itemBuilder: (context, index) {
        //   return AnimatedListItem(title: items[index]);
        // },
        itemBuilder: (context, index) {
          return SwipeableListItem(
            title: items[index],
            onDelete: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Selected: ${items[index]}')),
              );
            },
            onEdit: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Selected: ${items[index]}')),
              );
            },
          );
        },
      ),
    );
  }
}
