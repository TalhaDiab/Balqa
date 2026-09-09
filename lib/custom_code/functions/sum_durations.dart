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

String sumDurations(
  String duration1,
  String duration2,
) {
  int extractMinutes(String value) {
    final match = RegExp(r'\d+').firstMatch(value);
    return match != null ? int.parse(match.group(0)!) : 0;
  }

  final totalMinutes = extractMinutes(duration1) + extractMinutes(duration2);

  if (totalMinutes < 60) {
    return '$totalMinutes دقيقة';
  } else {
    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;
    if (minutes == 0) {
      return '$hours ساعة';
    }
    return '$hours ساعة و $minutes دقيقة';
  }
}
