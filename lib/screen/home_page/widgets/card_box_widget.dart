import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lms_project/screen/home_page/contoller/check_in_out_controller.dart';
import 'package:lms_project/helpers/app_colour.dart';
import 'package:lms_project/helpers/app_sizedboxes.dart';
import 'package:lms_project/helpers/app_text_styles.dart';
import 'package:lms_project/screen/home_page/contoller/time_contoller.dart';

class BoxWidget extends StatelessWidget {
  final Color color;
  final Icon icon;
  final String done;
  final String total;
  final String cardtitle;

  const BoxWidget({
    super.key,
    required this.color,
    required this.icon,
    required this.done,
    required this.total,
    required this.cardtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8),
      child: Container(
        width: 120,
        height: 65,
        decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     blurStyle: BlurStyle.normal,
          //     color: Colors.white,
          //     spreadRadius: 1,
          //     blurRadius: 30,
          //     offset: Offset(0, -10),
          //   ),
          // ],
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon.icon, size: 20, color: AppColors.mutedGrey2),
                  AppSizedBoxes.sizedboxW3,
                  Flexible(
                    child: Tooltip(
                      message: cardtitle,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(
                          12,
                        ), // Rounded edges
                      ),
                      textStyle: TextStyle(
                        color: Colors.white, // Text color
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 8,
                      ),
                      preferBelow: true, // Show above the widget
                      child: Text(
                        cardtitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextStyles.urbanistheading2,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Row(
                  children: [
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: double.parse(done)),
                      duration: const Duration(seconds: 1),
                      builder: (context, value, child) {
                        return Text(
                          value.toInt().toString(),
                          style: TextStyle(
                            color: AppColors.softIvory,
                            fontSize: 16,
                          ),
                        );
                      },
                    ),
                    Text(
                      '/$total',
                      style: TextStyle(
                        color: AppColors.mutedGrey2,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckInOutButton extends ConsumerWidget {
  const CheckInOutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkinState = ref.watch(checkinTimeProvider);
    final checkinController = ref.read(checkinTimeProvider.notifier);
    var isRunning = ref.watch(isRunningProvider);
    final isCheckedIn = checkinState.checkInTime != null;
    final stopWatchTimer = ref.watch(stopWatchProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              // Toggle the isRunning state
              final isCurrentlyRunning = ref.read(isRunningProvider);
              ref.read(isRunningProvider.notifier).state = !isCurrentlyRunning;

              if (isCurrentlyRunning) {
                stopWatchTimer.onStopTimer();
                print("⏸️ Timer stopped");
              } else {
                stopWatchTimer.onStartTimer();
                print("▶️ Timer started");
              }
            },
            child: AnimatedContainer(
              width: 140,
              height: 80,
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurStyle: BlurStyle.normal,
                    color: Colors.black.withAlpha(40),
                    spreadRadius: 1,
                    blurRadius: 20,
                    offset: const Offset(0, -6),
                  ),
                ],
                color:
                    isCheckedIn
                        ? Colors.green.shade400
                        : Colors.deepOrange.shade400,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Tooltip(
                  message: isCheckedIn ? "CHECKOUT" : "CHECKIN",
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  preferBelow: true,
                  child: Text(
                    isCheckedIn ? "CHECKOUT" : "CHECKIN",
                    style: AppTextStyles.urbanistheading2.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
