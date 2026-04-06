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
          Positioned(
            top: 46,
            left: 10,
            child: Obx(
              () => Text(
                "Version : ${con.version.value}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.orange,
                ),
              ),
            ),
          ),

          Center(child: Lottie.asset("assets/animation/Task.json")),
        ],
      ),
    );
  }
}
