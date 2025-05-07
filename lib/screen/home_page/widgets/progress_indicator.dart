// import 'dart:developer';

import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lms_project/config/time_progress.dart';
import 'package:lms_project/helpers/app_colour.dart';
import 'package:lms_project/screen/home_page/contoller/time_contoller.dart';

class ProgresIndicator extends ConsumerWidget {
  const ProgresIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stopWatch = ref.watch(stopWatchProvider);
    final timeProgress = getTimeProgress(stopWatch.rawTime.value);
    // log(timeProgress.percentage);
    // print(timeProgress);

    return StreamBuilder<int>(
      stream: stopWatch.rawTime,
      initialData: stopWatch.rawTime.value,
      builder: (context, snapshot) {
        final rawTime = snapshot.data ?? 0;
        final timeProgress = getTimeProgress(rawTime);

        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            //FOR LEVELS
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 180,
                child: DashedCircularProgressBar.aspectRatio(
                  aspectRatio: 3,
                  progress: 70,
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

            // FOR TEST
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 140,
                child: DashedCircularProgressBar.aspectRatio(
                  aspectRatio: 2.2,
                  progress: 20, // you can tweak ratios here
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
            // check in check out
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 100,
                child: DashedCircularProgressBar.aspectRatio(
                  aspectRatio: 2,
                  progress: timeProgress.percentage * 2,
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
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  timeProgress.formattedTime,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
