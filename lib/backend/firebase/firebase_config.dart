import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAU0AQe5Xo5xlTcpufpJk0-hBjhLxmMuPk",
            authDomain: "balqaa-kcy3hf.firebaseapp.com",
            projectId: "balqaa-kcy3hf",
            storageBucket: "balqaa-kcy3hf.firebasestorage.app",
            messagingSenderId: "553130190767",
            appId: "1:553130190767:web:539bc40a33f5e43c22f15a"));
  } else {
    await Firebase.initializeApp();
  }
}
