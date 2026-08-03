import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/constants.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                Text(
                  AppConstants.university,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text("Student"),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "B.Sc. in Computer Science & Engineering",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            _buildInfo(context, "Relevant Coursework: Data Structures, Algorithms, DBMS, Software Engineering"),
            _buildInfo(context, "Academic Projects: Participated in multiple group projects and hackathons"),
            _buildInfo(context, "Technical Skills: Focused on ASP.NET Core, Flutter, and Database Design"),
            _buildInfo(context, "Certifications: Actively pursuing online courses on Udemy and Coursera"),
            _buildInfo(context, "Problem Solving: Practicing competitive programming on platforms like LeetCode"),
            _buildInfo(context, "Soft Skills: Team collaboration, Time management, and Presentation skills"),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.school_outlined, size: 20, color: AppColors.accent),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
