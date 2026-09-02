// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import 'package:workapp/utility/colors.dart';
// import 'package:workapp/work_app/splash/splash_cont.dart';
//
// class SplashView extends StatelessWidget {
//   const SplashView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final SplashController con = Get.put(SplashController());
//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       body: Stack(
//         children: [
//           Positioned(
//             top: 46,
//             left: 10,
//             child: Obx(
//               () => Text(
//                 "Version : ${con.version.value}",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15,
//                   color: Colors.orange,
//                 ),
//               ),
//             ),
//           ),
//
//           Center(child: Lottie.asset("assets/animation/Task.json")),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:workapp/utility/colors.dart';
import 'package:workapp/work_app/splash/splash_cont.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController con = Get.put(SplashController());

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          // Animated gradient background overlay for depth
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.05),
                  Colors.transparent,
                  Colors.black.withOpacity(0.02),
                ],
              ),
            ),
          ),

          // Modern version badge
          Positioned(
            top: 60,
            left: 16,
            child: Obx(
              () => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.orange.withOpacity(0.5),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 14,
                      color: Colors.orange.shade300,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "v${con.version.value}",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Colors.orange.shade200,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Loading indicator at top right
          Positioned(
            top: 60,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                ),
              ),
            ),
          ),

          // Main content centered
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated Lottie with subtle scale effect
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0.95, end: 1.0),
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeOutCubic,
                  builder: (context, double scale, child) {
                    return Transform.scale(scale: scale, child: child);
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.width * 0.7,
                    child: Lottie.asset(
                      "assets/animation/Task.json",
                      repeat: true,
                      animate: true,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Modern loading text with animated dots
                Obx(
                  () => AnimatedOpacity(
                    opacity: con.showLoadingText.value ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      children: [
                        Text(
                          "Loading${_getLoadingDots(con.loadingDotCount.value)}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.7),
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Modern progress indicator
                        SizedBox(
                          width: 120,
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.white.withOpacity(0.2),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.orange,
                            ),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom decorative element
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  "Task Manager",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.4),
                    letterSpacing: 2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 40,
                  height: 2,
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getLoadingDots(int count) {
    return '.' * (count % 4);
  }
}
