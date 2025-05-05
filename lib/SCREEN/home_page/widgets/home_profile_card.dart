import 'package:flutter/material.dart';
import 'package:lms_project/SCREEN/home_page/widgets/card_box_widget.dart';
import 'package:lms_project/SCREEN/home_page/widgets/profile_card_header.dart';
import 'package:lms_project/SCREEN/home_page/widgets/progress_indicator.dart';
import 'package:lms_project/widgets/app_colour.dart';
import 'package:lms_project/widgets/app_sizedboxes.dart';
import 'package:remixicon/remixicon.dart';

class HomeProfileCard extends StatelessWidget {
  const HomeProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
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
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              ProfileCardHeader(),
              AppSizedBoxes.sizedboxH20,
              ProgresIndicator(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BoxWidget(
                      color: AppColors.mutedGrey,
                      icon: Icon(Icons.campaign_outlined),
                      done: '12',
                      total: '14',
                      cardtitle: 'Course',
                    ),
                    BoxWidget(
                      color: AppColors.blazingOrange2,
                      icon: Icon(Icons.laptop),
                      done: '14',
                      total: '20',
                      cardtitle: 'Test',
                    ),
                    BoxWidget(
                      color: AppColors.blazingOrange,
                      icon: Icon(RemixIcons.medal_line),
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
      ),
    );
  }
}
