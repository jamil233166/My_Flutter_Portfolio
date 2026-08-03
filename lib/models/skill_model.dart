import 'package:flutter/material.dart';

class SkillModel {
  final String name;
  final IconData icon;
  final Color color;
  final String? imagePath; // For original PNG/SVG logos

  SkillModel({
    required this.name, 
    required this.icon, 
    required this.color,
    this.imagePath,
  });
}
