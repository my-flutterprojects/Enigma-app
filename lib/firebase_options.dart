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
    apiKey: 'AIzaSyBO8t0RI-Epv7dqhd4GD7pyE-cubbRNajY',
    appId: '1:882795308293:web:bc1ef5bde4e0a0c9c1436c',
    messagingSenderId: '882795308293',
    projectId: 'enigma-8300a',
    authDomain: 'enigma-8300a.firebaseapp.com',
    storageBucket: 'enigma-8300a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSoXSx7jl-Ulf9XlFfLim3xNAGXM-4O1c',
    appId: '1:882795308293:android:543a3329a1964c17c1436c',
    messagingSenderId: '882795308293',
    projectId: 'enigma-8300a',
    storageBucket: 'enigma-8300a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB86_6Mn0DKyVSi1ctDXIhCYpIOjJgwooc',
    appId: '1:882795308293:ios:259dcb3ce18c361ec1436c',
    messagingSenderId: '882795308293',
    projectId: 'enigma-8300a',
    storageBucket: 'enigma-8300a.appspot.com',
    iosBundleId: 'com.example.enigma',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB86_6Mn0DKyVSi1ctDXIhCYpIOjJgwooc',
    appId: '1:882795308293:ios:f12218a0137c9389c1436c',
    messagingSenderId: '882795308293',
    projectId: 'enigma-8300a',
    storageBucket: 'enigma-8300a.appspot.com',
    iosBundleId: 'com.example.enigma.RunnerTests',
  );
}