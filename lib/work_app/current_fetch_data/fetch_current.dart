// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:workapp/utility/colors.dart';
//
// class FetchCurrent extends StatelessWidget {
//   const FetchCurrent({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         title: Text(
//           "Users Information",
//           style: TextStyle(
//             color: AppColors.secondary,
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//       ),
//
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('users')
//             .doc(FirebaseAuth.instance.currentUser!.uid)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           if (!snapshot.hasData || !snapshot.data!.exists) {
//             return const Center(child: Text("Not found"));
//           }
//
//           var userData = snapshot.data!.data() as Map<String, dynamic>;
//
//           String formattedTime = "N/A";
//           if (userData['createdAt'] != null) {
//             Timestamp timestamp = userData['createdAt'];
//             DateTime dateTime = timestamp.toDate();
//             formattedTime = DateFormat('dd MMM yyyy, hh:mm a').format(dateTime);
//           }
//
//           return Card(
//             margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "First Name: ${userData['first name'] ?? 'N/A'}",
//                     style: const TextStyle(fontSize: 18),
//                   ),
//                   Text(
//                     "Last Name: ${userData['last name'] ?? 'N/A'}",
//                     style: const TextStyle(fontSize: 18),
//                   ),
//                   Text(
//                     "Email: ${userData['email'] ?? 'N/A'}",
//                     style: const TextStyle(fontSize: 18),
//                   ),
//                   Text(
//                     "Created At: $formattedTime",
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:workapp/utility/colors.dart';

import 'fetch_cont.dart';

class FetchCurrent extends StatelessWidget {
  FetchCurrent({super.key});

  final UserController controller = Get.put(UserController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "User Information",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 27,
            color: AppColors.secondary,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: Lottie.asset("assets/animation/Login.json"),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(),
                  //   child: Lottie.asset("assets/animation/Login.json"),
                  // ),

                  //SizedBox(height: 30),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.name,
                    controller: controller.firstNameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.mode_edit_sharp,
                        color: AppColors.secondary,
                        size: 20,
                      ),
                      //labelText: "first name",
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: "enter first name here",
                      hintStyle: TextStyle(color: Colors.grey[700]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: AppColors.secondary),
                      ),
                    ),
                  ),

                  SizedBox(height: 25),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: controller.lastNameController,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.mode_edit_sharp,
                        color: AppColors.secondary,
                        size: 20,
                      ),
                      //labelText: "last name",
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: "enter last name here",
                      hintStyle: TextStyle(color: Colors.grey[700]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: AppColors.secondary),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: controller.emailController,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.mode_edit_sharp,
                        color: AppColors.secondary,
                        size: 20,
                      ),
                      //labelText: "email address",
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: "enter email here",
                      hintStyle: TextStyle(color: Colors.grey[700]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: AppColors.secondary),
                      ),
                    ),
                  ),

                  const SizedBox(height: 80),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        controller.updateUser();
                      },
                      child: const Text("Update"),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
