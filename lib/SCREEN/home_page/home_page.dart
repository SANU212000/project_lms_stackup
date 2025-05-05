import 'package:flutter/material.dart';
import 'package:lms_project/SCREEN/home_page/widgets/home_profile_card.dart';
import 'package:lms_project/SCREEN/home_page/widgets/week_progress.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          HomeProfileCard(),
          Expanded(child: ListView(children: [WeekProgress()])),
        ],
      ),
    );
  }
}
