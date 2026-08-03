import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/skill_model.dart';
import '../models/project_model.dart';

class PortfolioController extends GetxController {
  var profileExpanded = false.obs;
  var selectedSkill = (-1).obs;
  var selectedProject = (-1).obs;

  final ScrollController scrollController = ScrollController();

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  void toggleProfile() {
    profileExpanded.value = !profileExpanded.value;
  }

  void selectSkill(int index) {
    if (selectedSkill.value == index) {
      selectedSkill.value = -1;
    } else {
      selectedSkill.value = index;
    }
  }

  void selectProject(int index) {
    if (selectedProject.value == index) {
      selectedProject.value = -1;
    } else {
      selectedProject.value = index;
    }
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  final List<SkillModel> skills = [
    SkillModel(name: "ASP.NET Core", icon: FontAwesomeIcons.code, color: const Color(0xFF512BD4)),
    SkillModel(name: "Flutter", icon: FontAwesomeIcons.flutter, color: const Color(0xFF02569B)),
    SkillModel(name: "Razor", icon: FontAwesomeIcons.fileCode, color: const Color(0xFF512BD4)),
    SkillModel(name: "C#", icon: FontAwesomeIcons.terminal, color: const Color(0xFF239120)),
    SkillModel(name: "JavaScript", icon: FontAwesomeIcons.js, color: const Color(0xFFF7DF1E)),
    SkillModel(name: "MSSQL", icon: FontAwesomeIcons.database, color: const Color(0xFFCC2927)),
    SkillModel(name: "MySQL", icon: FontAwesomeIcons.database, color: const Color(0xFF4479A1)),
    SkillModel(name: "REST API", icon: FontAwesomeIcons.cloud, color: const Color(0xFF005571)),
    SkillModel(name: "Git", icon: FontAwesomeIcons.gitAlt, color: const Color(0xFFF05032)),
  ];

  final List<ProjectModel> projects = [
    ProjectModel(
      title: "School Management System",
      description: "A comprehensive system for managing student records using ASP.NET Core.",
      icon: FontAwesomeIcons.graduationCap,
      imagePath: "assets/images/projects/sms.jpg",
    ),
    ProjectModel(
      title: "Task Planner App",
      description: "A productivity app for students built with Flutter and Firebase.",
      icon: FontAwesomeIcons.listCheck,
      imagePath: "assets/images/projects/task_planner.jpg",
    ),
    ProjectModel(
      title: "E-library Platform",
      description: "A digital library system for sharing academic resources.",
      icon: FontAwesomeIcons.bookOpen,
      imagePath: "assets/images/projects/elibrary.jpg",
    ),
    ProjectModel(
      title: "Personal Portfolio",
      description: "Modern animated portfolio application showcasing my journey.",
      icon: FontAwesomeIcons.userGraduate,
      imagePath: "assets/images/projects/portfolio.jpg",
    ),
  ];
}
