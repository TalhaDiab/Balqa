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

LatLng? getPerChoice(
  List<String>? cityList,
  List<String>? ltlng,
  String? city,
) {
  if (cityList == null || ltlng == null || city == null) {
    return null;
  }

  final index = cityList.indexOf(city);

  if (index == -1 || index >= ltlng.length) {
    return null;
  }

  final parts = ltlng[index].split(',');

  if (parts.length != 2) {
    return null;
  }

  return LatLng(
    double.parse(parts[0].trim()),
    double.parse(parts[1].trim()),
  );
}
