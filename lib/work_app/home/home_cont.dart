// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'model.dart';
//
// class HomeController extends GetxController {
//   var tasks = <Task>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadTasks();
//   }
//
//   Future<void> saveTasks() async {
//     final prefs = await SharedPreferences.getInstance();
//     final taskList = tasks.map((task) => jsonEncode(task.toMap())).toList();
//     await prefs.setStringList('tasks', taskList);
//   }
//
//   Future<void> loadTasks() async {
//     final prefs = await SharedPreferences.getInstance();
//     final taskList = prefs.getStringList('tasks');
//
//     if (taskList != null) {
//       tasks.value = taskList.map((e) => Task.fromMap(jsonDecode(e))).toList();
//     }
//   }
//
//   void addTask(String title) {
//     tasks.add(Task(title: title, createdAt: DateTime.now()));
//     saveTasks();
//   }
//
//   void deleteTask(int index) {
//     tasks.removeAt(index);
//     saveTasks();
//   }
//
//   void updateTask(int index, String newTitle) {
//     tasks[index].title = newTitle;
//     tasks.refresh(); // important
//     saveTasks();
//   }
//
//   void toggleTask(int index, bool value) {
//     tasks[index].isDone = value;
//     tasks.refresh();
//     saveTasks();
//   }
// }

import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model.dart';

class HomeController extends GetxController {
  var tasks = <Task>[].obs;
  var imageIndex = 0.obs;
  final RxBool isPasswordVisible = false.obs;
  var oldPassVisible = false.obs;
  var newPassVisible = false.obs;
  var confirmPassVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTasks(); // load saved tasks
    _changeImage(); // start image auto change
  }

  void _changeImage() async {
    while (true) {
      await Future.delayed(Duration(seconds: 23));
      imageIndex.value++;
    }
  }

  // 🔹 TASK FUNCTIONS
  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskList = tasks.map((task) => jsonEncode(task.toMap())).toList();
    await prefs.setStringList('tasks', taskList);
  }

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskList = prefs.getStringList('tasks');

    if (taskList != null) {
      tasks.value = taskList.map((e) => Task.fromMap(jsonDecode(e))).toList();
    }
  }

  void addTask(String title) {
    tasks.insert(0, Task(title: title, createdAt: DateTime.now()));
    saveTasks();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    saveTasks();
  }

  void updateTask(int index, String newTitle) {
    tasks[index].title = newTitle;
    tasks.refresh(); // important for UI update
    saveTasks();
  }

  void toggleTask(int index, bool value) {
    tasks[index].isDone = value;
    tasks.refresh();
    saveTasks();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleOldPass() {
    oldPassVisible.value = !oldPassVisible.value;
  }

  void toggleNewPass() {
    newPassVisible.value = !newPassVisible.value;
  }

  void toggleConfirmPass() {
    confirmPassVisible.value = !confirmPassVisible.value;
  }
}
