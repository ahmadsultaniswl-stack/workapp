// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import 'package:workapp/utility/colors.dart';
//
// import 'fetch_cont.dart';
//
// class FetchCurrent extends StatelessWidget {
//   FetchCurrent({super.key});
//
//   final UserController controller = Get.put(UserController(), permanent: true);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//         title: Text(
//           "User Information",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 27,
//             color: AppColors.secondary,
//           ),
//         ),
//       ),
//
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Obx(() {
//             if (controller.isLoading.value) {
//               return const Center(child: CircularProgressIndicator());
//             }
//
//             return Padding(
//               padding: const EdgeInsets.all(15),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 250,
//                     width: 250,
//                     child: Lottie.asset("assets/animation/Login.json"),
//                   ),
//
//                   // Padding(
//                   //   padding: const EdgeInsets.only(),
//                   //   child: Lottie.asset("assets/animation/Login.json"),
//                   // ),
//
//                   //SizedBox(height: 30),
//                   TextField(
//                     style: TextStyle(color: Colors.white),
//                     cursorColor: Colors.white,
//                     keyboardType: TextInputType.name,
//                     controller: controller.firstNameController,
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(
//                         Icons.mode_edit_sharp,
//                         color: AppColors.secondary,
//                         size: 20,
//                       ),
//                       //labelText: "first name",
//                       labelStyle: TextStyle(color: Colors.white),
//                       hintText: "enter first name here",
//                       hintStyle: TextStyle(color: Colors.grey[700]),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: BorderSide(color: Colors.white),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: BorderSide(color: AppColors.secondary),
//                       ),
//                     ),
//                   ),
//
//                   SizedBox(height: 25),
//                   TextField(
//                     style: TextStyle(color: Colors.white),
//                     controller: controller.lastNameController,
//                     cursorColor: Colors.white,
//                     keyboardType: TextInputType.name,
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(
//                         Icons.mode_edit_sharp,
//                         color: AppColors.secondary,
//                         size: 20,
//                       ),
//                       //labelText: "last name",
//                       labelStyle: TextStyle(color: Colors.white),
//                       hintText: "enter last name here",
//                       hintStyle: TextStyle(color: Colors.grey[700]),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: BorderSide(color: Colors.white),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: BorderSide(color: AppColors.secondary),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 25),
//                   TextField(
//                     style: TextStyle(color: Colors.white),
//                     controller: controller.emailController,
//                     cursorColor: Colors.white,
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(
//                         Icons.mode_edit_sharp,
//                         color: AppColors.secondary,
//                         size: 20,
//                       ),
//                       //labelText: "email address",
//                       labelStyle: TextStyle(color: Colors.white),
//                       hintText: "enter email here",
//                       hintStyle: TextStyle(color: Colors.grey[700]),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                         borderSide: BorderSide(color: Colors.white),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                         borderSide: BorderSide(color: AppColors.secondary),
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(height: 80),
//                   SizedBox(
//                     height: 50,
//                     width: 150,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.secondary,
//                         foregroundColor: Colors.white,
//                       ),
//                       onPressed: () {
//                         controller.updateUser();
//                       },
//                       child: const Text("Update"),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
          ),
        ),
        title: Text(
          "User Information",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: AppColors.secondary,
            letterSpacing: 0.3,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Obx(() {
            if (controller.isLoading.value) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: const Center(child: CircularProgressIndicator()),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.secondary, width: 2),
                      color: AppColors.secondary.withOpacity(0.1),
                    ),
                    child: Icon(
                      Icons.person_outline,
                      size: 50,
                      color: AppColors.secondary,
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Section label
                Text(
                  "PERSONAL DETAILS",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.4),
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 14),

                _buildField(
                  controller: controller.firstNameController,
                  label: "First name",
                  hint: "Enter first name",
                  keyboardType: TextInputType.name,
                ),

                const SizedBox(height: 14),

                _buildField(
                  controller: controller.lastNameController,
                  label: "Last name",
                  hint: "Enter last name",
                  keyboardType: TextInputType.name,
                ),

                const SizedBox(height: 14),

                _buildField(
                  controller: controller.emailController,
                  label: "Email address",
                  hint: "Enter email address",
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 28),

                Divider(color: Colors.white.withOpacity(0.07)),

                const SizedBox(height: 20),

                // Update button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: controller.updateUser,
                    icon: const Icon(Icons.save_outlined, size: 20),
                    label: const Text(
                      "Save changes",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(0.4),
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(color: Colors.white, fontSize: 14),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.2)),
            filled: true,
            fillColor: Colors.white.withOpacity(0.06),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.12),
                width: 0.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.12),
                width: 0.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: AppColors.secondary.withOpacity(0.5),
                width: 1,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }
}
