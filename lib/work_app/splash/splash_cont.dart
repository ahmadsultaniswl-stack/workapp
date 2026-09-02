// import 'package:get/get.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:workapp/work_app/login/login_view.dart';
//
// class SplashController extends GetxController {
//   RxInt no = 1.obs;
//   RxBool yes = true.obs;
//   RxString version = "".obs;
//
//   late PackageInfo versionDetails;
//
//   @override
//   void onInit() {
//     super.onInit();
//     _loadVersion();
//   }
//
//   void _loadVersion() async {
//     versionDetails = await PackageInfo.fromPlatform();
//     version.value = versionDetails.version;
//
//     Future.delayed(const Duration(seconds: 4), () {
//       Get.offAll(LoginView());
//     });
//   }
// }

import 'dart:async';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:workapp/work_app/login/login_view.dart';

class SplashController extends GetxController {
  RxInt no = 1.obs;
  RxBool yes = true.obs;
  RxString version = "".obs;
  RxBool showLoadingText = false.obs;
  RxInt loadingDotCount = 0.obs;

  late PackageInfo versionDetails;

  // Animation timers
  late Timer _loadingTimer;
  late Timer _dotTimer;

  @override
  void onInit() {
    super.onInit();
    _loadVersion();
    _startLoadingAnimation();
  }

  void _startLoadingAnimation() {
    // Show loading text after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      showLoadingText.value = true;
    });

    // Animated dots
    _dotTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      loadingDotCount.value = (loadingDotCount.value + 1) % 4;
    });
  }

  void _loadVersion() async {
    versionDetails = await PackageInfo.fromPlatform();
    version.value = versionDetails.version;

    Future.delayed(const Duration(seconds: 4), () {
      _dotTimer.cancel();
      Get.offAll(() => LoginView(), transition: Transition.fade);
    });
  }

  @override
  void onClose() {
    _dotTimer.cancel();
    super.onClose();
  }
}
