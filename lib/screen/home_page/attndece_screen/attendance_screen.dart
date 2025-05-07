import 'package:flutter/material.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Attendance",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
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
                      Icon(Icons.check_circle, color: Colors.green, size: 18),
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
                      Expanded(child: _buildTimeCard("Check In", "09:05 AM")),
                      const SizedBox(width: 12),
                      Expanded(child: _buildTimeCard("Check Out", "N/A")),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            //   Text("Today's Classes", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            //   const SizedBox(height: 12),
            //   ClassCard(
            //     time: "11:35",
            //     title: "Mathematics",
            //     subtitle: "Chapter 1: Introduction",
            //     location: "Room 6-205",
            //     teacher: "Brooklyn Williamson",
            //     color: Colors.green,
            //   ),
            //   const SizedBox(height: 12),
            //   ClassCard(
            //     time: "13:15",
            //     title: "Biology",
            //     subtitle: "Chapter 3: Animal Kingdom",
            //     location: "Room 2-168",
            //     teacher: "Julia Watson",
            //     color: Colors.grey.shade200,
            //   ),
            //   const SizedBox(height: 12),
            //   ClassCard(
            //     time: "15:10",
            //     title: "Geography",
            //     subtitle: "Chapter 2: Economy USA",
            //     location: "Room T-403",
            //     teacher: "Jenny Alexander",
            //     color: Colors.grey.shade200,
            //   ),
          ],
        ),
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
