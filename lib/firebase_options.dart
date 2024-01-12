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
    apiKey: 'AIzaSyC4jqMJUedqDI3a6drPx8Pghc8plQJQSVI',
    appId: '1:526099270196:web:703a416ccaafd885a79861',
    messagingSenderId: '526099270196',
    projectId: 'movie-app-63dd1',
    authDomain: 'movie-app-63dd1.firebaseapp.com',
    storageBucket: 'movie-app-63dd1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAHJur7pIL8dNNAH7sdgEshAREqnL771a8',
    appId: '1:526099270196:android:a002d04a8e46030ca79861',
    messagingSenderId: '526099270196',
    projectId: 'movie-app-63dd1',
    storageBucket: 'movie-app-63dd1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIj4SuuGWPF9dOX_QYvQn9smDLkXctI2Q',
    appId: '1:526099270196:ios:6da6dc0e3e406235a79861',
    messagingSenderId: '526099270196',
    projectId: 'movie-app-63dd1',
    storageBucket: 'movie-app-63dd1.appspot.com',
    iosClientId: '526099270196-3m2krh8v9f619t0tu0qe7t9haj4u5vd3.apps.googleusercontent.com',
    iosBundleId: 'com.example.movieAppWithClean',
  );
}
