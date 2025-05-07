import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lms_project/screen/home_page/widgets/home_profile_card.dart';
import 'package:lms_project/helpers/app_colour.dart';
import 'package:lms_project/helpers/app_sizedboxes.dart';
import 'package:lms_project/screen/home_page/widgets/inner_banner_widget.dart';
import 'package:lms_project/screen/home_page/widgets/week_progress.dart';
import 'package:lms_project/screen/profile_screen/profile_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.lightCream,
      extendBody: true,
      body: Column(
        children: [
          const HomeProfileCard(),
          AppSizedBoxes.sizedboxH15,
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const WeekProgress(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InnerBannerSlider(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 600),
              pageBuilder: (_, __, ___) => ProfileScreen(),
              transitionsBuilder: (_, animation, __, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;

                final tween = Tween(
                  begin: begin,
                  end: end,
                ).chain(CurveTween(curve: curve));
                final offsetAnimation = animation.drive(tween);

                return SlideTransition(position: offsetAnimation, child: child);
              },
            ),
          );
        },
      ),
    );
  }
}
