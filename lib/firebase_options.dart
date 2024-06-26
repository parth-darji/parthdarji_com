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
    apiKey: 'AIzaSyAQsa8adfTLC74itwTajNXoWTdzgSxdSPw',
    appId: '1:342639177291:web:265cbe0490ce51c57967ce',
    messagingSenderId: '342639177291',
    projectId: 'parthdarji-com',
    authDomain: 'parthdarji-com.firebaseapp.com',
    storageBucket: 'parthdarji-com.appspot.com',
    measurementId: 'G-1YRFW3JXLQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQqVLEqH4mXq_rp4UiyZTj_T5T82goIvY',
    appId: '1:342639177291:android:7a4e821014b390d77967ce',
    messagingSenderId: '342639177291',
    projectId: 'parthdarji-com',
    storageBucket: 'parthdarji-com.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsFXn3JDJtm5Su9l8nT9lbJKi8bUfrLfs',
    appId: '1:342639177291:ios:13b7207b036e88c27967ce',
    messagingSenderId: '342639177291',
    projectId: 'parthdarji-com',
    storageBucket: 'parthdarji-com.appspot.com',
    iosBundleId: 'com.parthdarji',
  );
}
