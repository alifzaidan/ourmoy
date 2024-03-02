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
    apiKey: 'AIzaSyC1hkmwjyMMci8QdLtBIC3ztPn-phy1iqg',
    appId: '1:409794016088:web:e657a61a0ed16519edeb2d',
    messagingSenderId: '409794016088',
    projectId: 'ourmoy',
    authDomain: 'ourmoy.firebaseapp.com',
    storageBucket: 'ourmoy.appspot.com',
    measurementId: 'G-P4ECF04BE2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBBZn2mHveW3QZiAonlwdsptoFiXhvnaPc',
    appId: '1:409794016088:android:e67e180f6b677122edeb2d',
    messagingSenderId: '409794016088',
    projectId: 'ourmoy',
    storageBucket: 'ourmoy.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyABXKbORGUXwkox1bVRT8Gvct1B6jiEROM',
    appId: '1:409794016088:ios:fe508773867dee3aedeb2d',
    messagingSenderId: '409794016088',
    projectId: 'ourmoy',
    storageBucket: 'ourmoy.appspot.com',
    iosBundleId: 'com.example.ourmoy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyABXKbORGUXwkox1bVRT8Gvct1B6jiEROM',
    appId: '1:409794016088:ios:dcc00fccb0a3d319edeb2d',
    messagingSenderId: '409794016088',
    projectId: 'ourmoy',
    storageBucket: 'ourmoy.appspot.com',
    iosBundleId: 'com.example.ourmoy.RunnerTests',
  );
}