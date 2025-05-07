import 'package:flutter/material.dart';
import 'package:lms_project/helpers/app_text_styles.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('AttendanceScreen', style: AppTextStyles.urbanistbody),
      ),
    );
  }
}
