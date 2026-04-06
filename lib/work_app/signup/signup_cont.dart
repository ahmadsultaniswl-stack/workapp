import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workapp/app_routes.dart';
import 'package:workapp/work_app/login/login_view.dart';
import '../../utility/auth/auth_services.dart';

class SignupController extends GetxController {
  final AuthService _authService = AuthService.instance;

  final RxString email = ''.obs;
  final RxString password = ''.obs;
  final RxString confirmPassword = ''.obs;
  final RxString firstName = ''.obs;
  final RxString lastName = ''.obs;

  final RxString emailError = ''.obs;
  final RxString passwordError = ''.obs;
  final RxString confirmPasswordError = ''.obs;
  final RxString firstNameError = ''.obs;
  final RxString lastNameError = ''.obs;

  final RxBool isLoading = false.obs;

  final RxBool isRegistered = false.obs;

  void clearForm() {
    email.value = '';
    password.value = '';
    confirmPassword.value = '';
    firstName.value = '';
    lastName.value = '';
    clearErrors();
  }

  void clearErrors() {
    emailError.value = '';
    passwordError.value = '';
    confirmPasswordError.value = '';
    firstNameError.value = '';
    lastNameError.value = '';
  }

  bool validateEmail() {
    if (email.value.isEmpty) {
      emailError.value = 'Email is required';
      return false;
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email.value)) {
      emailError.value = 'Please enter a valid email address';
      return false;
    }

    emailError.value = '';
    return true;
  }

  bool validatePassword() {
    if (password.value.isEmpty) {
      passwordError.value = 'Password is required';
      return false;
    }

    if (password.value.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
      return false;
    }

    passwordError.value = '';
    return true;
  }

  bool validateConfirmPassword() {
    if (confirmPassword.value.isEmpty) {
      confirmPasswordError.value = 'enter confirm password';
      return false;
    }

    if (password.value != confirmPassword.value) {
      confirmPasswordError.value = 'Passwords do not match';
      return false;
    }

    confirmPasswordError.value = '';
    return true;
  }

  bool validateNames() {
    if (firstName.value.isEmpty) {
      firstNameError.value = 'first name is required';
    } else {
      firstNameError.value = '';
    }

    if (lastName.value.isEmpty) {
      lastNameError.value = 'last name is required';
    } else {
      lastNameError.value = '';
    }

    if (firstName.value.isEmpty || lastName.value.isEmpty) {
      return false;
    }

    return true;
  }

  bool validateForm() {
    final isEmailValid = validateEmail();
    final isPasswordValid = validatePassword();
    final isConfirmPasswordValid = validateConfirmPassword();
    final areNamesValid = validateNames();

    return isEmailValid &&
        isPasswordValid &&
        isConfirmPasswordValid &&
        areNamesValid;
  }

  Future<void> register() async {
    if (!validateForm()) {
      return;
    }

    isLoading.value = true;

    try {
      User? user = await _authService.registerWithEmailAndPassword(
        email: email.value,
        password: password.value,
        firstName: firstName.value,
        lastName: lastName.value,
      );

      if (user != null) {
        isRegistered.value = true;
        Get.snackbar(
          'Success!',
          'Account created successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        //Get.offAll(() => LoginView());
        Get.toNamed(AppRoutes.login);
      }
    } catch (e) {
      Get.snackbar(
        'Registration Failed',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  bool get isFormValid {
    return email.value.isNotEmpty &&
        password.value.isNotEmpty &&
        confirmPassword.value.isNotEmpty &&
        firstName.value.isNotEmpty &&
        lastName.value.isNotEmpty;
  }
}
