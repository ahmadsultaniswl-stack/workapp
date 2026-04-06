import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  String oldFirstName = "";
  String oldLastName = "";
  String oldEmail = "";
  var isLoading = false.obs;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final userId = FirebaseAuth.instance.currentUser!.uid;

  // 🔹 Fetch Data
  void fetchUserData() async {
    try {
      isLoading.value = true;

      var doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (doc.exists) {
        var data = doc.data()!;

        oldFirstName = data['first name'] ?? '';
        oldLastName = data['last name'] ?? '';
        oldEmail = data['email'] ?? '';

        firstNameController.text = oldFirstName;
        lastNameController.text = oldLastName;
        emailController.text = oldEmail;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // 🔹 Update Data
  void updateUser() async {
    if (firstNameController.text == oldFirstName &&
        lastNameController.text == oldLastName &&
        emailController.text == oldEmail) {
      Get.snackbar(
        "No Change",
        "you have not made any changes",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      return; // 👈 yahin function ruk jayega
    }

    try {
      isLoading.value = true;

      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'first name': firstNameController.text,
        'last name': lastNameController.text,
        'email': emailController.text,
      });
      oldFirstName = firstNameController.text;
      oldLastName = lastNameController.text;
      oldEmail = emailController.text;

      Get.snackbar(
        "Success",
        "Data Updated Successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        margin: EdgeInsets.all(10), // 👈 important
        borderRadius: 10,
        duration: Duration(seconds: 2),
      );
    } catch (e) {
      Get.snackbar(
        "Success",
        "Data Updated Successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: EdgeInsets.all(10), // 👈 important
        borderRadius: 10,
        duration: Duration(seconds: 2),
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchUserData();
    super.onInit();
  }
}
