import 'package:flutter/material.dart';
import 'package:lms_project/widgets/app_round_icon.dart';
import 'package:lms_project/SCREEN/home_page/widgets/app_shimmer.dart';
import 'package:lms_project/widgets/app_sizedboxes.dart';
import 'package:lms_project/widgets/app_text_styles.dart';

class ProfileCardHeader extends StatelessWidget {
  const ProfileCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0, right: 20.0, left: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerProfilePicture(
                  imageUrl: 'https://i.pravatar.cc/150?img=5',
                ),
                AppSizedBoxes.sizedboxW10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hi! Sanu', style: AppTextStyles.urbanistheading1),
                    Text('Good Mornin', style: AppTextStyles.urbanistheading2),
                  ],
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RoundIcon(
                color: Colors.white,
                onPressed: () => {},
                icon: Icons.search,
              ),
              RoundIcon(
                color: Colors.white,
                onPressed: () => {},
                icon: Icons.notifications,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
