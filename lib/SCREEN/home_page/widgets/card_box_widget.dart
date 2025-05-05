import 'package:flutter/material.dart';
import 'package:lms_project/widgets/app_colour.dart';
import 'package:lms_project/widgets/app_sizedboxes.dart';
import 'package:lms_project/widgets/app_text_styles.dart';

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
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 120,
        height: 70,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 5,
              blurRadius: 30,
              offset: Offset(0, 1),
            ),
          ],
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
                  Text(
                    cardtitle,
                    style: AppTextStyles.urbanistheading2,
                    selectionColor: AppColors.mutedGrey2,
                  ),
                ],
              ),
              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(child: AppSizedBoxes.sizedboxW3),
                    TextSpan(
                      text: done,
                      style: TextStyle(
                        color:
                            AppColors.softIvory, // light or default text color
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: '/',
                      style: TextStyle(
                        color:
                            AppColors.mutedGrey2, // light or default text color
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: total,
                      style: TextStyle(
                        color:
                            AppColors.mutedGrey2, // light or default text color
                        fontSize: 20,
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
