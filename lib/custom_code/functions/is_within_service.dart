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

bool? isWithinService(String coordinates) {
  const double minLat = 32.2;
  const double maxLat = 37.4;
  const double minLng = 35.6;
  const double maxLng = 42.5;

  try {
    String value = coordinates.trim();

    // دعم صيغة LatLng(lat: xx, lng: yy) وتحويلها إلى "xx,yy"
    final latLngMatch = RegExp(
      r'LatLng\s*\(\s*lat:\s*([-\d.]+)\s*,\s*lng:\s*([-\d.]+)\s*\)',
      caseSensitive: false,
    ).firstMatch(value);

    if (latLngMatch != null) {
      value = '${latLngMatch.group(1)},${latLngMatch.group(2)}';
    }

    final parts = value.split(',');
    if (parts.length != 2) return false;

    final double lat = double.parse(parts[0].trim());
    final double lng = double.parse(parts[1].trim());

    return lat >= minLat && lat <= maxLat && lng >= minLng && lng <= maxLng;
  } catch (e) {
    return false; // في حال كان النص غير صالح (Format خاطئ)
  }
}
