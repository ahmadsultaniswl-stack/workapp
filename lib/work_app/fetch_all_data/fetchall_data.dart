import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workapp/utility/colors.dart';

class FetchAllUsers extends StatelessWidget {
  const FetchAllUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Users Information",
          style: TextStyle(
            color: AppColors.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("Not found"));
          }

          var users = snapshot.data!.docs;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              var userData = users[index].data() as Map<String, dynamic>;

              String formattedTime = "N/A";
              if (userData['createdAt'] != null) {
                Timestamp timestamp = userData['createdAt'];
                DateTime dateTime = timestamp.toDate();
                formattedTime = DateFormat(
                  'dd MMM yyyy, hh:mm a',
                ).format(dateTime);
              }

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "First Name: ${userData['first name'] ?? 'N/A'}",
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Last Name: ${userData['last name'] ?? 'N/A'}",
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Email: ${userData['email'] ?? 'N/A'}",
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Created At: $formattedTime",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
