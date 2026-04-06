
import 'package:get/get.dart';
import 'package:workapp/work_app/shared_preference/shared_preferences_con.dart';

class SharedPreferencesBin extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SharedPreferencesController());
  }
}
