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

double? newCustomFunction(String? ltlng) {
  ({double? lat, double? lng}) stringToCoordinates(String? value) {
    if (value == null || value.trim().isEmpty) {
      return (lat: null, lng: null);
    }

    final match = RegExp(
      r'LatLng\(lat:\s*(-?\d+\.?\d*),\s*lng:\s*(-?\d+\.?\d*)\)',
    ).firstMatch(value);

    if (match == null) {
      return (lat: null, lng: null);
    }

    return (
      lat: double.tryParse(match.group(1)!),
      lng: double.tryParse(match.group(2)!),
    );
  }
}
