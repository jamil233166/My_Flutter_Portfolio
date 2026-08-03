import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/app_colors.dart';
import '../../utils/constants.dart';
import 'social_button.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildContactItem(
              context,
              Icons.email_outlined,
              "Email",
              AppConstants.email,
            ),
            const Divider(height: 32),
            _buildContactItem(
              context,
              Icons.phone_outlined,
              "Phone",
              AppConstants.phone,
            ),
            const Divider(height: 32),
            _buildContactItem(
              context,
              Icons.location_on_outlined,
              "Location",
              AppConstants.location,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(
                  icon: Icons.email,
                  onTap: () => _launchUrl('mailto:${AppConstants.email}'),
                ),
                const SizedBox(width: 16),
                SocialButton(
                  icon: FontAwesomeIcons.github,
                  onTap: () => _launchUrl('https://github.com'),
                ),
                const SizedBox(width: 16),
                SocialButton(
                  icon: FontAwesomeIcons.linkedin,
                  onTap: () => _launchUrl('https://linkedin.com'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(BuildContext context, IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: AppColors.accent, size: 28),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
