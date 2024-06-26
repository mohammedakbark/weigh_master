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
        return macos;
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
    apiKey: 'AIzaSyDk0OfMH_aViG3wG8PrYknaJVba-ITGJx4',
    appId: '1:348544902546:web:15f6c50626139ff2488d4b',
    messagingSenderId: '348544902546',
    projectId: 'wighmaster',
    authDomain: 'wighmaster.firebaseapp.com',
    storageBucket: 'wighmaster.appspot.com',
    measurementId: 'G-XEQ2W94T12',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBHAZBW-w0qrgHOoBioyI8lqQS_5XeFsmg',
    appId: '1:348544902546:android:feda34ebeb483dd0488d4b',
    messagingSenderId: '348544902546',
    projectId: 'wighmaster',
    storageBucket: 'wighmaster.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD757-2gitSuKbjJtnowsiNj4KSpk8zox0',
    appId: '1:348544902546:ios:e2c6312e2617c20b488d4b',
    messagingSenderId: '348544902546',
    projectId: 'wighmaster',
    storageBucket: 'wighmaster.appspot.com',
    iosBundleId: 'com.example.weighMaster',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD757-2gitSuKbjJtnowsiNj4KSpk8zox0',
    appId: '1:348544902546:ios:e2c6312e2617c20b488d4b',
    messagingSenderId: '348544902546',
    projectId: 'wighmaster',
    storageBucket: 'wighmaster.appspot.com',
    iosBundleId: 'com.example.weighMaster',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDk0OfMH_aViG3wG8PrYknaJVba-ITGJx4',
    appId: '1:348544902546:web:5b5622840c0c5b5b488d4b',
    messagingSenderId: '348544902546',
    projectId: 'wighmaster',
    authDomain: 'wighmaster.firebaseapp.com',
    storageBucket: 'wighmaster.appspot.com',
    measurementId: 'G-T30GPVC9Q2',
  );
}
