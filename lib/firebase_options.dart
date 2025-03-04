// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCq7WX5SsxyD2vMEKRWQyIEg0mNWQKFWuw',
    appId: '1:942736749129:android:543be345b44c9117e14598',
    messagingSenderId: '942736749129',
    projectId: 'jembatan-8ec24',
    storageBucket: 'jembatan-8ec24.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAH7BKgK7MyKOH9dfowBGcW-bm760hsEzM',
    appId: '1:942736749129:ios:e7d48990cd16bfdde14598',
    messagingSenderId: '942736749129',
    projectId: 'jembatan-8ec24',
    storageBucket: 'jembatan-8ec24.appspot.com',
    iosBundleId: 'com.example.jembatan',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAH7BKgK7MyKOH9dfowBGcW-bm760hsEzM',
    appId: '1:942736749129:ios:e7d48990cd16bfdde14598',
    messagingSenderId: '942736749129',
    projectId: 'jembatan-8ec24',
    storageBucket: 'jembatan-8ec24.appspot.com',
    iosBundleId: 'com.example.jembatan',
  );
}
