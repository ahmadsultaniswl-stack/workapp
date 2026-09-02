// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:get/get_navigation/src/snackbar/snackbar.dart';
// import 'package:lottie/lottie.dart';
// import 'package:workapp/utility/colors.dart';
//
// class AddTask extends StatefulWidget {
//   final String? oldText;
//   const AddTask({super.key, this.oldText});
//
//   @override
//   State<AddTask> createState() => _AddTaskState();
// }
//
// class _AddTaskState extends State<AddTask> {
//   TextEditingController taskController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.oldText != null) {
//       taskController.text = widget.oldText!;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(
//         title: const Text(
//           "Add Task",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 30,
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//           ),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 20),
//                 child: Lottie.asset("assets/animation/Login.json"),
//               ),
//
//               const SizedBox(height: 30),
//
//               Center(
//                 child: SizedBox(
//                   width: 330,
//                   child: TextField(
//                     cursorColor: AppColors.secondary,
//                     controller: taskController,
//                     maxLines: null,
//                     keyboardType: TextInputType.multiline,
//                     style: TextStyle(color: Colors.white, fontSize: 16),
//                     decoration: InputDecoration(
//                       //filled: true,
//                       //fillColor: Colors.blue[900],
//                       contentPadding: const EdgeInsets.symmetric(
//                         vertical: 18,
//                         horizontal: 10,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       hintText: "enter task here",
//                       prefixIcon: Icon(Icons.text_fields_outlined),
//                       prefixIconColor: Colors.white,
//                       hintStyle: TextStyle(color: Colors.grey[400]),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.blue),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//               // const Spacer(),
//               SizedBox(height: 110),
//
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.secondary,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                 ),
//                 onPressed: () {
//                   if (taskController.text.isEmpty) {
//                     Get.snackbar(
//                       'task require',
//                       'enter a task to save it',
//                       snackPosition: SnackPosition.BOTTOM,
//                       backgroundColor: Colors.blueGrey,
//                     );
//                   } else {
//                     Navigator.pop(context, taskController.text);
//                   }
//                 },
//                 child: const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                   child: Text(
//                     "Save it",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 17,
//                     ),
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 40),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:workapp/utility/colors.dart';

class AddTask extends StatefulWidget {
  final String? oldText;
  const AddTask({super.key, this.oldText});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> with SingleTickerProviderStateMixin {
  TextEditingController taskController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    if (widget.oldText != null) {
      taskController.text = widget.oldText!;
    }

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      resizeToAvoidBottomInset: true,
      appBar: _buildModernAppBar(),
      body: Stack(
        children: [
          // Background gradient effect
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.orange.withOpacity(0.05), Colors.transparent],
                stops: const [0, 0.5],
              ),
            ),
          ),

          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                children: [
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: _buildAnimatedLottie(),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Animated Counter (character count)
                  _buildCharacterCounter(),

                  const SizedBox(height: 20),

                  // Modern Text Field
                  _buildModernTextField(),

                  const SizedBox(height: 40),

                  // Action Buttons
                  _buildActionButtons(),

                  const SizedBox(height: 30),

                  // Quick Tips
                  _buildQuickTips(),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildModernAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
          tooltip: "Back",
        ),
      ),
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.1),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.orange.withOpacity(0.3)),
        ),
        child: Text(
          widget.oldText != null ? "Edit Task" : "Create Task",
          style: const TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 1,
          ),
        ),
      ),
      centerTitle: true,
      actions: [
        if (taskController.text.isNotEmpty)
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () {
                taskController.clear();
                setState(() {});
                _showSnackbar(
                  "Cleared",
                  "Text cleared successfully",
                  Colors.orange,
                );
              },
              icon: const Icon(Icons.close, color: Colors.white70, size: 20),
              tooltip: "Clear",
            ),
          ),
      ],
    );
  }

  Widget _buildAnimatedLottie() {
    return Container(
      height: 220,
      width: 220,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.2),
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Lottie.asset(
        "assets/animation/Login.json",
        repeat: true,
        animate: true,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildCharacterCounter() {
    return ObxValue(
      (RxInt count) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade900.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.text_fields, color: Colors.orange.shade300, size: 16),
            const SizedBox(width: 8),
            Text(
              "${count.value} characters",
              style: TextStyle(
                color: count.value > 0 ? Colors.white70 : Colors.grey.shade500,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (count.value > 100)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Long task",
                    style: TextStyle(
                      color: Colors.orange.shade300,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      0.obs..value = taskController.text.length,
    );
  }

  Widget _buildModernTextField() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 48,
        constraints: const BoxConstraints(maxWidth: 400),
        child: ObxValue(
          (RxBool isFocused) => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: Colors.grey.shade900.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isFocused.value
                    ? Colors.orange.shade400
                    : Colors.white.withOpacity(0.1),
                width: isFocused.value ? 2 : 1,
              ),
              boxShadow: isFocused.value
                  ? [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ]
                  : null,
            ),
            child: TextField(
              controller: taskController,
              cursorColor: Colors.orange,
              maxLines: null,
              minLines: 3,
              keyboardType: TextInputType.multiline,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.5,
              ),
              onChanged: (value) {
                setState(() {});
              },
              onTap: () => isFocused.value = true,
              onSubmitted: (_) => isFocused.value = false,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                border: InputBorder.none,
                hintText: "What's on your mind?",
                hintStyle: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: Icon(
                    Icons.edit_note,
                    color: Colors.orange.shade300,
                    size: 24,
                  ),
                ),
                suffixIcon: taskController.text.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Colors.grey.shade500,
                            size: 20,
                          ),
                          onPressed: () {
                            taskController.clear();
                            setState(() {});
                          },
                        ),
                      )
                    : null,
              ),
            ),
          ),
          false.obs,
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Cancel Button
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: const Center(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Save Button
          Expanded(
            flex: 2,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: taskController.text.isEmpty
                      ? Colors.grey.shade800
                      : Colors.orange,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  disabledBackgroundColor: Colors.grey.shade800,
                ),
                onPressed: taskController.text.isEmpty
                    ? null
                    : () {
                        if (taskController.text.isEmpty) {
                          _showSnackbar(
                            'Task Required',
                            'Please enter a task to save',
                            Colors.red,
                          );
                        } else if (taskController.text.length < 3) {
                          _showSnackbar(
                            'Too Short',
                            'Task should be at least 3 characters',
                            Colors.orange,
                          );
                        } else {
                          Navigator.pop(context, taskController.text);
                        }
                      },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.oldText != null ? Icons.edit : Icons.save,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.oldText != null ? "Update Task" : "Save Task",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickTips() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade900.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb_outline,
                color: Colors.orange.shade300,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                "Quick Tips",
                style: TextStyle(
                  color: Colors.orange.shade300,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildTipChip("Be specific", Icons.check_circle_outline),
              _buildTipChip("Add deadlines", Icons.calendar_today),
              _buildTipChip("Prioritize tasks", Icons.priority_high),
              _buildTipChip("Break down big tasks", Icons.view_list),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTipChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade800.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.grey.shade400, size: 12),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(color: Colors.grey.shade400, fontSize: 11),
          ),
        ],
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
        color == Colors.green ? Icons.check_circle : Icons.warning,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
