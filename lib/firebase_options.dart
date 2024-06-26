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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC4e_HgSnshH3IKwvFOlPFR22bDiZS1TLI',
    appId: '1:44453877964:android:f6bdce7ab1b9bb6621ca69',
    messagingSenderId: '44453877964',
    projectId: 'my-ecommerce-project-flutter',
    databaseURL: 'https://my-ecommerce-project-flutter-default-rtdb.firebaseio.com',
    storageBucket: 'my-ecommerce-project-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCOAqPSDaQAC4kCrgvT1ky7zLQz3jc1Te0',
    appId: '1:44453877964:ios:394841d6b9feea4721ca69',
    messagingSenderId: '44453877964',
    projectId: 'my-ecommerce-project-flutter',
    databaseURL: 'https://my-ecommerce-project-flutter-default-rtdb.firebaseio.com',
    storageBucket: 'my-ecommerce-project-flutter.appspot.com',
    iosBundleId: 'com.example.eCommercee',
  );
}
