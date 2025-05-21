import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lms_project/helpers/app_colour.dart';
import 'package:lms_project/helpers/app_text_styles.dart';
import 'package:lms_project/screen/bottom_navgation.dart/navigation_provider.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:lms_project/screen/home_page/home_page.dart';
import 'package:lms_project/screen/profile_screen/profile_screen.dart';
import 'package:lms_project/screen/attendance_screen/attendance_screen.dart';

class BottomNavScreen extends ConsumerWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);
    final screens = const [AttendanceScreen(), HomeScreen(), ProfileScreen()];

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: KeyedSubtree(
          key: ValueKey(currentIndex),
          child: screens[currentIndex],
        ),
      ),
      bottomNavigationBar: StylishBottomBar(
        option: BubbleBarOptions(
          barStyle: BubbleBarStyle.horizontal,
          // opacity: 0.9,
          iconSize: 30,
        ),
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(bottomNavIndexProvider.notifier).state = index;
        },
        items: [
          BottomBarItem(
            icon: Icon(
              Icons.calendar_month,
              color: currentIndex == 0 ? Colors.white : Colors.black,
            ),
            selectedIcon: Icon(
              Icons.calendar_month_rounded,
              color: currentIndex == 0 ? Colors.white : Colors.black,
            ),
            title: Text(
              'Attendance',
              style: AppTextStyles.label(
                color: currentIndex == 0 ? Colors.white : Colors.black,
              ),
            ),
            backgroundColor:
                currentIndex == 0
                    ? AppColors.blazingOrange
                    : Colors.transparent,
          ),
          BottomBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: currentIndex == 1 ? Colors.white : Colors.black,
            ),
            selectedIcon: Icon(
              Icons.home,
              color: currentIndex == 1 ? Colors.white : Colors.black,
            ),
            title: Text(
              'Home',
              style: AppTextStyles.label(
                color: currentIndex == 1 ? Colors.white : Colors.black,
              ),
            ),
            backgroundColor:
                currentIndex == 1
                    ? AppColors.blazingOrange
                    : Colors.transparent,
          ),
          BottomBarItem(
            icon: Icon(
              Icons.person_outline,
              color: currentIndex == 2 ? Colors.white : Colors.black,
            ),
            selectedIcon: const Icon(Icons.person, color: Colors.white),
            title: Text(
              'Profile',
              style: AppTextStyles.label(
                color: currentIndex == 2 ? Colors.white : Colors.black,
              ),
            ),
            backgroundColor:
                currentIndex == 2
                    ? AppColors.blazingOrange
                    : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
