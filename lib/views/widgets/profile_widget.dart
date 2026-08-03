import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/portfolio_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/constants.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();

    return Column(
      children: [
        GestureDetector(
          onTap: () => controller.toggleProfile(),
          child: Obx(() => AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            width: controller.profileExpanded.value ? 220 : 180,
            height: controller.profileExpanded.value ? 220 : 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(controller.profileExpanded.value ? 0.6 : 0.3),
                  blurRadius: controller.profileExpanded.value ? 30 : 15,
                  spreadRadius: controller.profileExpanded.value ? 10 : 5,
                ),
              ],
              border: Border.all(color: AppColors.primary, width: 4),
            ),
            child: const CircleAvatar(
              backgroundImage: AssetImage(AppConstants.profileImage),
              backgroundColor: AppColors.cardBackground,
            ),
          )),
        ),
        const SizedBox(height: 20),
        Text(
          AppConstants.name,
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        ShaderMask(
          shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
          child: Text(
            AppConstants.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          AppConstants.subtitle,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
