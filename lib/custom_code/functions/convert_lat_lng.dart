import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

LatLng? convertLatLng(
  double? lt,
  double? lng,
  String? latLngString,
) {
  // الحالة الأولى: قيم lat و lng موجودة
  if (lt != null && lng != null && lt != 999 && lng != 999) {
    return LatLng(lt, lng);
  }

  // الحالة الثانية: تحويل النص إلى LatLng
  if (latLngString != null && latLngString.trim().isNotEmpty) {
    final match = RegExp(
      r'LatLng\(lat:\s*(-?\d+\.?\d*),\s*lng:\s*(-?\d+\.?\d*)\)',
    ).firstMatch(latLngString);

    if (match != null) {
      final parsedLat = double.tryParse(match.group(1)!);
      final parsedLng = double.tryParse(match.group(2)!);

      if (parsedLat != null && parsedLng != null) {
        return LatLng(parsedLat, parsedLng);
      }
    }
  }

  return null;
}
