import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/portfolio_controller.dart';
import '../../models/skill_model.dart';
import '../../utils/app_colors.dart';

class SkillCard extends StatelessWidget {
  final int index;
  final SkillModel skill;

  const SkillCard({super.key, required this.index, required this.skill});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();

    return GestureDetector(
      onTap: () => controller.selectSkill(index),
      child: Obx(() {
        final isSelected = controller.selectedSkill.value == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(8),
          transform: isSelected ? (Matrix4.identity()..scale(1.1)) : Matrix4.identity(),
          decoration: BoxDecoration(
            color: isSelected ? skill.color.withOpacity(0.15) : AppColors.cardBackground,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: isSelected ? skill.color : Colors.white.withOpacity(0.05),
              width: 2,
            ),
            boxShadow: [
              if (isSelected)
                BoxShadow(
                  color: skill.color.withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 2,
                )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Display original image logo if path is provided, otherwise use colored icon
              skill.imagePath != null
                  ? Image.asset(
                      skill.imagePath!,
                      height: 35,
                      width: 35,
                      fit: BoxFit.contain,
                    )
                  : Icon(
                      skill.icon,
                      size: 28,
                      color: skill.color,
                    ),
              const SizedBox(height: 8),
              Flexible(
                child: Text(
                  skill.name,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: isSelected ? Colors.white : AppColors.textSecondary,
                      ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
