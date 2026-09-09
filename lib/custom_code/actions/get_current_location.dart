// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';

Future<LatLng?> getCurrentLocation() async {
  // 1. فحص إذن الموقع
  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return null;
    }
  }

  // 2. إذا الإذن مرفوض بشكل دائم
  if (permission == LocationPermission.deniedForever) {
    await Geolocator.openAppSettings();
    return null;
  }

  // 3. فحص تفعيل خدمة الموقع
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    // فتح إعدادات الموقع
    await Geolocator.openLocationSettings();

    // انتظار رجوع المستخدم للتطبيق
    await _waitForResume();

    // 4. إعادة فحص GPS بعد العودة
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return null;
    }
  }

  // 5. الحصول على الموقع
  try {
    final Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );

    return LatLng(
      position.latitude,
      position.longitude,
    );
  } catch (_) {
    return null;
  }
}

// انتظار عودة التطبيق إلى الواجهة
Future<void> _waitForResume() async {
  final completer = Completer<void>();
  final binding = WidgetsBinding.instance;

  late final WidgetsBindingObserver observer;

  observer = _ResumeObserver(
    onResume: () {
      if (!completer.isCompleted) {
        completer.complete();
      }
      binding.removeObserver(observer);
    },
  );

  binding.addObserver(observer);

  await completer.future;
}

class _ResumeObserver extends WidgetsBindingObserver {
  final VoidCallback onResume;

  _ResumeObserver({
    required this.onResume,
  });

  @override
  void didChangeAppLifecycleState(
    AppLifecycleState state,
  ) {
    if (state == AppLifecycleState.resumed) {
      onResume();
    }
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
