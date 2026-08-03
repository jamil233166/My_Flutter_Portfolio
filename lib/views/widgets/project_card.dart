import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/portfolio_controller.dart';
import '../../models/project_model.dart';
import '../../utils/app_colors.dart';

class ProjectCard extends StatelessWidget {
  final int index;
  final ProjectModel project;

  const ProjectCard({super.key, required this.index, required this.project});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();

    return GestureDetector(
      onTapDown: (_) => controller.selectProject(index),
      onTapUp: (_) => controller.selectProject(-1),
      onTapCancel: () => controller.selectProject(-1),
      child: Obx(() {
        final isSelected = controller.selectedProject.value == index;
        return AnimatedScale(
          scale: isSelected ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: AnimatedOpacity(
            opacity: isSelected ? 0.9 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: isSelected ? 12 : 4,
              child: Container(
                decoration: BoxDecoration(
                  gradient: isSelected ? LinearGradient(
                    colors: [
                      AppColors.cardBackground,
                      AppColors.primary.withOpacity(0.1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ) : null,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (project.imagePath != null)
                      Expanded(
                        flex: 5,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(project.imagePath!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Icon(project.icon, size: 40, color: AppColors.primary),
                      ),
                    
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project.title,
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Expanded(
                              child: Text(
                                project.description,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 11),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.arrow_forward, size: 14, color: AppColors.accent),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
