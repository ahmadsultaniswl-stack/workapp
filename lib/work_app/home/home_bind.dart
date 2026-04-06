import 'package:get/get.dart';
import 'package:workapp/work_app/home/home_cont.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
