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
    apiKey: 'AIzaSyCX-jWV_AWj1Jw5ofd3eN-6kIBX6yARGJM',
    appId: '1:724093820639:web:19dfd6d1e7f700f8c0536a',
    messagingSenderId: '724093820639',
    projectId: 'first-app-4dff7',
    authDomain: 'first-app-4dff7.firebaseapp.com',
    storageBucket: 'first-app-4dff7.appspot.com',
    measurementId: 'G-8Z69FW7FGC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBY2AYSEfvTPSin2UiaTf66e-GErhVTsKg',
    appId: '1:724093820639:android:4d40d530a6594092c0536a',
    messagingSenderId: '724093820639',
    projectId: 'first-app-4dff7',
    storageBucket: 'first-app-4dff7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2suCjUIKqtWiLYa_IwuM89O_nkdRb3y8',
    appId: '1:724093820639:ios:4fbc33f57563924cc0536a',
    messagingSenderId: '724093820639',
    projectId: 'first-app-4dff7',
    storageBucket: 'first-app-4dff7.appspot.com',
    iosClientId: '724093820639-e2enugq48u1p3p76qf20p8s5jlq2col7.apps.googleusercontent.com',
    iosBundleId: 'com.example.firstApp',
  );
}
