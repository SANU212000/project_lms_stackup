import 'dart:developer';

import 'package:lms_project/routes/route_config.dart';
import 'package:lms_project/utils/internet_connection_checker.dart';
import 'package:new_version_plus/new_version_plus.dart';

class AppForceUpdater {
  final newVersionPlus = NewVersionPlus();

  // This method checks if there is a new version of the app available.
  // If an update is available, it shows an update dialog to the user.
  // Returns true if no update is needed or if there is an error, false if an update is required.
  Future<bool> checkVersionUpdate() async {
    // Check if the device is connected to the internet.
    final networkResult =await InternetConnectionChecker().checkConnection();
    if (networkResult) {
      try {
        // Get the version status from the newVersionPlus package.
        final status = await newVersionPlus.getVersionStatus();
        if (status != null) {
          if (status.canUpdate) {
            // If an update is available, show the update dialog.
            newVersionPlus.showUpdateDialog(
                context: AppConfig.rootNavigatorKey.currentContext!,
              versionStatus: status,
              dialogTitle: 'Update Available',
              dialogText:
                  'A new version of the app is available. Please update to the latest version to continue using the app.',
              allowDismissal: false,
              updateButtonText: 'Update',
            );
            return false; // Return false indicating an update is required.
          } else {
            return true; // Return true indicating no update is needed.
          }
        } else {
          return true; // Return true if status is null.
        }
      } catch (e) {
        // Log any errors that occur during the update check.
        log('error while force update $e');
        return true; // Return true if there is an error.
      }
    } else {
      return true; // Return true if there is no internet connection.
    }
  }
}
