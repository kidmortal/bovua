import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class GlobalConfigService {
  final remoteConfig = FirebaseRemoteConfig.instance;
  init() async {
    await remoteConfig.setDefaults({
      "app_name": "Bovua",
      "bottom_nav_icons_color": "#008bff",
      "bottom_nav_background_color": "#fafafa",
      "youtube_video_playlist": ["FSRCjZ7q58w", "hmRihdzObbg"].toString(),
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

  List<String> getYoutubeVideosPlaylist() {
    final json = jsonDecode(remoteConfig.getString("youtube_video_playlist"));
    final playlist = List<String>.from(json);
    return playlist;
  }
}
