import 'package:get/get.dart';
import 'package:workapp/work_app/signup/signup_cont.dart';

class SignupBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }
}
