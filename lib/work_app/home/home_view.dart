// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:workapp/app_routes.dart';
// import 'package:workapp/utility/auth/auth_services.dart';
// import 'package:workapp/utility/colors.dart';
//
// import '../add_task/task_view.dart';
// import 'home_cont.dart';
//
// class HomeView extends StatelessWidget {
//   HomeView({super.key});
//
//   final controller = Get.put(HomeController());
//   final passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             // DrawerHeader(
//             //   decoration: BoxDecoration(color: Color(0xFF0A192F)),
//             //   child: DrawerHeader(
//             //     decoration: BoxDecoration(color: Colors.white),
//             //     child: Obx(
//             //       () => Image.network(
//             //         'https://picsum.photos/800/600?random=${controller.imageIndex.value}',
//             //         fit: BoxFit.cover,
//             //         width: double.infinity,
//             //         height: double.infinity,
//             //       ),
//             //     ),
//             //   ),
//             // ),
//             DrawerHeader(
//               //decoration: BoxDecoration(color: Colors.white),
//               margin: EdgeInsets.zero,
//               padding: EdgeInsets.zero,
//               child: Obx(
//                 () => SizedBox.expand(
//                   child: Image.network(
//                     'https://picsum.photos/800/600?random=${controller.imageIndex.value}',
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//
//             ListTile(
//               leading: Icon(Icons.home, size: 27),
//               title: Text(
//                 "Home",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               onTap: () {
//                 Get.back();
//                 //Get.to(() => HomeView());
//                 Get.toNamed(AppRoutes.home);
//               },
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.dark_mode_outlined,
//                 size: 27,
//                 //color: Colors.white,
//               ),
//               title: Text(
//                 "Dark Mode",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               onTap: () {
//                 if (Get.isDarkMode) {
//                   Get.changeThemeMode(ThemeMode.light);
//                 } else {
//                   Get.changeThemeMode(ThemeMode.dark);
//                 }
//               },
//             ),
//
//             ListTile(
//               leading: Icon(
//                 Icons.person_2_outlined,
//                 size: 27,
//                 //color: Colors.white,
//               ),
//               title: Text(
//                 "My Profile",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               onTap: () {
//                 Get.back();
//                 //Get.to(() => FetchCurrent());
//                 Get.toNamed(AppRoutes.fetchdata);
//               },
//             ),
//
//             ListTile(
//               leading: Icon(
//                 Icons.logout_outlined,
//                 size: 27,
//                 //color: Colors.white,
//               ),
//               title: Text(
//                 "Logout",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//               onTap: () async {
//                 Get.back();
//                 await AuthService().signOut();
//                 Get.snackbar(
//                   'account',
//                   'logout successfully',
//                   snackPosition: SnackPosition.BOTTOM,
//                   backgroundColor: Colors.green,
//                   colorText: Colors.white,
//                   duration: Duration(seconds: 2),
//                 );
//                 //Get.offAll(() => LoginView());
//                 Get.toNamed(AppRoutes.login);
//               },
//             ),
//
//             ListTile(
//               leading: Icon(
//                 Icons.lock_open_outlined,
//                 size: 27,
//                 //color: Colors.white,
//               ),
//               title: Text(
//                 "Change Password",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//
//               onTap: () {
//                 //Get.back();
//
//                 final oldPassController = TextEditingController();
//                 final newPassController = TextEditingController();
//                 final confirmPassController = TextEditingController();
//
//                 Get.defaultDialog(
//                   backgroundColor: AppColors.primary,
//                   title: "Change Password",
//                   titleStyle: TextStyle(color: AppColors.secondary),
//
//                   content: Column(
//                     children: [
//                       /// OLD PASSWORD
//                       Obx(
//                         () => TextField(
//                           controller: oldPassController,
//                           obscureText: !controller.oldPassVisible.value,
//                           style: TextStyle(color: Colors.white),
//                           decoration: InputDecoration(
//                             hintText: "Old Password",
//                             hintStyle: TextStyle(color: Colors.grey),
//                             prefixIcon: Icon(
//                               Icons.lock_outline,
//                               color: Colors.white,
//                             ),
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 controller.oldPassVisible.value
//                                     ? Icons.visibility
//                                     : Icons.visibility_off,
//                                 color: Colors.white,
//                               ),
//                               onPressed: controller.toggleOldPass,
//                             ),
//                           ),
//                         ),
//                       ),
//
//                       SizedBox(height: 10),
//
//                       /// NEW PASSWORD
//                       Obx(
//                         () => TextField(
//                           controller: newPassController,
//                           obscureText: !controller.newPassVisible.value,
//                           style: TextStyle(color: Colors.white),
//                           decoration: InputDecoration(
//                             hintText: "New Password",
//                             hintStyle: TextStyle(color: Colors.grey),
//                             prefixIcon: Icon(
//                               Icons.lock_outline,
//                               color: Colors.white,
//                             ),
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 controller.newPassVisible.value
//                                     ? Icons.visibility
//                                     : Icons.visibility_off,
//                                 color: Colors.white,
//                               ),
//                               onPressed: controller.toggleNewPass,
//                             ),
//                           ),
//                         ),
//                       ),
//
//                       SizedBox(height: 10),
//
//                       /// CONFIRM PASSWORD
//                       Obx(
//                         () => TextField(
//                           controller: confirmPassController,
//                           obscureText: !controller.confirmPassVisible.value,
//                           style: TextStyle(color: Colors.white),
//                           decoration: InputDecoration(
//                             hintText: "Confirm Password",
//                             hintStyle: TextStyle(color: Colors.grey),
//                             prefixIcon: Icon(
//                               Icons.lock_outline,
//                               color: Colors.white,
//                             ),
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 controller.confirmPassVisible.value
//                                     ? Icons.visibility
//                                     : Icons.visibility_off,
//                                 color: Colors.white,
//                               ),
//                               onPressed: controller.toggleConfirmPass,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   textConfirm: "Change",
//                   confirmTextColor: Colors.green,
//                   textCancel: "Cancel",
//                   cancelTextColor: Colors.white,
//
//                   onConfirm: () async {
//                     String oldPass = oldPassController.text.trim();
//                     String newPass = newPassController.text.trim();
//                     String confirmPass = confirmPassController.text.trim();
//
//                     /// VALIDATION
//                     if (oldPass.isEmpty ||
//                         newPass.isEmpty ||
//                         confirmPass.isEmpty) {
//                       Get.snackbar(
//                         "Error",
//                         "All fields required",
//                         snackPosition: SnackPosition.BOTTOM,
//                         backgroundColor: Colors.red,
//                         colorText: Colors.white,
//                       );
//                       return;
//                     }
//
//                     if (newPass != confirmPass) {
//                       Get.snackbar(
//                         "Password",
//                         "Passwords do not match",
//                         snackPosition: SnackPosition.BOTTOM,
//                         backgroundColor: Colors.red,
//                         colorText: Colors.white,
//                       );
//                       return;
//                     }
//
//                     try {
//                       await AuthService().changePassword(oldPass, newPass);
//
//                       Get.back();
//
//                       Get.snackbar(
//                         'Success',
//                         'Password changed successfully',
//                         backgroundColor: Colors.green,
//                         snackPosition: SnackPosition.BOTTOM,
//                         colorText: Colors.white,
//                       );
//
//                       Get.toNamed(AppRoutes.login);
//                     } catch (e) {
//                       Get.snackbar(
//                         "Error",
//                         e.toString(),
//                         backgroundColor: Colors.red,
//                         colorText: Colors.white,
//                       );
//                     }
//                   },
//                 );
//               },
//             ),
//             // ListTile(
//             //   leading: Icon(Icons.delete_forever_outlined),
//             //   title: Text("Delete Account"),
//             //   onTap: () async {
//             //     Get.back();
//             //     await AuthService().deleteAccount();
//             //     Get.snackbar(
//             //       'account',
//             //       'account delete successfully',
//             //       snackPosition: SnackPosition.BOTTOM,
//             //       backgroundColor: Colors.green,
//             //       colorText: Colors.white,
//             //       duration: Duration(seconds: 2),
//             //     );
//             //     Get.offAll(() => SignupView());
//             //   },
//             // ),
//             ListTile(
//               leading: Icon(
//                 Icons.delete_forever_outlined,
//                 color: Colors.red,
//                 size: 28,
//               ),
//               title: Text(
//                 "Delete Account",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//               onTap: () {
//                 //Get.back(); // drawer band ho jaye
//                 Get.defaultDialog(
//                   backgroundColor: AppColors.primary,
//                   title: "Confirm Delete",
//                   titleStyle: TextStyle(color: Colors.white),
//                   content: TextField(
//                     cursorColor: Colors.white,
//                     controller: passwordController,
//                     obscureText: true,
//                     style: TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       hintText: "enter password",
//                       hintStyle: TextStyle(color: Colors.grey[400]),
//                       hoverColor: Colors.white,
//                       focusColor: Colors.orange,
//                       prefixIcon: Icon(Icons.lock, color: Colors.white),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         borderSide: BorderSide(color: Colors.white),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         borderSide: BorderSide(color: Colors.red),
//                       ),
//                     ),
//                   ),
//                   textConfirm: "delete",
//                   confirmTextColor: Colors.red,
//                   textCancel: "cancel",
//                   cancelTextColor: Colors.white,
//
//                   onConfirm: () async {
//                     String password = passwordController.text.trim();
//
//                     if (password.isEmpty) {
//                       Get.snackbar(
//                         'password',
//                         'Please enter password',
//                         snackPosition: SnackPosition.BOTTOM,
//                         backgroundColor: Colors.red,
//                         colorText: Colors.white,
//                       );
//                       return; // delete process stop
//                     }
//
//                     try {
//                       await AuthService().deleteAccount(password);
//                       Get.back(); // dialog close
//                       Get.snackbar(
//                         'account',
//                         'account deleted successfully',
//                         snackPosition: SnackPosition.BOTTOM,
//                         backgroundColor: Colors.green,
//                         colorText: Colors.white,
//                       );
//                       //Get.offAll(() => SignupView());
//                       Get.toNamed(AppRoutes.signup);
//                     } catch (e) {
//                       Get.snackbar(
//                         'Error',
//                         e.toString(),
//                         snackPosition: SnackPosition.BOTTOM,
//                         backgroundColor: Colors.red,
//                         colorText: Colors.white,
//                       );
//                     }
//                   },
//                   onCancel: () {},
//                 );
//               },
//             ),
//
//             ListTile(
//               leading: Icon(
//                 Icons.group_add_outlined,
//                 size: 27,
//                 //color: Colors.white,
//               ),
//               title: Text(
//                 "About Us",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//               onTap: () {
//                 Get.back();
//                 //Get.to(() => AboutUsScreen());
//                 Get.toNamed(AppRoutes.aboutus);
//               },
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: AppColors.primary,
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 280.0,
//             //pinned: true,
//             leading: Builder(
//               builder: (context) => IconButton(
//                 onPressed: () {
//                   Scaffold.of(context).openDrawer();
//                 },
//                 icon: Icon(Icons.menu, color: Colors.orange, size: 36),
//               ),
//             ),
//
//             flexibleSpace: FlexibleSpaceBar(
//               // title: const Text('My App'),
//               background: Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   Obx(
//                     () => Image.network(
//                       'https://picsum.photos/800/600?random=${controller.imageIndex.value}',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//
//                   Container(
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.bottomCenter,
//                         end: Alignment.center,
//                         colors: [Colors.orange, Colors.transparent],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           Obx(
//             () => SliverList(
//               delegate: SliverChildBuilderDelegate((context, index) {
//                 final task = controller.tasks[index];
//
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 6,
//                   ),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey[900],
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 8,
//                     ),
//                     child: Row(
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.edit, color: Colors.orange),
//                           onPressed: () async {
//                             final editedText = await Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     AddTask(oldText: task.title),
//                               ),
//                             );
//
//                             if (editedText != null) {
//                               controller.updateTask(index, editedText);
//                             }
//                           },
//                         ),
//
//                         Checkbox(
//                           value: task.isDone,
//                           activeColor: AppColors.secondary,
//                           onChanged: (value) {
//                             controller.toggleTask(index, value!);
//                           },
//                           side: BorderSide(color: Colors.white),
//                         ),
//
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "${controller.tasks[index].createdAt.day}/"
//                                 "${controller.tasks[index].createdAt.month}/"
//                                 "${controller.tasks[index].createdAt.year}   "
//                                 "${(controller.tasks[index].createdAt.hour % 12 == 0 ? 12 : controller.tasks[index].createdAt.hour % 12).toString().padLeft(2, '0')}:"
//                                 "${controller.tasks[index].createdAt.minute.toString().padLeft(2, '0')} "
//                                 "${controller.tasks[index].createdAt.hour >= 12 ? 'PM' : 'AM'}",
//                                 style: const TextStyle(
//                                   color: Colors.white70,
//                                   fontSize: 12,
//                                 ),
//                               ),
//
//                               Text(
//                                 "${index + 1}. ${controller.tasks[index].title}",
//                                 maxLines: 500,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   decoration: controller.tasks[index].isDone
//                                       ? TextDecoration.lineThrough
//                                       : TextDecoration.none,
//                                   decorationColor: Colors.green,
//                                   decorationThickness: 3,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//
//                         IconButton(
//                           icon: const Icon(Icons.delete, color: Colors.red),
//                           onPressed: () {
//                             controller.deleteTask(index);
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }, childCount: controller.tasks.length),
//             ),
//           ),
//
//           const SliverToBoxAdapter(child: SizedBox(height: 100)),
//         ],
//       ),
//
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: AppColors.secondary,
//         onPressed: () async {
//           final result = await Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const AddTask()),
//           );
//
//           if (result != null) {
//             controller.addTask(result);
//           }
//         },
//         child: const Icon(Icons.add, size: 35),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:workapp/app_routes.dart';
// import 'package:workapp/utility/auth/auth_services.dart';
// import 'package:workapp/utility/colors.dart';
// import 'package:workapp/work_app/about_us/about_view.dart';
// import 'package:workapp/work_app/current_fetch_data/fetch_current.dart';
// import 'package:workapp/work_app/fetch_all_data/fetchall_data.dart';
// import 'package:workapp/work_app/login/login_view.dart';
// import 'package:workapp/work_app/signup/signup_view.dart';
//
// import '../add_task/task_view.dart';
// import 'home_cont.dart';
// import 'model.dart';
//
// class HomeView extends StatelessWidget {
//   HomeView({super.key});
//
//   final controller = Get.put(HomeController());
//   final passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: _buildModernDrawer(),
//       backgroundColor: AppColors.primary,
//       body: CustomScrollView(
//         slivers: [
//           _buildModernAppBar(),
//
//           Obx(
//             () => controller.tasks.isEmpty
//                 ? SliverFillRemaining(child: _buildEmptyState())
//                 : SliverList(
//                     delegate: SliverChildBuilderDelegate((context, index) {
//                       final task = controller.tasks[index];
//                       return _buildModernTaskCard(index, task);
//                     }, childCount: controller.tasks.length),
//                   ),
//           ),
//
//           const SliverToBoxAdapter(child: SizedBox(height: 100)),
//         ],
//       ),
//       floatingActionButton: _buildModernFAB(),
//     );
//   }
//
//   Widget _buildModernDrawer() {
//     return Drawer(
//       child: Container(
//         color: AppColors.primary,
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             // Modern Drawer Header with Overlay
//             Stack(
//               children: [
//                 Obx(
//                   () => Container(
//                     height: 220,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: NetworkImage(
//                           'https://picsum.photos/800/600?random=${controller.imageIndex.value}',
//                         ),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: 220,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         Colors.black.withOpacity(0.3),
//                         Colors.black.withOpacity(0.7),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 20,
//                   left: 20,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         width: 60,
//                         height: 60,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(color: Colors.orange, width: 2),
//                           image: const DecorationImage(
//                             image: NetworkImage(
//                               'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y',
//                             ),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       const Text(
//                         "Welcome Back!",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       Text(
//                         "Task Manager Pro",
//                         style: TextStyle(
//                           color: Colors.orange.shade300,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//
//             const SizedBox(height: 20),
//
//             // Menu Items
//             _buildDrawerItem(
//               icon: Icons.home_outlined,
//               title: "Home",
//               onTap: () => Get.toNamed(AppRoutes.home),
//             ),
//             _buildDrawerItem(
//               icon: Icons.dark_mode_outlined,
//               title: "Dark Mode",
//               trailing: Obx(
//                 () => Switch(
//                   value: controller.isDarkMode.value,
//                   onChanged: (val) => controller.toggleDarkMode(),
//                   activeColor: Colors.orange,
//                 ),
//               ),
//               onTap: () => controller.toggleDarkMode(),
//             ),
//             _buildDrawerItem(
//               icon: Icons.person_2_outlined,
//               title: "My Profile",
//               onTap: () => Get.toNamed(AppRoutes.fetchdata),
//             ),
//             _buildDrawerItem(
//               icon: Icons.logout_outlined,
//               title: "Logout",
//               onTap: () async {
//                 Get.back();
//                 await AuthService().signOut();
//                 _showSnackbar(
//                   'Logout Successful',
//                   'You have been logged out',
//                   Colors.green,
//                 );
//                 Get.toNamed(AppRoutes.login);
//               },
//               iconColor: Colors.red.shade400,
//             ),
//
//             const Divider(color: Colors.white24, height: 32),
//
//             _buildDrawerItem(
//               icon: Icons.lock_open_outlined,
//               title: "Change Password",
//               onTap: () => _showChangePasswordDialog(),
//             ),
//             _buildDrawerItem(
//               icon: Icons.delete_forever_outlined,
//               title: "Delete Account",
//               onTap: () => _showDeleteAccountDialog(),
//               iconColor: Colors.red.shade400,
//             ),
//             _buildDrawerItem(
//               icon: Icons.group_add_outlined,
//               title: "About Us",
//               onTap: () => Get.toNamed(AppRoutes.aboutus),
//             ),
//
//             const SizedBox(height: 20),
//
//             // Version info at bottom
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Text(
//                 "Version 2.0.0",
//                 style: TextStyle(
//                   color: Colors.white.withOpacity(0.4),
//                   fontSize: 12,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDrawerItem({
//     required IconData icon,
//     required String title,
//     required VoidCallback onTap,
//     Widget? trailing,
//     Color? iconColor,
//   }) {
//     return ListTile(
//       leading: Icon(icon, size: 26, color: iconColor ?? Colors.orange.shade400),
//       title: Text(
//         title,
//         style: const TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//           color: Colors.white,
//         ),
//       ),
//       trailing: trailing,
//       onTap: onTap,
//       hoverColor: Colors.orange.withOpacity(0.1),
//       splashColor: Colors.orange.withOpacity(0.2),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//     );
//   }
//
//   Widget _buildModernAppBar() {
//     return SliverAppBar(
//       expandedHeight: 280,
//       backgroundColor: AppColors.primary,
//       elevation: 0,
//       leading: Builder(
//         builder: (context) => IconButton(
//           onPressed: () => Scaffold.of(context).openDrawer(),
//           icon: const Icon(Icons.menu, color: Colors.orange, size: 32),
//           tooltip: "Menu",
//         ),
//       ),
//       flexibleSpace: FlexibleSpaceBar(
//         background: Stack(
//           fit: StackFit.expand,
//           children: [
//             Obx(
//               () => Image.network(
//                 'https://picsum.photos/800/600?random=${controller.imageIndex.value}',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Colors.transparent,
//                     AppColors.primary.withOpacity(0.8),
//                     AppColors.primary,
//                   ],
//                   stops: const [0.4, 0.7, 1.0],
//                 ),
//               ),
//             ),
//             // Welcome Text Overlay
//             Positioned(
//               bottom: 30,
//               left: 20,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Hello, User!",
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white.withOpacity(0.9),
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     "You have ${controller.tasks.length} tasks",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.orange.shade300,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildModernTaskCard(int index, Task task) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//       child: Card(
//         elevation: 0,
//         color: Colors.grey.shade900,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//           side: BorderSide(
//             color: task.isDone
//                 ? Colors.green.withOpacity(0.3)
//                 : Colors.transparent,
//             width: 1,
//           ),
//         ),
//         child: Dismissible(
//           key: Key(task.title),
//           direction: DismissDirection.endToStart,
//           background: Container(
//             alignment: Alignment.centerRight,
//             padding: const EdgeInsets.only(right: 20),
//             decoration: BoxDecoration(
//               color: Colors.red.shade800,
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: const Icon(
//               Icons.delete_forever,
//               color: Colors.white,
//               size: 30,
//             ),
//           ),
//           onDismissed: (_) => controller.deleteTask(index),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             child: Row(
//               children: [
//                 // Modern Checkbox
//                 Transform.scale(
//                   scale: 1.2,
//                   child: Checkbox(
//                     value: task.isDone,
//                     activeColor: Colors.green,
//                     checkColor: Colors.white,
//                     onChanged: (value) => controller.toggleTask(index, value!),
//                     side: BorderSide(
//                       color: task.isDone ? Colors.green : Colors.white54,
//                       width: 1.5,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//
//                 // Task Content
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Date and Time Badge
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 8,
//                           vertical: 4,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.orange.withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Icon(
//                               Icons.calendar_today,
//                               size: 10,
//                               color: Colors.orange.shade300,
//                             ),
//                             const SizedBox(width: 4),
//                             Text(
//                               "${task.createdAt.day}/${task.createdAt.month}/${task.createdAt.year}  "
//                               "${(task.createdAt.hour % 12 == 0 ? 12 : task.createdAt.hour % 12).toString().padLeft(2, '0')}:"
//                               "${task.createdAt.minute.toString().padLeft(2, '0')} "
//                               "${task.createdAt.hour >= 12 ? 'PM' : 'AM'}",
//                               style: const TextStyle(
//                                 color: Colors.white70,
//                                 fontSize: 11,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       // Task Title
//                       Text(
//                         "${index + 1}. ${task.title}",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           decoration: task.isDone
//                               ? TextDecoration.lineThrough
//                               : TextDecoration.none,
//                           decorationColor: Colors.green,
//                           decorationThickness: 2,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 // Action Buttons
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: const Icon(
//                         Icons.edit_outlined,
//                         color: Colors.orange,
//                       ),
//                       onPressed: () async {
//                         final editedText = await Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => AddTask(oldText: task.title),
//                           ),
//                         );
//                         if (editedText != null)
//                           controller.updateTask(index, editedText);
//                       },
//                       tooltip: "Edit",
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.delete_outline, color: Colors.red),
//                       onPressed: () => controller.deleteTask(index),
//                       tooltip: "Delete",
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildEmptyState() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.task_alt, size: 80, color: Colors.white.withOpacity(0.3)),
//           const SizedBox(height: 16),
//           Text(
//             "No Tasks Yet",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.white.withOpacity(0.6),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             "Tap the + button to add your first task",
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.white.withOpacity(0.4),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildModernFAB() {
//     return FloatingActionButton.extended(
//       onPressed: () async {
//         final result = await Navigator.push(
//           Get.context!,
//           MaterialPageRoute(builder: (context) => const AddTask()),
//         );
//         if (result != null) controller.addTask(result);
//       },
//       backgroundColor: Colors.orange,
//       icon: const Icon(Icons.add, size: 28),
//       label: const Text(
//         "New Task",
//         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//       ),
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//     );
//   }
//
//   void _showChangePasswordDialog() {
//     final oldPassController = TextEditingController();
//     final newPassController = TextEditingController();
//     final confirmPassController = TextEditingController();
//
//     Get.dialog(
//       Dialog(
//         backgroundColor: AppColors.primary,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 "Change Password",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               _buildPasswordField(
//                 controller: oldPassController,
//                 hint: "Old Password",
//                 isVisible: controller.oldPassVisible,
//                 toggle: controller.toggleOldPass,
//               ),
//               const SizedBox(height: 12),
//               _buildPasswordField(
//                 controller: newPassController,
//                 hint: "New Password",
//                 isVisible: controller.newPassVisible,
//                 toggle: controller.toggleNewPass,
//               ),
//               const SizedBox(height: 12),
//               _buildPasswordField(
//                 controller: confirmPassController,
//                 hint: "Confirm Password",
//                 isVisible: controller.confirmPassVisible,
//                 toggle: controller.toggleConfirmPass,
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextButton(
//                       onPressed: () => Get.back(),
//                       style: TextButton.styleFrom(
//                         foregroundColor: Colors.white70,
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           side: BorderSide(color: Colors.white24),
//                         ),
//                       ),
//                       child: const Text("Cancel"),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         String oldPass = oldPassController.text.trim();
//                         String newPass = newPassController.text.trim();
//                         String confirmPass = confirmPassController.text.trim();
//
//                         if (oldPass.isEmpty ||
//                             newPass.isEmpty ||
//                             confirmPass.isEmpty) {
//                           _showSnackbar(
//                             "Error",
//                             "All fields required",
//                             Colors.red,
//                           );
//                           return;
//                         }
//                         if (newPass != confirmPass) {
//                           _showSnackbar(
//                             "Password",
//                             "Passwords do not match",
//                             Colors.red,
//                           );
//                           return;
//                         }
//
//                         try {
//                           await AuthService().changePassword(oldPass, newPass);
//                           Get.back();
//                           _showSnackbar(
//                             "Success",
//                             "Password changed successfully",
//                             Colors.green,
//                           );
//                           Get.toNamed(AppRoutes.login);
//                         } catch (e) {
//                           _showSnackbar("Error", e.toString(), Colors.red);
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.orange,
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       child: const Text(
//                         "Change",
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showDeleteAccountDialog() {
//     final passwordController = TextEditingController();
//
//     Get.dialog(
//       Dialog(
//         backgroundColor: AppColors.primary,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Icon(
//                 Icons.warning_amber_rounded,
//                 color: Colors.red,
//                 size: 50,
//               ),
//               const SizedBox(height: 12),
//               const Text(
//                 "Delete Account",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 "This action cannot be undone. Enter your password to confirm.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.white.withOpacity(0.7)),
//               ),
//               const SizedBox(height: 20),
//               _buildPasswordField(
//                 controller: passwordController,
//                 hint: "Enter Password",
//                 isVisible: controller.isPasswordVisible,
//                 toggle: controller.togglePasswordVisibility,
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextButton(
//                       onPressed: () => Get.back(),
//                       style: TextButton.styleFrom(
//                         foregroundColor: Colors.white70,
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           side: BorderSide(color: Colors.white24),
//                         ),
//                       ),
//                       child: const Text("Cancel"),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         String password = passwordController.text.trim();
//                         if (password.isEmpty) {
//                           _showSnackbar(
//                             "Error",
//                             "Please enter password",
//                             Colors.red,
//                           );
//                           return;
//                         }
//                         try {
//                           await AuthService().deleteAccount(password);
//                           Get.back();
//                           _showSnackbar(
//                             "Account",
//                             "Account deleted successfully",
//                             Colors.green,
//                           );
//                           Get.toNamed(AppRoutes.signup);
//                         } catch (e) {
//                           _showSnackbar("Error", e.toString(), Colors.red);
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.red,
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       child: const Text(
//                         "Delete",
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPasswordField({
//     required TextEditingController controller,
//     required String hint,
//     required RxBool isVisible,
//     required VoidCallback toggle,
//   }) {
//     return Obx(
//       () => TextField(
//         controller: controller,
//         obscureText: !isVisible.value,
//         style: const TextStyle(color: Colors.white),
//         decoration: InputDecoration(
//           hintText: hint,
//           hintStyle: TextStyle(color: Colors.grey),
//           prefixIcon: Icon(Icons.lock_outline, color: Colors.orange.shade300),
//           suffixIcon: IconButton(
//             icon: Icon(
//               isVisible.value ? Icons.visibility : Icons.visibility_off,
//               color: Colors.white54,
//             ),
//             onPressed: toggle,
//           ),
//           filled: true,
//           fillColor: Colors.grey.shade900,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide.none,
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide(color: Colors.white24),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide(color: Colors.orange.shade300),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showSnackbar(String title, String message, Color color) {
//     Get.snackbar(
//       title,
//       message,
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: color,
//       colorText: Colors.white,
//       duration: const Duration(seconds: 2),
//       margin: const EdgeInsets.all(16),
//       borderRadius: 12,
//       icon: Icon(
//         color == Colors.green ? Icons.check_circle : Icons.error,
//         color: Colors.white,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workapp/app_routes.dart';
import 'package:workapp/utility/auth/auth_services.dart';
import 'package:workapp/utility/colors.dart';

import '../add_task/task_view.dart';
import 'home_cont.dart';
import 'model.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final controller = Get.put(HomeController());
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildModernDrawer(),
      backgroundColor: AppColors.primary,
      body: CustomScrollView(
        slivers: [
          _buildModernAppBar(),

          Obx(
            () => controller.tasks.isEmpty
                ? SliverFillRemaining(child: _buildEmptyState())
                : SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final task = controller.tasks[index];
                      return _buildModernTaskCard(context, index, task);
                    }, childCount: controller.tasks.length),
                  ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
      floatingActionButton: _buildModernFAB(),
    );
  }

  Widget _buildModernDrawer() {
    return Drawer(
      child: Container(
        color: AppColors.primary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Modern Drawer Header with Overlay
            Stack(
              children: [
                Obx(
                  () => Container(
                    height: 220,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://picsum.photos/800/600?random=${controller.imageIndex.value}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.orange, width: 2),
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Welcome Back!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Task Manager Pro",
                        style: TextStyle(
                          color: Colors.orange.shade300,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Menu Items
            _buildDrawerItem(
              icon: Icons.home_outlined,
              title: "Home",
              onTap: () => Get.toNamed(AppRoutes.home),
            ),
            _buildDrawerItem(
              icon: Icons.dark_mode_outlined,
              title: "Dark Mode",
              trailing: Obx(
                () => Switch(
                  value: controller.isDarkMode.value,
                  onChanged: (val) => controller.toggleDarkMode(),
                  activeColor: Colors.orange,
                ),
              ),
              onTap: () => controller.toggleDarkMode(),
            ),
            _buildDrawerItem(
              icon: Icons.person_2_outlined,
              title: "My Profile",
              onTap: () => Get.toNamed(AppRoutes.fetchdata),
            ),
            _buildDrawerItem(
              icon: Icons.logout_outlined,
              title: "Logout",
              onTap: () async {
                Get.back();
                await AuthService().signOut();
                _showSnackbar(
                  'Logout Successful',
                  'You have been logged out',
                  Colors.green,
                );
                Get.toNamed(AppRoutes.login);
              },
              iconColor: Colors.red.shade400,
            ),

            const Divider(color: Colors.white24, height: 32),

            _buildDrawerItem(
              icon: Icons.lock_open_outlined,
              title: "Change Password",
              onTap: () => _showChangePasswordDialog(),
            ),
            _buildDrawerItem(
              icon: Icons.delete_forever_outlined,
              title: "Delete Account",
              onTap: () => _showDeleteAccountDialog(),
              iconColor: Colors.red.shade400,
            ),
            _buildDrawerItem(
              icon: Icons.group_add_outlined,
              title: "About Us",
              onTap: () => Get.toNamed(AppRoutes.aboutus),
            ),

            const SizedBox(height: 20),

            // Version info at bottom
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Version 2.0.0",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Widget? trailing,
    Color? iconColor,
  }) {
    return ListTile(
      leading: Icon(icon, size: 26, color: iconColor ?? Colors.orange.shade400),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      trailing: trailing,
      onTap: onTap,
      hoverColor: Colors.orange.withOpacity(0.1),
      splashColor: Colors.orange.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  Widget _buildModernAppBar() {
    return SliverAppBar(
      expandedHeight: 280,
      backgroundColor: AppColors.primary,
      elevation: 0,
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(Icons.menu, color: Colors.orange, size: 32),
          tooltip: "Menu",
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
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
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.primary.withOpacity(0.8),
                    AppColors.primary,
                  ],
                  stops: const [0.4, 0.7, 1.0],
                ),
              ),
            ),
            // Welcome Text Overlay
            Positioned(
              bottom: 30,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, User!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "You have ${controller.tasks.length} tasks",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.orange.shade300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModernTaskCard(BuildContext context, int index, Task task) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Card(
        elevation: 0,
        color: Colors.grey.shade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: task.isDone
                ? Colors.green.withOpacity(0.3)
                : Colors.transparent,
            width: 1,
          ),
        ),
        child: Dismissible(
          key: Key(task.title),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.red.shade800,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.delete_forever,
              color: Colors.white,
              size: 30,
            ),
          ),
          onDismissed: (_) => controller.deleteTask(index),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                // Modern Checkbox
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    value: task.isDone,
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    onChanged: (value) => controller.toggleTask(index, value!),
                    side: BorderSide(
                      color: task.isDone ? Colors.green : Colors.white54,
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // Task Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Date and Time Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 10,
                              color: Colors.orange.shade300,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${task.createdAt.day}/${task.createdAt.month}/${task.createdAt.year}  "
                              "${(task.createdAt.hour % 12 == 0 ? 12 : task.createdAt.hour % 12).toString().padLeft(2, '0')}:"
                              "${task.createdAt.minute.toString().padLeft(2, '0')} "
                              "${task.createdAt.hour >= 12 ? 'PM' : 'AM'}",
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Task Title
                      Text(
                        "${index + 1}. ${task.title}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          decoration: task.isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          decorationColor: Colors.green,
                          decorationThickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),

                // Action Buttons
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: Colors.orange,
                      ),
                      onPressed: () async {
                        final editedText = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddTask(oldText: task.title),
                          ),
                        );
                        if (editedText != null)
                          controller.updateTask(index, editedText);
                      },
                      tooltip: "Edit",
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () => controller.deleteTask(index),
                      tooltip: "Delete",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.task_alt, size: 80, color: Colors.white.withOpacity(0.3)),
          const SizedBox(height: 16),
          Text(
            "No Tasks Yet",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Tap the + button to add your first task",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernFAB() {
    return FloatingActionButton.extended(
      onPressed: () async {
        final result = await Navigator.push(
          Get.context!,
          MaterialPageRoute(builder: (context) => const AddTask()),
        );
        if (result != null) controller.addTask(result);
      },
      backgroundColor: Colors.orange,
      icon: const Icon(Icons.add, size: 28),
      label: const Text(
        "New Task",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );
  }

  void _showChangePasswordDialog() {
    final oldPassController = TextEditingController();
    final newPassController = TextEditingController();
    final confirmPassController = TextEditingController();

    Get.dialog(
      Dialog(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Change Password",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              _buildPasswordField(
                controller: oldPassController,
                hint: "Old Password",
                isVisible: controller.oldPassVisible,
                toggle: controller.toggleOldPass,
              ),
              const SizedBox(height: 12),
              _buildPasswordField(
                controller: newPassController,
                hint: "New Password",
                isVisible: controller.newPassVisible,
                toggle: controller.toggleNewPass,
              ),
              const SizedBox(height: 12),
              _buildPasswordField(
                controller: confirmPassController,
                hint: "Confirm Password",
                isVisible: controller.confirmPassVisible,
                toggle: controller.toggleConfirmPass,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Get.back(),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white70,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: Colors.white24),
                        ),
                      ),
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        String oldPass = oldPassController.text.trim();
                        String newPass = newPassController.text.trim();
                        String confirmPass = confirmPassController.text.trim();

                        if (oldPass.isEmpty ||
                            newPass.isEmpty ||
                            confirmPass.isEmpty) {
                          _showSnackbar(
                            "Error",
                            "All fields required",
                            Colors.red,
                          );
                          return;
                        }
                        if (newPass != confirmPass) {
                          _showSnackbar(
                            "Password",
                            "Passwords do not match",
                            Colors.red,
                          );
                          return;
                        }

                        try {
                          await AuthService().changePassword(oldPass, newPass);
                          Get.back();
                          _showSnackbar(
                            "Success",
                            "Password changed successfully",
                            Colors.green,
                          );
                          Get.toNamed(AppRoutes.login);
                        } catch (e) {
                          _showSnackbar("Error", e.toString(), Colors.red);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Change",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteAccountDialog() {
    final passwordController = TextEditingController();

    Get.dialog(
      Dialog(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                color: Colors.red,
                size: 50,
              ),
              const SizedBox(height: 12),
              const Text(
                "Delete Account",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "This action cannot be undone. Enter your password to confirm.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white.withOpacity(0.7)),
              ),
              const SizedBox(height: 20),
              _buildPasswordField(
                controller: passwordController,
                hint: "Enter Password",
                isVisible: controller.isPasswordVisible,
                toggle: controller.togglePasswordVisibility,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Get.back(),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white70,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: Colors.white24),
                        ),
                      ),
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        String password = passwordController.text.trim();
                        if (password.isEmpty) {
                          _showSnackbar(
                            "Error",
                            "Please enter password",
                            Colors.red,
                          );
                          return;
                        }
                        try {
                          await AuthService().deleteAccount(password);
                          Get.back();
                          _showSnackbar(
                            "Account",
                            "Account deleted successfully",
                            Colors.green,
                          );
                          Get.toNamed(AppRoutes.signup);
                        } catch (e) {
                          _showSnackbar("Error", e.toString(), Colors.red);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Delete",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hint,
    required RxBool isVisible,
    required VoidCallback toggle,
  }) {
    return Obx(
      () => TextField(
        controller: controller,
        obscureText: !isVisible.value,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.lock_outline, color: Colors.orange.shade300),
          suffixIcon: IconButton(
            icon: Icon(
              isVisible.value ? Icons.visibility : Icons.visibility_off,
              color: Colors.white54,
            ),
            onPressed: toggle,
          ),
          filled: true,
          fillColor: Colors.grey.shade900,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.white24),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.orange.shade300),
          ),
        ),
      ),
    );
  }

  void _showSnackbar(String title, String message, Color color) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      icon: Icon(
        color == Colors.green ? Icons.check_circle : Icons.error,
        color: Colors.white,
      ),
    );
  }
}
