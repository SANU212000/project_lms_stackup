import 'package:flutter/material.dart';

class RoundIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  final VoidCallback onPressed;

  const RoundIcon({
    super.key,
    required this.icon, // Accepts the icon you want to display
    required this.color, // Accepts the background color
    this.size = 60.0, // Default size if not provided
    required this.onPressed, // Required function for onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ClipOval(
        child: Container(
          color: color.withAlpha(80), // Set the dynamic background color
          width: size, // Set the dynamic size
          height: size, // Set the dynamic size
          child: IconButton(
            icon: Icon(
              icon,
              color: Colors.white,
            ), // Set the dynamic icon and color
            onPressed: onPressed, // Handle the press
          ),
        ),
      ),
    );
  }
}
