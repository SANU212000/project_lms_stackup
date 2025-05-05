
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:lms_project/widgets/app_colour.dart';

class ProgresIndicator extends StatelessWidget {
  const ProgresIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 180,
            child: DashedCircularProgressBar.aspectRatio(
              aspectRatio: 3,
              progress: 20,
              startAngle: 250,
              sweepAngle: 220,
              corners: StrokeCap.round,
              foregroundStrokeWidth: 30,
              backgroundStrokeWidth: 30,
              circleCenterAlignment: Alignment.bottomCenter,
              foregroundColor: AppColors.mutedGrey,
              backgroundColor: Colors.white.withAlpha(40),
              animation: true,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 140,
            child: DashedCircularProgressBar.aspectRatio(
              aspectRatio: 2.2,
              progress: 80,
              startAngle: 250,
              sweepAngle: 220,
              corners: StrokeCap.round,
              foregroundStrokeWidth: 25,
              backgroundStrokeWidth: 20,
              circleCenterAlignment: Alignment.bottomCenter,
              foregroundColor: AppColors.blazingOrange2,
              backgroundColor: Colors.white.withAlpha(40),
              animation: true,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 100,
            child: DashedCircularProgressBar.aspectRatio(
              aspectRatio: 2,
              progress: 30,
              startAngle: 250,
              sweepAngle: 220,
              corners: StrokeCap.round,
              foregroundStrokeWidth: 30,
              backgroundStrokeWidth: 20,
              circleCenterAlignment: Alignment.bottomCenter,
              foregroundColor: AppColors.blazingOrange,
              backgroundColor: Colors.white.withAlpha(40),
              animation: true,
            ),
          ),
        ),
      ],
    );
  }
}
