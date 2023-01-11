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
    apiKey: 'AIzaSyBOJfZtgPs8kQH7gMhWPAbuzW5gXGQXsBw',
    appId: '1:470761623054:web:3015cd2215069df9bab65f',
    messagingSenderId: '470761623054',
    projectId: 'barsbek-loh',
    authDomain: 'barsbek-loh.firebaseapp.com',
    storageBucket: 'barsbek-loh.appspot.com',
    measurementId: 'G-SBNZ23RN47',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4wCyeKLSxfi8Pwbn_F9mA2brbtMMT1YM',
    appId: '1:470761623054:android:26c1b3cf9c99ac79bab65f',
    messagingSenderId: '470761623054',
    projectId: 'barsbek-loh',
    storageBucket: 'barsbek-loh.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDlq_P2r9-nKj5N2suIfIB7pt8UPiTQ9iw',
    appId: '1:470761623054:ios:82d3907694c20418bab65f',
    messagingSenderId: '470761623054',
    projectId: 'barsbek-loh',
    storageBucket: 'barsbek-loh.appspot.com',
    iosClientId: '470761623054-lrbuuh9sjmkk0th74dss3brgkuf5279q.apps.googleusercontent.com',
    iosBundleId: 'se.pixolity.firstApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDlq_P2r9-nKj5N2suIfIB7pt8UPiTQ9iw',
    appId: '1:470761623054:ios:82d3907694c20418bab65f',
    messagingSenderId: '470761623054',
    projectId: 'barsbek-loh',
    storageBucket: 'barsbek-loh.appspot.com',
    iosClientId: '470761623054-lrbuuh9sjmkk0th74dss3brgkuf5279q.apps.googleusercontent.com',
    iosBundleId: 'se.pixolity.firstApp',
  );
}
