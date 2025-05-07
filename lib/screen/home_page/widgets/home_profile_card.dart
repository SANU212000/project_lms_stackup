import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lms_project/screen/home_page/contoller/check_in_out_controller.dart';
import 'package:lms_project/screen/home_page/contoller/time_contoller.dart';
import 'package:lms_project/screen/home_page/widgets/card_box_widget.dart';
import 'package:lms_project/screen/home_page/widgets/profile_card_header.dart';
import 'package:lms_project/screen/home_page/widgets/progress_indicator.dart';
import 'package:lms_project/helpers/app_colour.dart';
import 'package:lms_project/helpers/app_sizedboxes.dart';
import 'package:remixicon/remixicon.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class HomeProfileCard extends ConsumerWidget {
  const HomeProfileCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkinState = ref.watch(checkinTimeProvider);
    final controller = ref.read(checkinTimeProvider.notifier);
    final isCheckedIn = checkinState.checkInTime != null;
    final percentage = checkinState.percentage.toStringAsFixed(2);
    final totalMins = checkinState.totalMinutes.toInt();

    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage('assets/images/bgimage1.jpg'),
          opacity: 0.1,
          fit: BoxFit.fill,
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            ProfileCardHeader(),
            AppSizedBoxes.sizedboxH20,
            ProgresIndicator(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxWidget(
                    color: AppColors.mutedGrey,
                    icon: Icon(Icons.campaign_outlined),
                    done: '12',
                    total: '14',
                    cardtitle: 'Course',
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 🔁 Stopwatch display
                      const SizedBox(height: 24),

                      CheckInOutButton(),
                    ],
                  ),

                  BoxWidget(
                    color: AppColors.blazingOrange,
                    icon: Icon(RemixIcons.trophy_line),
                    done: '122',
                    total: '140',
                    cardtitle: 'Achivment',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
