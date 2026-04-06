import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workapp/app_routes.dart';
import '../../../utility/db/database.dart';
import '../../utility/auth/auth_services.dart';
import '../../utility/constants.dart';
import '../home/home_view.dart';

class LoginController extends GetxController {
  final AuthService _authService = AuthService.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final RxString emailError = ''.obs;
  final RxString passwordError = ''.obs;
  final RxBool isLoading = false.obs;
  final RxBool rememberMe = false.obs;
  final RxBool isPasswordVisible = false.obs;

  void clearForm() {
    emailController.text = '';
    passwordController.text = '';
    clearErrors();
  }

  void clearErrors() {
    emailError.value = '';
    passwordError.value = '';
  }

  bool validateEmail() {
    if (emailController.text.isEmpty) {
      emailError.value = 'email is required';
      return false;
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(emailController.text)) {
      emailError.value = 'Please enter a valid email address';
      return false;
    }

    emailError.value = '';
    return true;
  }

  bool validatePassword() {
    if (passwordController.text.isEmpty) {
      passwordError.value = 'Password is required';
      return false;
    }

    if (passwordController.text.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
      return false;
    }

    passwordError.value = '';
    return true;
  }

  bool validateForm() {
    final isEmailValid = validateEmail();
    final isPasswordValid = validatePassword();
    return isEmailValid && isPasswordValid;
  }

  // this function according to database
  void loadSavedCredentials() async {
    var queryData;
    final db = await SQLite.instance.database;
    queryData = await db.rawQuery(
      "SELECT Email, Password FROM User WHERE UserID = 1",
    );
    emailController.text = queryData[0]["Email"].toString();
    passwordController.text = queryData[0]["Password"].toString();

    if (emailController.text != "") {
      rememberMe.value = true;
      Constants.email = emailController.text;
      Constants.name = 'Ali Sultan';
    } else {
      rememberMe.value = false;
    }
  }

  // String appToken = '';
  // @override
  // void onInit() {
  //   super.onInit();
  //   loadSavedCredentials();
  //   FirebaseMessaging.instance.getToken().then((token) {
  //     appToken = token!;
  //     if (kDebugMode) {
  //       print("Token: $appToken");
  //     }
  //   });
  // }

  String appToken = "";

  @override
  void onInit() {
    super.onInit();
    loadSavedCredentials();

    FirebaseMessaging.instance.getToken().then((token) {
      if (token != null) {
        appToken = token; // 👈 ye line missing thi
        Constants.token = token;
        print("FCM Token: $appToken");
      }
    });
  }

  //________________

  Future<void> login() async {
    if (!validateForm()) {
      return;
    }

    isLoading.value = true;

    try {
      User? user = await _authService.loginWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (user != null) {
        Get.snackbar(
          'Welcome Back!',
          'Successfully logged in',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );
        //Get.offAll(() => HomeView());
        Get.toNamed(AppRoutes.home);
        final db = await SQLite.instance.database;
        if (rememberMe.value) {
          await db.rawUpdate("""
        UPDATE User SET
        Email = '${emailController.text.trim()}',
        Password = '${passwordController.text.trim()}'
        WHERE UserID = 1
        """);
        } else {
          await db.rawUpdate("""
        UPDATE User SET
        Email = '',
        Password = ''
        WHERE UserID = 1
        """);
        }
        Constants.email = emailController.text;
        Constants.name = 'Ali Sultan';
        // Get.offAll(() => HomepageScreen());
      }
    } catch (e) {
      String message;

      if (e is FirebaseAuthException) {
        message = _authService.handleAuthException(e);
      } else {
        message = e.toString();
      }

      Get.snackbar(
        'Login Failed',
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> forgotPassword() async {
  //   if (!validateEmail()) {
  //     return;
  //   }
  //
  //   isLoading.value = true;
  //
  //   try {
  //     await _authService.sendPasswordResetEmail(emailController.text);
  //
  //     Get.snackbar(
  //       'Password Reset Email Sent',
  //       'Check your email for password reset instructions',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.blue,
  //       colorText: Colors.white,
  //       duration: const Duration(seconds: 4),
  //     );
  //   } catch (e) {
  //     Get.snackbar(
  //       'Password Reset Failed',
  //       e.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  Future<void> forgotPassword() async {
    if (!validateEmail()) return;

    isLoading.value = true;

    try {
      bool exists = await _authService.checkEmailExists(emailController.text);

      if (!exists) {
        Get.snackbar(
          'Error',
          'Email is not correct',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      await _authService.sendPasswordResetEmail(emailController.text);

      Get.snackbar(
        'Success',
        'Reset link sent to your email',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  bool get isFormValid {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }
}
