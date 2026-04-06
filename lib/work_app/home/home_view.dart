// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../add_task/task_view.dart';
// import 'model.dart';
//
// class HomeView extends StatefulWidget {
//   const HomeView({super.key});
//
//   @override
//   State<HomeView> createState() => _HomeViewState();
// }
//
// class _HomeViewState extends State<HomeView> {
//   List<Task> tasks = [];
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
//       setState(() {
//         tasks = taskList.map((task) => Task.fromMap(jsonDecode(task))).toList();
//       });
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     loadTasks(); // 👈 app start par data load
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[700],
//       resizeToAvoidBottomInset: false,
//       body: Stack(
//         children: [
//           Container(
//             height: 330,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Colors.blue[900],
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(60),
//                 bottomRight: Radius.circular(60),
//               ),
//             ),
//             child: Column(
//               children: [
//                 const SizedBox(height: 130),
//                 Text(
//                   "My App",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           Padding(
//             padding: const EdgeInsets.only(top: 300),
//             child: ListView.builder(
//               itemCount: tasks.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Container(
//                     margin: const EdgeInsets.only(bottom: 10),
//                     decoration: BoxDecoration(
//                       color: Colors.blue[900],
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 8,
//                     ),
//                     child: Row(
//                       children: [
//                         // ✏️ EDIT
//                         IconButton(
//                           icon: const Icon(Icons.edit, color: Colors.orange),
//                           onPressed: () async {
//                             final editedText = await Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     AddTask(oldText: tasks[index].title),
//                               ),
//                             );
//
//                             if (editedText != null) {
//                               setState(() {
//                                 tasks[index].title = editedText;
//                                 saveTasks();
//                               });
//                             }
//                           },
//                         ),
//
//                         // ☑️ CHECKBOX
//                         Checkbox(
//                           value: tasks[index].isDone,
//                           activeColor: Colors.orange,
//                           onChanged: (value) {
//                             setState(() {
//                               tasks[index].isDone = value!;
//                               saveTasks();
//                             });
//                           },
//                         ),
//
//                         // 📝 TEXT + DATE
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "${tasks[index].createdAt.day}/"
//                                 "${tasks[index].createdAt.month}/"
//                                 "${tasks[index].createdAt.year}   "
//                                 "${(tasks[index].createdAt.hour % 12 == 0 ? 12 : tasks[index].createdAt.hour % 12).toString().padLeft(2, '0')}:"
//                                 "${tasks[index].createdAt.minute.toString().padLeft(2, '0')} "
//                                 "${tasks[index].createdAt.hour >= 12 ? 'PM' : 'AM'}",
//                                 style: const TextStyle(
//                                   color: Colors.white70,
//                                   fontSize: 12,
//                                 ),
//                               ),
//
//                               Text(
//                                 tasks[index].title,
//                                 maxLines: 3,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   decoration: tasks[index].isDone
//                                       ? TextDecoration.lineThrough
//                                       : TextDecoration.none,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//
//                         // 🗑️ DELETE
//                         IconButton(
//                           icon: const Icon(Icons.delete, color: Colors.white),
//                           onPressed: () {
//                             setState(() {
//                               tasks.removeAt(index);
//                               saveTasks();
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//
//           // ➕ ADD BUTTON (FLOATING)
//           Positioned(
//             bottom: 30,
//             right: 30,
//             child: GestureDetector(
//               onTap: () async {
//                 final result = await Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const AddTask()),
//                 );
//
//                 if (result != null) {
//                   setState(() {
//                     tasks.add(Task(title: result, createdAt: DateTime.now()));
//                     saveTasks();
//                   });
//                 }
//               },
//               child: Container(
//                 height: 60,
//                 width: 60,
//                 decoration: BoxDecoration(
//                   color: Colors.orange,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: const Icon(Icons.add, size: 30),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workapp/app_routes.dart';
import 'package:workapp/utility/auth/auth_services.dart';
import 'package:workapp/utility/colors.dart';
import 'package:workapp/work_app/about_us/about_view.dart';
import 'package:workapp/work_app/current_fetch_data/fetch_current.dart';
import 'package:workapp/work_app/fetch_all_data/fetchall_data.dart';
import 'package:workapp/work_app/login/login_view.dart';
import 'package:workapp/work_app/signup/signup_view.dart';
import '../add_task/task_view.dart';
import 'home_cont.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final controller = Get.put(HomeController());
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            // DrawerHeader(
            //   decoration: BoxDecoration(color: Color(0xFF0A192F)),
            //   child: DrawerHeader(
            //     decoration: BoxDecoration(color: Colors.white),
            //     child: Obx(
            //       () => Image.network(
            //         'https://picsum.photos/800/600?random=${controller.imageIndex.value}',
            //         fit: BoxFit.cover,
            //         width: double.infinity,
            //         height: double.infinity,
            //       ),
            //     ),
            //   ),
            // ),
            DrawerHeader(
              //decoration: BoxDecoration(color: Colors.white),
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Obx(
                () => SizedBox.expand(
                  child: Image.network(
                    'https://picsum.photos/800/600?random=${controller.imageIndex.value}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.home, size: 27),
              title: Text(
                "Home",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Get.back();
                //Get.to(() => HomeView());
                Get.toNamed(AppRoutes.home);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.dark_mode_outlined,
                size: 27,
                //color: Colors.white,
              ),
              title: Text(
                "Dark Mode",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                if (Get.isDarkMode) {
                  Get.changeThemeMode(ThemeMode.light);
                } else {
                  Get.changeThemeMode(ThemeMode.dark);
                }
              },
            ),

            ListTile(
              leading: Icon(
                Icons.person_2_outlined,
                size: 27,
                //color: Colors.white,
              ),
              title: Text(
                "My Profile",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Get.back();
                //Get.to(() => FetchCurrent());
                Get.toNamed(AppRoutes.fetchdata);
              },
            ),

            ListTile(
              leading: Icon(
                Icons.logout_outlined,
                size: 27,
                //color: Colors.white,
              ),
              title: Text(
                "Logout",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              onTap: () async {
                Get.back();
                await AuthService().signOut();
                Get.snackbar(
                  'account',
                  'logout successfully',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                  duration: Duration(seconds: 2),
                );
                //Get.offAll(() => LoginView());
                Get.toNamed(AppRoutes.login);
              },
            ),

            ListTile(
              leading: Icon(
                Icons.lock_open_outlined,
                size: 27,
                //color: Colors.white,
              ),
              title: Text(
                "Change Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),

              onTap: () {
                //Get.back();

                final oldPassController = TextEditingController();
                final newPassController = TextEditingController();
                final confirmPassController = TextEditingController();

                Get.defaultDialog(
                  backgroundColor: AppColors.primary,
                  title: "Change Password",
                  titleStyle: TextStyle(color: AppColors.secondary),

                  content: Column(
                    children: [
                      /// OLD PASSWORD
                      Obx(
                        () => TextField(
                          controller: oldPassController,
                          obscureText: !controller.oldPassVisible.value,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Old Password",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.white,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.oldPassVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white,
                              ),
                              onPressed: controller.toggleOldPass,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      /// NEW PASSWORD
                      Obx(
                        () => TextField(
                          controller: newPassController,
                          obscureText: !controller.newPassVisible.value,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "New Password",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.white,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.newPassVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white,
                              ),
                              onPressed: controller.toggleNewPass,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      /// CONFIRM PASSWORD
                      Obx(
                        () => TextField(
                          controller: confirmPassController,
                          obscureText: !controller.confirmPassVisible.value,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.white,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.confirmPassVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white,
                              ),
                              onPressed: controller.toggleConfirmPass,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  textConfirm: "Change",
                  confirmTextColor: Colors.green,
                  textCancel: "Cancel",
                  cancelTextColor: Colors.white,

                  onConfirm: () async {
                    String oldPass = oldPassController.text.trim();
                    String newPass = newPassController.text.trim();
                    String confirmPass = confirmPassController.text.trim();

                    /// VALIDATION
                    if (oldPass.isEmpty ||
                        newPass.isEmpty ||
                        confirmPass.isEmpty) {
                      Get.snackbar(
                        "Error",
                        "All fields required",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                      return;
                    }

                    if (newPass != confirmPass) {
                      Get.snackbar(
                        "Password",
                        "Passwords do not match",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                      return;
                    }

                    try {
                      await AuthService().changePassword(oldPass, newPass);

                      Get.back();

                      Get.snackbar(
                        'Success',
                        'Password changed successfully',
                        backgroundColor: Colors.green,
                        snackPosition: SnackPosition.BOTTOM,
                        colorText: Colors.white,
                      );

                      Get.toNamed(AppRoutes.login);
                    } catch (e) {
                      Get.snackbar(
                        "Error",
                        e.toString(),
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                );
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.delete_forever_outlined),
            //   title: Text("Delete Account"),
            //   onTap: () async {
            //     Get.back();
            //     await AuthService().deleteAccount();
            //     Get.snackbar(
            //       'account',
            //       'account delete successfully',
            //       snackPosition: SnackPosition.BOTTOM,
            //       backgroundColor: Colors.green,
            //       colorText: Colors.white,
            //       duration: Duration(seconds: 2),
            //     );
            //     Get.offAll(() => SignupView());
            //   },
            // ),
            ListTile(
              leading: Icon(
                Icons.delete_forever_outlined,
                color: Colors.red,
                size: 28,
              ),
              title: Text(
                "Delete Account",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              onTap: () {
                //Get.back(); // drawer band ho jaye
                Get.defaultDialog(
                  backgroundColor: AppColors.primary,
                  title: "Confirm Delete",
                  titleStyle: TextStyle(color: Colors.white),
                  content: TextField(
                    cursorColor: Colors.white,
                    controller: passwordController,
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "enter password",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      hoverColor: Colors.white,
                      focusColor: Colors.orange,
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  textConfirm: "delete",
                  confirmTextColor: Colors.red,
                  textCancel: "cancel",
                  cancelTextColor: Colors.white,

                  onConfirm: () async {
                    String password = passwordController.text.trim();

                    if (password.isEmpty) {
                      Get.snackbar(
                        'password',
                        'Please enter password',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                      return; // delete process stop
                    }

                    try {
                      await AuthService().deleteAccount(password);
                      Get.back(); // dialog close
                      Get.snackbar(
                        'account',
                        'account deleted successfully',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                      //Get.offAll(() => SignupView());
                      Get.toNamed(AppRoutes.signup);
                    } catch (e) {
                      Get.snackbar(
                        'Error',
                        e.toString(),
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                  onCancel: () {},
                );
              },
            ),

            ListTile(
              leading: Icon(
                Icons.group_add_outlined,
                size: 27,
                //color: Colors.white,
              ),
              title: Text(
                "About Us",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              onTap: () {
                Get.back();
                //Get.to(() => AboutUsScreen());
                Get.toNamed(AppRoutes.aboutus);
              },
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.primary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280.0,
            //pinned: true,
            leading: Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu, color: Colors.orange, size: 36),
              ),
            ),

            flexibleSpace: FlexibleSpaceBar(
              // title: const Text('My App'),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Obx(
                    () => Image.network(
                      'https://picsum.photos/800/600?random=${controller.imageIndex.value}',
                      fit: BoxFit.cover,
                    ),
                  ),

                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors: [Colors.orange, Colors.transparent],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Obx(
            () => SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final task = controller.tasks[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.orange),
                          onPressed: () async {
                            final editedText = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AddTask(oldText: task.title),
                              ),
                            );

                            if (editedText != null) {
                              controller.updateTask(index, editedText);
                            }
                          },
                        ),

                        Checkbox(
                          value: task.isDone,
                          activeColor: AppColors.secondary,
                          onChanged: (value) {
                            controller.toggleTask(index, value!);
                          },
                          side: BorderSide(color: Colors.white),
                        ),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${controller.tasks[index].createdAt.day}/"
                                "${controller.tasks[index].createdAt.month}/"
                                "${controller.tasks[index].createdAt.year}   "
                                "${(controller.tasks[index].createdAt.hour % 12 == 0 ? 12 : controller.tasks[index].createdAt.hour % 12).toString().padLeft(2, '0')}:"
                                "${controller.tasks[index].createdAt.minute.toString().padLeft(2, '0')} "
                                "${controller.tasks[index].createdAt.hour >= 12 ? 'PM' : 'AM'}",
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),

                              Text(
                                "${index + 1}. ${controller.tasks[index].title}",
                                maxLines: 500,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  decoration: controller.tasks[index].isDone
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  decorationColor: Colors.green,
                                  decorationThickness: 3,
                                ),
                              ),
                            ],
                          ),
                        ),

                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            controller.deleteTask(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }, childCount: controller.tasks.length),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondary,
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTask()),
          );

          if (result != null) {
            controller.addTask(result);
          }
        },
        child: const Icon(Icons.add, size: 35),
      ),
    );
  }
}
