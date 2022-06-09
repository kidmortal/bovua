import 'dart:ffi';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class GlobalConfigService {
  final remoteConfig = FirebaseRemoteConfig.instance;
  init() async {
    await remoteConfig.setDefaults(const {
      "app_name": "Bovua",
      "bottom_nav_icons_color": "#008bff",
      "bottom_nav_background_color": "#fafafa",
    });
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await remoteConfig.fetchAndActivate();
  }

  getAppName() {
    return remoteConfig.getString("app_name");
  }

  getBottomNavBackgroundColor() {
    return remoteConfig.getString("bottom_nav_background_color");
  }

  getBottomNavIconColors() {
    return remoteConfig.getString("bottom_nav_icons_color");
  }
}
