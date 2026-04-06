import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workapp/utility/colors.dart';
import 'package:workapp/work_app/signup/signup_cont.dart';
import '../../utility/auth/auth_services.dart';
import '../login/login_view.dart';

class SignupView extends StatelessWidget {
  final SignupController controller = Get.put(SignupController());
  final AuthService con = Get.put(AuthService());
  SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: const Text(
          'Create Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //const SizedBox(height: 10),
              const Text(
                'Join Us Today',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
                textAlign: TextAlign.center,
              ),
              //const SizedBox(height: 10),
              const Text(
                'create your account to get started',
                style: TextStyle(fontSize: 18, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              Obx(
                () => _buildTextField(
                  label: 'first Name',
                  hintText: 'enter your first name',
                  errorText: controller.firstNameError.value,
                  onChanged: (value) => controller.firstName.value = value,
                  prefixIcon: Icons.person_2_outlined,
                ),
              ),

              const SizedBox(height: 15),

              Obx(
                () => _buildTextField(
                  label: 'last Name',
                  hintText: 'enter your last name',
                  errorText: controller.lastNameError.value,
                  onChanged: (value) => controller.lastName.value = value,
                  prefixIcon: Icons.person_outline,
                ),
              ),

              const SizedBox(height: 15),

              Obx(
                () => _buildTextField(
                  label: 'email Address',
                  hintText: 'enter your email',
                  errorText: controller.emailError.value,
                  onChanged: (value) => controller.email.value = value,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email,
                ),
              ),

              const SizedBox(height: 15),

              Obx(
                () => _buildPasswordField(
                  label: 'password',
                  hintText: 'enter your password',
                  errorText: controller.passwordError.value,
                  onChanged: (value) => controller.password.value = value,
                  isPassword: true,
                ),
              ),

              const SizedBox(height: 15),

              Obx(
                () => _buildPasswordField(
                  label: 'confirm password',
                  hintText: 'enter confirm your password',
                  errorText: controller.confirmPasswordError.value,
                  onChanged: (value) =>
                      controller.confirmPassword.value = value,
                  isPassword: true,
                ),
              ),

              const SizedBox(height: 20),

              Obx(() => _buildRegisterButton()),

              const SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'already have an account?',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => LoginView());
                    },
                    child: const Text(
                      'login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hintText,
    required String errorText,
    required Function(String) onChanged,
    TextInputType keyboardType = TextInputType.text,
    IconData? prefixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          cursorColor: Colors.white,
          onChanged: onChanged,
          keyboardType: keyboardType,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.textfield),
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: Colors.white)
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            errorText: errorText.isNotEmpty ? errorText : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField({
    required String label,
    required String hintText,
    required String errorText,
    required Function(String) onChanged,
    required bool isPassword,
  }) {
    final isVisible = false.obs;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Obx(
          () => TextField(
            cursorColor: Colors.white,
            onChanged: onChanged,
            obscureText: !isVisible.value,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[700]),
              prefixIcon: const Icon(Icons.lock, color: Colors.white),
              suffixIcon: IconButton(
                icon: Icon(
                  isVisible.value ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
                onPressed: () => isVisible.value = !isVisible.value,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.blue),
              ),
              errorText: errorText.isNotEmpty ? errorText : null,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: controller.isLoading.value
          ? null
          : () => controller.register(),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
      ),
      child: controller.isLoading.value
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : const Text(
              'Create Account',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
    );
  }
}
