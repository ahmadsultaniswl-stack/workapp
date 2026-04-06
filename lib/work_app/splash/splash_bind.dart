import 'package:get/get.dart';
import 'package:workapp/work_app/splash/splash_cont.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
