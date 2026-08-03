import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/portfolio_controller.dart';
import '../../utils/app_colors.dart';
import '../widgets/profile_widget.dart';
import '../widgets/section_title.dart';
import '../widgets/about_card.dart';
import '../widgets/skill_card.dart';
import '../widgets/experience_card.dart';
import '../widgets/project_card.dart';
import '../widgets/contact_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PortfolioController());
    final size = MediaQuery.of(context).size;
    final bool isDesktop = size.width >= 1024;
    final bool isTablet = size.width >= 700 && size.width < 1024;
    final bool isMobile = size.width < 700;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: AppColors.cardBackground.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: false,
              title: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ShaderMask(
                  shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
                  child: Text(
                    "PORTFOLIO",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
              actions: [
                if (isMobile)
                  _buildDropDownMenu(context, controller)
                else ...[
                  _navItem("Home", controller.homeKey, controller),
                  _navItem("About", controller.aboutKey, controller),
                  _navItem("Skills", controller.skillsKey, controller),
                  _navItem("Education", controller.experienceKey, controller),
                  _navItem("Projects", controller.projectsKey, controller),
                  _navItem("Contact", controller.contactKey, controller),
                  const SizedBox(width: 10),
                ]
              ],
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.background,
              Color(0xFF1E293B),
              AppColors.background,
            ],
          ),
        ),
        child: SingleChildScrollView(
          controller: controller.scrollController,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : (isTablet ? 50 : size.width * 0.15),
            vertical: 120,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileWidget(key: controller.homeKey),
              const SizedBox(height: 60),
              SectionTitle(key: controller.aboutKey, title: "About Me"),
              const AboutCard(),
              const SizedBox(height: 40),
              SectionTitle(key: controller.skillsKey, title: "Skills"),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 3 : (isTablet ? 4 : 6),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemCount: controller.skills.length,
                itemBuilder: (context, index) => SkillCard(
                  index: index,
                  skill: controller.skills[index],
                ),
              ),
              const SizedBox(height: 40),
              SectionTitle(key: controller.experienceKey, title: "Education"),
              const ExperienceCard(),
              const SizedBox(height: 40),
              SectionTitle(key: controller.projectsKey, title: "Projects"),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 2),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: isMobile ? 1.4 : 1.6,
                ),
                itemCount: controller.projects.length,
                itemBuilder: (context, index) => ProjectCard(
                  index: index,
                  project: controller.projects[index],
                ),
              ),
              const SizedBox(height: 40),
              SectionTitle(key: controller.contactKey, title: "Contact"),
              const ContactCard(),
              const SizedBox(height: 60),
              Text(
                "© 2024 Md. Jamil Siddique Chowdhury. Built with Flutter & GetX.",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropDownMenu(BuildContext context, PortfolioController controller) {
    return PopupMenuButton<GlobalKey>(
      icon: const Icon(Icons.menu_rounded, color: AppColors.primary, size: 30),
      offset: const Offset(0, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: AppColors.cardBackground.withOpacity(0.95),
      elevation: 10,
      onSelected: (key) => controller.scrollToSection(key),
      itemBuilder: (context) => [
        _buildPopupItem(Icons.home_rounded, "Home", controller.homeKey),
        _buildPopupItem(Icons.person_rounded, "About", controller.aboutKey),
        _buildPopupItem(Icons.code_rounded, "Skills", controller.skillsKey),
        _buildPopupItem(Icons.school_rounded, "Education", controller.experienceKey),
        _buildPopupItem(Icons.rocket_launch_rounded, "Projects", controller.projectsKey),
        _buildPopupItem(Icons.mail_rounded, "Contact", controller.contactKey),
      ],
    );
  }

  PopupMenuItem<GlobalKey> _buildPopupItem(IconData icon, String title, GlobalKey key) {
    return PopupMenuItem(
      value: key,
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.primary),
          const SizedBox(width: 15),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _navItem(String title, GlobalKey key, PortfolioController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextButton(
        onPressed: () => controller.scrollToSection(key),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
