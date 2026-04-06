import 'package:get/get.dart';

import 'api_example_con.dart';

class ApiBin extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiController());
  }
}
