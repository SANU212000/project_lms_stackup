import 'package:flutter/material.dart';
import 'package:lms_project/helpers/app_colour.dart';

class AppTextStyles {
  static const TextStyle urbanistheading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'Urbanist',
  );
  static const TextStyle urbanistheading1black = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: 'Urbanist',
  );
  static const TextStyle urbanistLogoStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w900,
    color: Colors.black,
    fontFamily: 'Urbanist',
    letterSpacing: 1.5,
    shadows: [
      Shadow(offset: Offset(1.5, 1.5), blurRadius: 4.0, color: Colors.black26),
    ],
  );

  static const TextStyle urbanistheading2 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.mutedGrey2,

    fontFamily: 'Urbanist',
  );

  static const TextStyle urbanistbody = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.white,
    fontFamily: 'Urbanist',
  );
  static const TextStyle urbanistbodyblack = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontFamily: 'Urbanist',
  );

  static const TextStyle urbanistbodyLight = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
    fontFamily: 'Urbanist',
  );

  static const TextStyle urbanistlabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
    fontFamily: 'Urbanist',
  );

  static const TextStyle urbanistbutton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'Urbanist',
  );

  static TextStyle heading1({
    double fontSize = 24,
    FontWeight fontWeight = FontWeight.bold,
    Color color = Colors.white,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: 'Urbanist',
    );
  }

  static TextStyle heading1Black({
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.bold,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: 'Urbanist',
    );
  }

  static TextStyle logo({
    double fontSize = 32,
    FontWeight fontWeight = FontWeight.w900,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: 'Urbanist',
      letterSpacing: 1.5,
      shadows: const [
        Shadow(
          offset: Offset(1.5, 1.5),
          blurRadius: 4.0,
          color: Colors.black26,
        ),
      ],
    );
  }

  static TextStyle heading2({
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.w600,
    Color color = AppColors.mutedGrey2,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: 'Urbanist',
    );
  }

  static TextStyle body({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.white,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: 'Urbanist',
    );
  }

  static TextStyle bodyBlack({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: 'Urbanist',
    );
  }

  static TextStyle bodyLight({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.grey,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: 'Urbanist',
    );
  }

  static TextStyle label({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w500,
    Color color = Colors.grey,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: 'Urbanist',
    );
  }

  static TextStyle button({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.bold,
    Color color = Colors.white,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: 'Urbanist',
    );
  }
}
