import 'package:flutter/material.dart';
import 'package:lms_project/helpers/app_colour.dart';
import 'package:lms_project/helpers/app_text_styles.dart';
import 'package:remixicon/remixicon.dart';

class WeekProgress extends StatelessWidget {
  const WeekProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.softIvory,
        ),

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Progress',
                    style: AppTextStyles.urbanistheading1black,
                  ),
                  Icon(RemixIcons.calendar_check_line, size: 30),
                ],
              ),
            ),
            WeeklyTracker(markedDays: [true, false, true, true, false, true]),
          ],
        ),
      ),
    );
  }
}

class WeeklyTracker extends StatelessWidget {
  final List<bool> markedDays;

  const WeeklyTracker({super.key, required this.markedDays});

  @override
  Widget build(BuildContext context) {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    final today = DateTime.now();
    final currentWeekdayIndex = today.weekday - 1;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(days.length, (index) {
          final isPastOrToday = index <= currentWeekdayIndex;

          final isMarked = isPastOrToday ? markedDays[index] : null;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5),
            child: Column(
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color:
                        isPastOrToday
                            ? (isMarked == true
                                ? AppColors.blazingOrange2
                                : AppColors.blazingOrange)
                            : AppColors.blazingOrange2.withAlpha(80),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child:
                        isPastOrToday
                            ? Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                isMarked! ? Icons.check : Icons.close,
                                color: AppColors.blazingOrange,
                                size: 22,
                              ),
                            )
                            : Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                color: Colors.white10,
                                shape: BoxShape.circle,
                              ),
                            ),
                  ),
                ),

                Text(days[index], style: AppTextStyles.urbanistbodyblack),
              ],
            ),
          );
        }),
      ),
    );
  }
}
