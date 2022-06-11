// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB09MwCdq896v2qghvdJ4Qa_gayZpUk4No',
    appId: '1:37275494111:web:b256f8f786fdb1eb492b6a',
    messagingSenderId: '37275494111',
    projectId: 'bovua-9109a',
    authDomain: 'bovua-9109a.firebaseapp.com',
    storageBucket: 'bovua-9109a.appspot.com',
    measurementId: 'G-JLPS5KF10T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBcsrJUUU-bzqXJ9RyRzC1qxf34sTN3FY8',
    appId: '1:37275494111:android:48bacfb12924f5ec492b6a',
    messagingSenderId: '37275494111',
    projectId: 'bovua-9109a',
    storageBucket: 'bovua-9109a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBv7PWvqeRtvYdTb1jUewJNjzSwUU2Oce4',
    appId: '1:37275494111:ios:da7f06fed8a91c9c492b6a',
    messagingSenderId: '37275494111',
    projectId: 'bovua-9109a',
    storageBucket: 'bovua-9109a.appspot.com',
    androidClientId: '37275494111-n5tbrf9tokdrhc59jrqd9b82jjr52k0c.apps.googleusercontent.com',
    iosClientId: '37275494111-4el52r5d3inj9i7m63n88t2up2ip9v9q.apps.googleusercontent.com',
    iosBundleId: 'com.kidmortal.bovua',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBv7PWvqeRtvYdTb1jUewJNjzSwUU2Oce4',
    appId: '1:37275494111:ios:da7f06fed8a91c9c492b6a',
    messagingSenderId: '37275494111',
    projectId: 'bovua-9109a',
    storageBucket: 'bovua-9109a.appspot.com',
    androidClientId: '37275494111-n5tbrf9tokdrhc59jrqd9b82jjr52k0c.apps.googleusercontent.com',
    iosClientId: '37275494111-4el52r5d3inj9i7m63n88t2up2ip9v9q.apps.googleusercontent.com',
    iosBundleId: 'com.kidmortal.bovua',
  );
}
