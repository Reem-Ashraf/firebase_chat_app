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
    apiKey: 'AIzaSyC-AgfItLzA4GWxNcow5SnvB8lAI-LCtlE',
    appId: '1:393965838506:web:2bfd5554c28b4e0ac630d3',
    messagingSenderId: '393965838506',
    projectId: 'scholar-chat-app-54318',
    authDomain: 'scholar-chat-app-54318.firebaseapp.com',
    storageBucket: 'scholar-chat-app-54318.appspot.com',
    measurementId: 'G-07EL9TM84E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqAtcMq8eoYONQgf_drfqp04xHdqy-EuQ',
    appId: '1:393965838506:android:9960d4afc6085478c630d3',
    messagingSenderId: '393965838506',
    projectId: 'scholar-chat-app-54318',
    storageBucket: 'scholar-chat-app-54318.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCFklJTeSw8h0Al5prl_joaTMZWnfp225s',
    appId: '1:393965838506:ios:fa9f2b5bcc618354c630d3',
    messagingSenderId: '393965838506',
    projectId: 'scholar-chat-app-54318',
    storageBucket: 'scholar-chat-app-54318.appspot.com',
    iosBundleId: 'com.example.firebaseChatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCFklJTeSw8h0Al5prl_joaTMZWnfp225s',
    appId: '1:393965838506:ios:31b4b3cc7da79f93c630d3',
    messagingSenderId: '393965838506',
    projectId: 'scholar-chat-app-54318',
    storageBucket: 'scholar-chat-app-54318.appspot.com',
    iosBundleId: 'com.example.firebaseChatApp.RunnerTests',
  );
}
