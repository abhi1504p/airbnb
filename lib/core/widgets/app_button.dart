import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final double radius;
  final EdgeInsets padding;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = Colors.blue,
    this.radius = 8,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: padding,
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
