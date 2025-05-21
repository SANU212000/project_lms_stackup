import 'package:flutter/material.dart';
import 'package:lms_project/helpers/app_colour.dart';
import 'package:lms_project/screen/home_page/widgets/week_progress.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightCream,
      body: Column(
        children: [
          Hero(
            tag: 'headerbanner',
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 60, bottom: 20),
              decoration: const BoxDecoration(
                color: Colors.black,
                // gradient: LinearGradient(
                //   colors: [Color(0xFFF481B0), Color(0xFF8F67F0)],
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                // ),
                image: DecorationImage(
                  image: AssetImage('assets/images/bgimage1.jpg'),
                  opacity: 0.2,
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: const Column(
                children: [
                  Text(
                    "Attendance",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Manage your Attendance",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Calendar (custom widget or package)
                // CalendarWidget(),
                const SizedBox(height: 16),

                // Attendance status card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tuesday, May 6, 2025",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Present",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTimeCard("Check In", "09:05 AM"),
                          ),
                          const SizedBox(width: 12),
                          Expanded(child: _buildTimeCard("Check Out", "N/A")),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
                const WeekProgress(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeCard(String label, String time) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 4),
          Text(time, style: TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
