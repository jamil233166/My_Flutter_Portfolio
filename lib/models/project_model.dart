import 'package:flutter/material.dart';

class ProjectModel {
  final String title;
  final String description;
  final IconData icon;
  final String? imagePath;

  ProjectModel({
    required this.title,
    required this.description,
    required this.icon,
    this.imagePath,
  });
}
