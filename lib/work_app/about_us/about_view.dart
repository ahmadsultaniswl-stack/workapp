// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import 'package:workapp/utility/colors.dart';
// import 'about_cont.dart';
//
// class AboutUsScreen extends GetView<AboutController> {
//   AboutUsScreen({super.key});
//   final controller = Get.put(AboutController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         centerTitle: true,
//         title: Text(
//           "About Us",
//           style: TextStyle(
//             color: AppColors.secondary,
//             fontWeight: FontWeight.bold,
//             fontSize: 25,
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Obx(
//           () => Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: SizedBox(
//                   height: 350,
//                   width: 350,
//                   child: Lottie.asset("assets/animation/team.json"),
//                 ),
//               ),
//
//               Row(
//                 children: [
//                   Icon(
//                     Icons.phone_android_outlined,
//                     color: Colors.white,
//                     size: 22,
//                   ),
//                   SizedBox(width: 5),
//                   Text(
//                     controller.appName.value,
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.secondary,
//                     ),
//                   ),
//                 ],
//               ),
//
//               const SizedBox(height: 10),
//               RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: controller.description.value,
//                       style: TextStyle(
//                         color: Colors.grey[500],
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 20),
//               RichText(
//                 text: TextSpan(
//                   children: [
//                     WidgetSpan(
//                       child: Icon(
//                         Icons.people_alt_outlined,
//                         color: Colors.white,
//                         size: 22,
//                       ),
//                     ),
//                     WidgetSpan(child: SizedBox(width: 5)),
//                     TextSpan(
//                       text: "Developed by :",
//                       style: TextStyle(
//                         color: AppColors.secondary,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     WidgetSpan(child: SizedBox(width: 5)),
//                     TextSpan(
//                       text: controller.developer.value,
//                       style: TextStyle(
//                         color: Colors.grey[500],
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               //Text("Developed by: ${controller.developer.value}"),
//               const SizedBox(height: 10),
//
//               RichText(
//                 text: TextSpan(
//                   children: [
//                     WidgetSpan(
//                       child: Icon(
//                         Icons.label_important_outline,
//                         color: Colors.white,
//                         size: 22,
//                       ),
//                     ),
//                     WidgetSpan(child: SizedBox(width: 5)),
//                     TextSpan(
//                       text: "App Version :",
//                       style: TextStyle(
//                         color: AppColors.secondary,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     WidgetSpan(child: SizedBox(width: 5)),
//                     TextSpan(
//                       text: controller.version.value,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                         color: Colors.grey[500],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               //Text("Version: ${controller.version.value}"),
//               const SizedBox(height: 10),
//               RichText(
//                 text: TextSpan(
//                   children: [
//                     WidgetSpan(
//                       child: Icon(Icons.phone, color: Colors.white, size: 22),
//                     ),
//                     WidgetSpan(child: SizedBox(width: 5)),
//
//                     TextSpan(
//                       text: "Contact Us :",
//                       style: TextStyle(
//                         color: AppColors.secondary,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     WidgetSpan(child: SizedBox(width: 5)),
//                     TextSpan(
//                       text: controller.email.value,
//                       style: TextStyle(
//                         color: Colors.grey[500],
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               //Text("Contact: ${controller.email.value}"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:workapp/utility/colors.dart';

import 'about_cont.dart';

