import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_project/routes/route_names.dart';
import 'package:lms_project/utils/force_update.dart';
import 'package:lms_project/utils/shared_preference_helper.dart';

final splashControllerProvider = Provider((ref) => SplashController(ref));

class SplashController {
  final Ref ref;

  SplashController(this.ref);

  static const int _splashDurationSeconds = 3;

  Future<void> checkTokenExist(BuildContext context) async {
    final noUpdate = await AppForceUpdater().checkVersionUpdate();

    if (noUpdate) {
      final lastPath = SharedPrefs.getString('lastPath');

      await Future.delayed(const Duration(seconds: _splashDurationSeconds));

      if (!context.mounted) return;

      if (lastPath == 'home') {
        context.goNamed(RouteNames.homescreen);
      } else {
        context.pushReplacementNamed(RouteNames.loginscreen);
      }
    }

    if (!context.mounted) return;

    // await initializeLocalNotificationAndFirebase(context);
  }

  // Future<void> initializeLocalNotificationAndFirebase(BuildContext context) async {
  //   final localNotificationService = LocalNotificationService(context: context);
  //   localNotificationService.initNotification();

  //   FireBasePushNotificationService.notificationControll(context);
  // }
}
