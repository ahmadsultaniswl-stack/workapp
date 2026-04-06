import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:workapp/work_app/login/login_view.dart';

class SplashController extends GetxController {
  RxInt no = 1.obs;
  RxBool yes = true.obs;
  RxString version = "".obs;

  late PackageInfo versionDetails;

  @override
  void onInit() {
    super.onInit();
    _loadVersion();
  }

  void _loadVersion() async {
    versionDetails = await PackageInfo.fromPlatform();
    version.value = versionDetails.version;

    Future.delayed(const Duration(seconds: 4), () {
      Get.offAll(LoginView());
    });
  }
}
