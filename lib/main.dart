import 'package:flutter/material.dart';
import 'package:lms_project/SCREEN/home_page/home_page.dart';
import 'package:lms_project/widgets/app_colour.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,

      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.softIvory,
        primaryColor: AppColors.blazingOrange,
        cardColor: AppColors.lightCream,
        useMaterial3: true,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: AppColors.burntClay),
          bodySmall: TextStyle(color: AppColors.mutedGrey),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.softIvory,
          iconTheme: IconThemeData(color: AppColors.burntClay),
          titleTextStyle: TextStyle(
            color: AppColors.burntClay,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.blazingOrange,
          brightness: Brightness.light,
        ),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.blazingOrange,
          brightness: Brightness.dark,
        ),
      ),

      home: HomePage(),
    );
  }
}