class AboutUsScreen extends GetView<AboutController> {
  AboutUsScreen({super.key});
  final controller = Get.put(AboutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: _buildModernAppBar(),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              // Animated Lottie Container
              _buildAnimatedLottie(),

              // Main Content Container
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: _buildGlassContainer(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // App Name Section
                    _buildInfoTile(
                      icon: Icons.phone_android_outlined,
                      title: controller.appName.value,
                      isTitle: true,
                    ),

                    const SizedBox(height: 16),

                    // Description Section
                    _buildDescriptionSection(),

                    const SizedBox(height: 24),

                    // Divider
                    _buildDivider(),

                    const SizedBox(height: 16),

                    // Developer Section
                    _buildInfoTileWithValue(
                      icon: Icons.people_alt_outlined,
                      label: "Developed by",
                      value: controller.developer.value,
                    ),

                    const SizedBox(height: 16),

                    // Version Section
                    _buildInfoTileWithValue(
                      icon: Icons.label_important_outline,
                      label: "App Version",
                      value: controller.version.value,
                      showBadge: true,
                    ),

                    const SizedBox(height: 16),

                    // Contact Section
                    _buildInfoTileWithValue(
                      icon: Icons.phone_outlined,
                      label: "Contact Us",
                      value: controller.email.value,
                      isClickable: true,
                      onTap: () => controller.sendEmail(),
                    ),

                    const SizedBox(height: 24),

                    // Social Links (Optional)
                    _buildSocialLinks(),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Footer
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildModernAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        tooltip: "Back",
      ),
      centerTitle: true,
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.1),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.orange.withOpacity(0.3)),
        ),
        child: const Text(
          "About Us",
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: 1,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => controller.shareApp(),
          icon: const Icon(Icons.share_outlined, color: Colors.white),
          tooltip: "Share",
        ),
      ],
    );
  }

  Widget _buildAnimatedLottie() {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.9, end: 1.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
      builder: (context, double scale, child) {
        return Transform.scale(
          scale: scale,
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.orange.withOpacity(0.2),
                  blurRadius: 30,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Lottie.asset(
              "assets/animation/team.json",
              repeat: true,
              animate: true,
            ),
          ),
        );
      },
    );
  }

  BoxDecoration _buildGlassContainer() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.05),
          Colors.white.withOpacity(0.02),
        ],
      ),
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    bool isTitle = false,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange.shade400, Colors.orange.shade600],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: isTitle ? 26 : 18,
              fontWeight: isTitle ? FontWeight.bold : FontWeight.w600,
              color: isTitle ? Colors.orange : Colors.white,
              letterSpacing: isTitle ? 1 : 0.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade900.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.format_quote, color: Colors.orange.shade300, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              controller.description.value,
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 15,
                height: 1.5,
                letterSpacing: 0.3,
              ),
            ),
          ),
          Icon(Icons.format_quote, color: Colors.orange.shade300, size: 20),
        ],
      ),
    );
  }

  Widget _buildInfoTileWithValue({
    required IconData icon,
    required String label,
    required String value,
    bool showBadge = false,
    bool isClickable = false,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: isClickable ? onTap : null,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade900.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: Colors.orange.shade400, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      if (showBadge)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.green.withOpacity(0.5),
                            ),
                          ),
                          child: Text(
                            "Latest",
                            style: TextStyle(
                              color: Colors.green.shade300,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      if (isClickable)
                        Icon(
                          Icons.copy_outlined,
                          color: Colors.orange.shade400,
                          size: 18,
                        ),
                    ],
                  ),
                ],
              ),
            ),
            if (isClickable)
              Icon(Icons.chevron_right, color: Colors.grey.shade600, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.transparent,
                  Colors.orange.withOpacity(0.3),
                  Colors.orange.withOpacity(0.6),
                  Colors.orange.withOpacity(0.3),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          //child: Icon(Icons.favorite, color: Colors.red.shade400, size: 12),
        ),
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.transparent,
                  Colors.orange.withOpacity(0.3),
                  Colors.orange.withOpacity(0.6),
                  Colors.orange.withOpacity(0.3),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon(
          icon: Icons.facebook,
          color: Colors.blue.shade700,
          onTap: () => controller.openFacebook(),
        ),
        const SizedBox(width: 16),
        // _buildSocialIcon(
        //   icon: Icons.code,
        //   color: Colors.purple.shade400,
        //   onTap: () => controller.openGitHub(),
        // ),
        const SizedBox(width: 26),
        _buildSocialIcon(
          icon: Icons.dataset_linked,
          color: Colors.red.shade400,
          onTap: () => controller.sendEmail(),
        ),
        //const SizedBox(width: 16),
        // _buildSocialIcon(
        //   icon: Icons.web,
        //   color: Colors.blue.shade400,
        //   onTap: () => controller.openWebsite(),
        // ),
      ],
    );
  }

  Widget _buildSocialIcon({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          shape: BoxShape.circle,
          border: Border.all(color: color.withOpacity(0.5), width: 1),
        ),
        child: Icon(icon, color: color, size: 20),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Text(
            "© 2026 A² Software House",
            style: TextStyle(
              color: Colors.white.withOpacity(0.3),
              fontSize: 12,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "All Rights Reserved",
            style: TextStyle(
              color: Colors.white.withOpacity(0.2),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
