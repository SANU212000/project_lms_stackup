import 'package:flutter/material.dart';
import 'package:lms_project/routes/route_names.dart';
import 'package:lms_project/screen/home_page/home_page.dart';
import 'package:lms_project/screen/login_screen/login_screen.dart';

class AppConfig {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homescreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RouteNames.loginscreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
