import 'package:get/get.dart';
import 'package:workapp/work_app/login/login_cont.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
