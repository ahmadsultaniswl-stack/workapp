import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController extends GetxController {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  // Variables to store loaded data
  RxString userName = 'Not set'.obs;
  RxInt userAge = 0.obs;

  // Keys for Shared Preferences
  static const String KEY_NAME = 'user_name';
  static const String KEY_AGE = 'user_age';
  @override
  void onInit() {
    super.onInit();
    loadAllData();
  }

  // 📖 READ: Load all data from Shared Preferences
  Future<void> loadAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    userName.value = prefs.getString(KEY_NAME) ?? 'Not set';
    userAge.value = prefs.getInt(KEY_AGE) ?? 0;
  }

  // ➕ CREATE: Save user name
  Future<void> saveUserName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(KEY_NAME, name);
    await loadAllData(); // Reload to update UI
    showSnackBar('Name saved successfully!');
  }

  // ➕ CREATE: Save user age
  Future<void> saveUserAge(int age) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(KEY_AGE, age);
    await loadAllData(); // Reload to update UI
    showSnackBar('Age saved successfully!');
  }

  // ✏️ UPDATE: Update user name
  Future<void> updateUserName(String newName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(KEY_NAME, newName);
    await loadAllData(); // Reload to update UI
    showSnackBar('Name updated successfully!');
  }

  // 🗑️ DELETE: Clear all user data
  Future<void> clearAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(KEY_NAME); // Remove specific key
    await prefs.remove(KEY_AGE);
    // OR use: await prefs.clear(); // Removes ALL data

    await loadAllData(); // Reload to update UI
    showSnackBar('All data cleared!');
  }

  Future<void> clearName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(KEY_NAME); // Remove specific key

    await loadAllData(); // Reload to update UI
    showSnackBar('All data cleared!');
  }

  Future<void> clearAge() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove(KEY_AGE);

    await loadAllData(); // Reload to update UI
    showSnackBar('All data cleared!');
  }

  // Helper: Show snackbar message
  void showSnackBar(String message) {
    ScaffoldMessenger.of(
      Get.context!,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  // Helper: Show dialog for adding/updating name
  void showNameDialog({bool isUpdate = false}) {
    _nameController.text = isUpdate ? userName.value : '';

    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text(isUpdate ? 'Update Name' : 'Enter Name'),
        content: TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            hintText: 'Enter your name',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_nameController.text.isNotEmpty) {
                if (isUpdate) {
                  await updateUserName(_nameController.text);
                } else {
                  await saveUserName(_nameController.text);
                }
                Navigator.pop(context);
              }
            },
            child: Text(isUpdate ? 'Update' : 'Save'),
          ),
        ],
      ),
    );
  }

  // Helper: Show dialog for adding age
  void showAgeDialog() {
    _ageController.text = userAge > 0 ? userAge.toString() : '';

    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: const Text('Enter Age'),
        content: TextField(
          controller: _ageController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Enter your age',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              int? age = int.tryParse(_ageController.text);
              if (age != null && age > 0) {
                await saveUserAge(age);
                Get.back();
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
