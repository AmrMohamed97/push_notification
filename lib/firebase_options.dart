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
    apiKey: 'AIzaSyCF-vEJrd3QbD1WLrxDCQLou5YlfQBKe0A',
    appId: '1:13205997713:web:c25dc545ec368b35955730',
    messagingSenderId: '13205997713',
    projectId: 'first-function-5340d',
    authDomain: 'first-function-5340d.firebaseapp.com',
    storageBucket: 'first-function-5340d.appspot.com',
    measurementId: 'G-D46X05555D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDpuxlnPATN_o-P0ojGAcV8AOzN8KAubdE',
    appId: '1:13205997713:android:798aeea0664d208f955730',
    messagingSenderId: '13205997713',
    projectId: 'first-function-5340d',
    storageBucket: 'first-function-5340d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCJsod7LSg6fLragFPbsZuHUtLkWiyt-H4',
    appId: '1:13205997713:ios:00ed98fb1cab008d955730',
    messagingSenderId: '13205997713',
    projectId: 'first-function-5340d',
    storageBucket: 'first-function-5340d.appspot.com',
    iosBundleId: 'com.example.firstFunction',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCJsod7LSg6fLragFPbsZuHUtLkWiyt-H4',
    appId: '1:13205997713:ios:00ed98fb1cab008d955730',
    messagingSenderId: '13205997713',
    projectId: 'first-function-5340d',
    storageBucket: 'first-function-5340d.appspot.com',
    iosBundleId: 'com.example.firstFunction',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCF-vEJrd3QbD1WLrxDCQLou5YlfQBKe0A',
    appId: '1:13205997713:web:8ee950268db22dd8955730',
    messagingSenderId: '13205997713',
    projectId: 'first-function-5340d',
    authDomain: 'first-function-5340d.firebaseapp.com',
    storageBucket: 'first-function-5340d.appspot.com',
    measurementId: 'G-YEYWWJ1346',
  );
}
