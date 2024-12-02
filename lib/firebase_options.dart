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
    apiKey: 'AIzaSyBzbz5VAE2DUDTAd_nZRdIJRCxoL3dU_lE',
    appId: '1:929585637427:web:1b56a78518a2621879db46',
    messagingSenderId: '929585637427',
    projectId: 'groceryapp-d52e7',
    authDomain: 'groceryapp-d52e7.firebaseapp.com',
    storageBucket: 'groceryapp-d52e7.firebasestorage.app',
    measurementId: 'G-9W9XXL2RCW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwr4j_W-VgkYET4Ln-XR9VCbuW58Du8Kg',
    appId: '1:929585637427:android:57d9e11d170fb64579db46',
    messagingSenderId: '929585637427',
    projectId: 'groceryapp-d52e7',
    storageBucket: 'groceryapp-d52e7.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBPmtljd9Ocdg3H2wo9GYOWmCpSFuNBUEk',
    appId: '1:929585637427:ios:bbc0969d086aa55b79db46',
    messagingSenderId: '929585637427',
    projectId: 'groceryapp-d52e7',
    storageBucket: 'groceryapp-d52e7.firebasestorage.app',
    androidClientId: '929585637427-klu57s9e94939e1htotq8t2f9q5evf4h.apps.googleusercontent.com',
    iosClientId: '929585637427-kvmvc89cu845nh2i2sjflarfdst183l8.apps.googleusercontent.com',
    iosBundleId: 'com.example.admingrocerypanel',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBPmtljd9Ocdg3H2wo9GYOWmCpSFuNBUEk',
    appId: '1:929585637427:ios:bbc0969d086aa55b79db46',
    messagingSenderId: '929585637427',
    projectId: 'groceryapp-d52e7',
    storageBucket: 'groceryapp-d52e7.firebasestorage.app',
    androidClientId: '929585637427-klu57s9e94939e1htotq8t2f9q5evf4h.apps.googleusercontent.com',
    iosClientId: '929585637427-kvmvc89cu845nh2i2sjflarfdst183l8.apps.googleusercontent.com',
    iosBundleId: 'com.example.admingrocerypanel',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBzbz5VAE2DUDTAd_nZRdIJRCxoL3dU_lE',
    appId: '1:929585637427:web:658a7eb38e2b1b8b79db46',
    messagingSenderId: '929585637427',
    projectId: 'groceryapp-d52e7',
    authDomain: 'groceryapp-d52e7.firebaseapp.com',
    storageBucket: 'groceryapp-d52e7.firebasestorage.app',
    measurementId: 'G-YN9534ZF9C',
  );
}
