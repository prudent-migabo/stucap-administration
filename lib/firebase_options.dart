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
    apiKey: 'AIzaSyCL7makB9IqjE49RdTEZaq0Sn4ykW_84KQ',
    appId: '1:361753425381:web:d5d8b43c07fee711126b0c',
    messagingSenderId: '361753425381',
    projectId: 'stucap-e2a64',
    authDomain: 'stucap-e2a64.firebaseapp.com',
    storageBucket: 'stucap-e2a64.appspot.com',
    measurementId: 'G-1EC50VHPXN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDMAsZuzj5xzWiAV44N9WNoLLiLpjllXZM',
    appId: '1:361753425381:android:c53fca18926375f3126b0c',
    messagingSenderId: '361753425381',
    projectId: 'stucap-e2a64',
    storageBucket: 'stucap-e2a64.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAbWo7TboYZ_2A1Ww3tjWbcznqCi05FTKw',
    appId: '1:361753425381:ios:bf988247c73ab423126b0c',
    messagingSenderId: '361753425381',
    projectId: 'stucap-e2a64',
    storageBucket: 'stucap-e2a64.appspot.com',
    iosClientId: '361753425381-dak0ods34vr9jr03vlgg5to6ffubd6m3.apps.googleusercontent.com',
    iosBundleId: 'com.example.stucap',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAbWo7TboYZ_2A1Ww3tjWbcznqCi05FTKw',
    appId: '1:361753425381:ios:bf988247c73ab423126b0c',
    messagingSenderId: '361753425381',
    projectId: 'stucap-e2a64',
    storageBucket: 'stucap-e2a64.appspot.com',
    iosClientId: '361753425381-dak0ods34vr9jr03vlgg5to6ffubd6m3.apps.googleusercontent.com',
    iosBundleId: 'com.example.stucap',
  );
}