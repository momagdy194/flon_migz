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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
      apiKey: "AIzaSyB0uP1-X_lbifw5myDR2CYO2ky0sLhpOrw",
      authDomain: "flone-app.firebaseapp.com",
      projectId: "flone-app",
      storageBucket: "flone-app.appspot.com",
      messagingSenderId: "832207406191",
      appId: "1:832207406191:web:15f55d944c8eb7bfb1f99a",
      measurementId: "G-D9496CP1TP"
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDtMl0KFo1ZuJULlIsMdREg1xWppqVswAc',
    appId: '1:832207406191:android:6e82b122b3ee9fabb1f99a',
    messagingSenderId: '832207406191',
    projectId: 'flone-app',
    storageBucket: 'flone-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDN-VApGFPofuo2NA0jX8-jSaft9OVI3Tk',
    appId: '1:832207406191:ios:9bdda53c67545985b1f99a',
    messagingSenderId: '832207406191',
    projectId: 'flone-app',
    storageBucket: 'flone-app.appspot.com',
    androidClientId: '832207406191-16co41sq6lk2f9q1jdc90d64kps2vn11.apps.googleusercontent.com',
    iosClientId: '832207406191-chtbbcpf7u0c726snb9kds23rs7sgr72.apps.googleusercontent.com',
    iosBundleId: 'com.flonstore.appclothes',
  );
}
