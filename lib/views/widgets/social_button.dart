import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class SocialButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const SocialButton({super.key, required this.icon, required this.onTap});

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedRotation(
          turns: _isHovered ? 0.05 : 0,
          duration: const Duration(milliseconds: 200),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _isHovered ? AppColors.primary : AppColors.cardBackground,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary.withOpacity(0.5)),
            ),
            child: Icon(
              widget.icon,
              color: _isHovered ? Colors.white : AppColors.primary,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
