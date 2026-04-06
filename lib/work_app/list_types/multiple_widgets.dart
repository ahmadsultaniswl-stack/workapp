import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;
  final String email;
  final bool isOnline;

  Contact({
    required this.name,
    required this.phone,
    required this.email,
    this.isOnline = false,
  });
}

class CustomContactListItem extends StatelessWidget {
  final Contact contact;
  final VoidCallback? onTap;

  const CustomContactListItem({super.key, required this.contact, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Profile image with online indicator
            Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.blue.shade100,
                  child: Text(
                    contact.name[0].toUpperCase(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                if (contact.isOnline)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 16),
            // Contact details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.phone, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        contact.phone,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      SizedBox(width: 12),
                      Icon(Icons.email, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          contact.email,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Call button
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.call, color: Colors.white, size: 20),
                onPressed: () {
                  // Handle call
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Usage example
class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
      name: 'John Doe',
      phone: '+1234567890',
      email: 'john@example.com',
      isOnline: true,
    ),
    Contact(
      name: 'Jane Smith',
      phone: '+1234567891',
      email: 'jane@example.com',
    ),
    Contact(
      name: 'Bob Johnson',
      phone: '+1234567892',
      email: 'bob@example.com',
      isOnline: true,
    ),
    Contact(
      name: 'John Doe',
      phone: '+1234567890',
      email: 'john@example.com',
      isOnline: true,
    ),
    Contact(
      name: 'Jane Smith',
      phone: '+1234567891',
      email: 'jane@example.com',
    ),
    Contact(
      name: 'Bob Johnson',
      phone: '+1234567892',
      email: 'bob@example.com',
      isOnline: true,
    ),
    Contact(
      name: 'John Doe',
      phone: '+1234567890',
      email: 'john@example.com',
      isOnline: true,
    ),
    Contact(
      name: 'Jane Smith',
      phone: '+1234567891',
      email: 'jane@example.com',
    ),
    Contact(
      name: 'Bob Johnson',
      phone: '+1234567892',
      email: 'bob@example.com',
      isOnline: true,
    ),
    Contact(
      name: 'John Doe',
      phone: '+1234567890',
      email: 'john@example.com',
      isOnline: true,
    ),
    Contact(
      name: 'Jane Smith',
      phone: '+1234567891',
      email: 'jane@example.com',
    ),
    Contact(
      name: 'Bob Johnson',
      phone: '+1234567892',
      email: 'bob@example.com',
      isOnline: true,
    ),
  ];

  ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Contact List')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CustomContactListItem(
                contact: contacts[index],
                onTap: () {
                  // Handle tap
                },
              ),
              if (index != contacts.length - 1) Divider(height: 1, indent: 80),
            ],
          );
        },
      ),
    );
  }
}
