import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF3B82F6);
  static const Color accent = Color(0xFF06B6D4);
  static const Color background = Color(0xFF0F172A);
  static const Color cardBackground = Color(0xFF1E293B);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;
  
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, accent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
