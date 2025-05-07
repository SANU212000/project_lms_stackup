import 'package:go_router/go_router.dart';
import 'package:lms_project/routes/route_names.dart';
import 'package:lms_project/screen/attndece_screen/attendance_screen.dart';
import 'package:lms_project/screen/home_page/home_page.dart';
import 'package:lms_project/screen/login_screen/login_screen.dart';
import 'package:lms_project/screen/otp_screen/otp_screen.dart';
import 'package:lms_project/screen/profile_screen/profile_screen.dart';
import 'package:lms_project/screen/splash_screen/splashs_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RouteNames.splashscreen,
  routes: [
    GoRoute(
      path: RouteNames.splashscreen,
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RouteNames.loginscreen,
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RouteNames.otpscreen,
      name: 'otp',
      builder: (context, state) => OtpScreen(),
    ),
    GoRoute(
      path: RouteNames.homescreen,
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: RouteNames.profilescreen,
      name: 'profile',
      builder: (context, state) => ProfileScreen(),
    ),
    GoRoute(
      path: RouteNames.attendancescreen,
      name: 'attendance',
      builder: (context, state) => const AttendanceScreen(),
    ),
  ],
);
