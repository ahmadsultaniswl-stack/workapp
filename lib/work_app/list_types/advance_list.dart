import 'package:flutter/material.dart';

class SectionedListScreen extends StatelessWidget {
  final Map<String, List<String>> groupedItems = {
    'Fruits': ['Apple', 'Banana', 'Orange', 'Mango'],
    'Vegetables': ['Carrot', 'Broccoli', 'Spinach', 'Potato'],
    'Dairy': ['Milk', 'Cheese', 'Yogurt'],
  };

  SectionedListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> sections = groupedItems.keys.toList();

    return Scaffold(
      appBar: AppBar(title: Text('Sectioned List')),
      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, sectionIndex) {
          String section = sections[sectionIndex];
          List<String> items = groupedItems[section]!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section header with custom separator
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                    top: BorderSide(color: Colors.grey[300]!),
                    bottom: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.folder, size: 20),
                    SizedBox(width: 8),
                    Text(
                      section,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${items.length} items',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              // Section items
              ...items.map((item) {
                return Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        section == 'Fruits'
                            ? Icons.apple
                            : section == 'Vegetables'
                            ? Icons.agriculture
                            : Icons.icecream,
                      ),
                      title: Text(item),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    Divider(height: 1, indent: 56),
                  ],
                );
              }),
              // Separator between sections
              if (sectionIndex != sections.length - 1)
                Container(height: 8, color: Colors.grey[200]),
            ],
          );
        },
      ),
    );
  }
}
