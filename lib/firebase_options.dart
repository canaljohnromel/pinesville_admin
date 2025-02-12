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
        throw UnsupportedError(
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyD3pal4qCgDMlXYUasrb_QTpu3JuXbWSxA',
    appId: '1:975214782078:web:40b7b22f9455ff87751a2f',
    messagingSenderId: '975214782078',
    projectId: 'pinesville-f6b24',
    authDomain: 'pinesville-f6b24.firebaseapp.com',
    storageBucket: 'pinesville-f6b24.firebasestorage.app',
    measurementId: 'G-9CGYZG0QKP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1eRmtVeYRHCarC1oS20o3ZBw2m-9RcGY',
    appId: '1:975214782078:android:6d2d5b7cc3dfd2c1751a2f',
    messagingSenderId: '975214782078',
    projectId: 'pinesville-f6b24',
    storageBucket: 'pinesville-f6b24.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD3pal4qCgDMlXYUasrb_QTpu3JuXbWSxA',
    appId: '1:975214782078:web:40b7b22f9455ff87751a2f',
    messagingSenderId: '975214782078',
    projectId: 'pinesville-f6b24',
    authDomain: 'pinesville-f6b24.firebaseapp.com',
    storageBucket: 'pinesville-f6b24.firebasestorage.app',
    measurementId: 'G-9CGYZG0QKP',
  );
}