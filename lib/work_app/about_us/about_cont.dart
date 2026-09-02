// import 'package:get/get.dart';
//
// class AboutController extends GetxController {
//   var appName = "WorkApp".obs;
//   var description =
//       "This app helps users manage their daily tasks easily with time and date."
//           .obs;
//   var developer = "A² Software House Sahiwal.".obs;
//   var version = "1.0.0".obs;
//   var email = "asquareswl@gmail.com".obs;
// }





import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutController extends GetxController {
  var appName = "WorkApp".obs;
  var description =
      "This app helps users manage their daily tasks easily with time and date. Stay organized and boost your productivity with our smart task management solution."
          .obs;
  var developer = "A² Software House Sahiwal".obs;
  var version = "1.0.0".obs;
  var email = "asquareswl@gmail.com".obs;
  var website = "https://asquaresoftware.com".obs;
  var facebook = "https://facebook.com/asquaresoftware".obs;
  var github = "https://github.com/asquaresoftware".obs;

  void sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email.value,
      query: 'subject=WorkApp Feedback&body=Hello Team,',
    );
    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        _showErrorSnackbar("Could not open email client");
      }
    } catch (e) {
      _showErrorSnackbar("Error opening email");
    }
  }

  void openWebsite() async {
    final Uri url = Uri.parse(website.value);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        _showErrorSnackbar("Could not open website");
      }
    } catch (e) {
      _showErrorSnackbar("Error opening website");
    }
  }

  void openFacebook() async {
    final Uri url = Uri.parse(facebook.value);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        _showErrorSnackbar("Could not open Facebook page");
      }
    } catch (e) {
      _showErrorSnackbar("Error opening Facebook");
    }
  }

  void openGitHub() async {
    final Uri url = Uri.parse(github.value);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        _showErrorSnackbar("Could not open GitHub profile");
      }
    } catch (e) {
      _showErrorSnackbar("Error opening GitHub");
    }
  }

  void shareApp() async {
    // Implement share functionality
    Get.snackbar(
      "Share",
      "Share feature coming soon!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }

  void _showErrorSnackbar(String message) {
    Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }
}