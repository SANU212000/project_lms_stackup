import 'package:flutter/material.dart';
import 'package:lms_project/helpers/app_colour.dart';

class AppButtonStyles {
  /// 🔵 Primary Button
  static ButtonStyle primary({
    Color backgroundColor = AppColors.blazingOrange2,
    Color foregroundColor = Colors.white,
    double borderRadius = 12,
    double elevation = 2,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      vertical: 14.0,
      horizontal: 24.0,
    ),
    TextStyle textStyle = const TextStyle(
      fontSize: 16,
      fontFamily: 'Urbanist',
      fontWeight: FontWeight.w600,
    ),
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      padding: padding,
      textStyle: textStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }

  /// 🔲 Outlined Button
  static ButtonStyle outlined({
    Color borderColor = Colors.deepPurple,
    Color textColor = Colors.deepPurple,
    double borderWidth = 1.5,
    double borderRadius = 12,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      vertical: 14.0,
      horizontal: 24.0,
    ),
    TextStyle textStyle = const TextStyle(
      fontSize: 16,
      fontFamily: 'Urbanist',
      fontWeight: FontWeight.w600,
    ),
  }) {
    return OutlinedButton.styleFrom(
      foregroundColor: textColor,
      side: BorderSide(color: borderColor, width: borderWidth),
      padding: padding,
      textStyle: textStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }

  /// ⚪ Secondary Button
  static ButtonStyle secondary({
    Color backgroundColor = const Color(0xFFF1F1F1),
    Color foregroundColor = Colors.black,
    double borderRadius = 12,
    double elevation = 0,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      vertical: 14.0,
      horizontal: 24.0,
    ),
    TextStyle textStyle = const TextStyle(
      fontSize: 16,
      fontFamily: 'Urbanist',
      fontWeight: FontWeight.w500,
    ),
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      padding: padding,
      textStyle: textStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
