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

int? numberLength(String? countryName) {
  if (countryName == null) {
    return null;
  }

  final countryInfoJson = {
    "Afghanistan": {"dialcode": "+93", "code": "AF", "full_number_length": 9},
    "Albania": {"dialcode": "+355", "code": "AL", "full_number_length": 12},
    "Algeria": {"dialcode": "+213", "code": "DZ", "full_number_length": 10},
    "Andorra": {"dialcode": "+376", "code": "AD", "full_number_length": 9},
    "Angola": {"dialcode": "+244", "code": "AO", "full_number_length": 12},
    "Antigua and Barbuda": {
      "dialcode": "+1-268",
      "code": "AG",
      "full_number_length": 11
    },
    "Argentina": {"dialcode": "+54", "code": "AR", "full_number_length": 11},
    "Armenia": {"dialcode": "+374", "code": "AM", "full_number_length": 8},
    "Australia": {"dialcode": "+61", "code": "AU", "full_number_length": 9},
    "Austria": {"dialcode": "+43", "code": "AT", "full_number_length": 12},
    "Azerbaijan": {"dialcode": "+994", "code": "AZ", "full_number_length": 9},
    "Bahamas": {"dialcode": "+1-242", "code": "BS", "full_number_length": 11},
    "Bahrain": {"dialcode": "+973", "code": "BH", "full_number_length": 8},
    "Bangladesh": {"dialcode": "+880", "code": "BD", "full_number_length": 10},
    "Barbados": {"dialcode": "+1-246", "code": "BB", "full_number_length": 11},
    "Belarus": {"dialcode": "+375", "code": "BY", "full_number_length": 12},
    "Belgium": {"dialcode": "+32", "code": "BE", "full_number_length": 9},
    "Belize": {"dialcode": "+501", "code": "BZ", "full_number_length": 7},
    "Benin": {"dialcode": "+229", "code": "BJ", "full_number_length": 9},
    "Bhutan": {"dialcode": "+975", "code": "BT", "full_number_length": 8},
    "Bolivia": {"dialcode": "+591", "code": "BO", "full_number_length": 8},
    "Bosnia and Herzegovina": {
      "dialcode": "+387",
      "code": "BA",
      "full_number_length": 8
    },
    "Botswana": {"dialcode": "+267", "code": "BW", "full_number_length": 7},
    "Brazil": {"dialcode": "+55", "code": "BR", "full_number_length": 11},
    "Brunei": {"dialcode": "+673", "code": "BN", "full_number_length": 7},
    "Bulgaria": {"dialcode": "+359", "code": "BG", "full_number_length": 9},
    "Burkina Faso": {"dialcode": "+226", "code": "BF", "full_number_length": 8},
    "Burundi": {"dialcode": "+257", "code": "BI", "full_number_length": 8},
    "Cabo Verde": {"dialcode": "+238", "code": "CV", "full_number_length": 7},
    "Cambodia": {"dialcode": "+855", "code": "KH", "full_number_length": 9},
    "Cameroon": {"dialcode": "+237", "code": "CM", "full_number_length": 9},
    "Canada": {"dialcode": "+1", "code": "CA", "full_number_length": 10},
    "Central African Republic": {
      "dialcode": "+236",
      "code": "CF",
      "full_number_length": 8
    },
    "Chad": {"dialcode": "+235", "code": "TD", "full_number_length": 8},
    "Chile": {"dialcode": "+56", "code": "CL", "full_number_length": 9},
    "China": {"dialcode": "+86", "code": "CN", "full_number_length": 11},
    "Colombia": {"dialcode": "+57", "code": "CO", "full_number_length": 10},
    "Comoros": {"dialcode": "+269", "code": "KM", "full_number_length": 7},
    "Congo, Democratic Republic of the": {
      "dialcode": "+243",
      "code": "CD",
      "full_number_length": 9
    },
    "Congo, Republic of the": {
      "dialcode": "+242",
      "code": "CG",
      "full_number_length": 9
    },
    "Costa Rica": {"dialcode": "+506", "code": "CR", "full_number_length": 8},
    "Croatia": {"dialcode": "+385", "code": "HR", "full_number_length": 9},
    "Cuba": {"dialcode": "+53", "code": "CU", "full_number_length": 8},
    "Cyprus": {"dialcode": "+357", "code": "CY", "full_number_length": 8},
    "Czech Republic": {
      "dialcode": "+420",
      "code": "CZ",
      "full_number_length": 9
    },
    "Denmark": {"dialcode": "+45", "code": "DK", "full_number_length": 8},
    "Djibouti": {"dialcode": "+253", "code": "DJ", "full_number_length": 6},
    "Dominica": {"dialcode": "+1-767", "code": "DM", "full_number_length": 11},
    "Dominican Republic": {
      "dialcode": "+1-809",
      "code": "DO",
      "full_number_length": 11
    },
    "Ecuador": {"dialcode": "+593", "code": "EC", "full_number_length": 9},
    "Egypt": {"dialcode": "+20", "code": "EG", "full_number_length": 10},
    "El Salvador": {"dialcode": "+503", "code": "SV", "full_number_length": 8},
    "Equatorial Guinea": {
      "dialcode": "+240",
      "code": "GQ",
      "full_number_length": 9
    },
    "Eritrea": {"dialcode": "+291", "code": "ER", "full_number_length": 7},
    "Estonia": {"dialcode": "+372", "code": "EE", "full_number_length": 7},
    "Eswatini": {"dialcode": "+268", "code": "SZ", "full_number_length": 8},
    "Ethiopia": {"dialcode": "+251", "code": "ET", "full_number_length": 9},
    "Fiji": {"dialcode": "+679", "code": "FJ", "full_number_length": 7},
    "Finland": {"dialcode": "+358", "code": "FI", "full_number_length": 10},
    "France": {"dialcode": "+33", "code": "FR", "full_number_length": 9},
    "Gabon": {"dialcode": "+241", "code": "GA", "full_number_length": 7},
    "Gambia": {"dialcode": "+220", "code": "GM", "full_number_length": 7},
    "Georgia": {"dialcode": "+995", "code": "GE", "full_number_length": 9},
    "Germany": {"dialcode": "+49", "code": "DE", "full_number_length": 10},
    "Ghana": {"dialcode": "+233", "code": "GH", "full_number_length": 9},
    "Greece": {"dialcode": "+30", "code": "GR", "full_number_length": 10},
    "Grenada": {"dialcode": "+1-473", "code": "GD", "full_number_length": 11},
    "Guatemala": {"dialcode": "+502", "code": "GT", "full_number_length": 8},
    "Guinea": {"dialcode": "+224", "code": "GN", "full_number_length": 9},
    "Guinea-Bissau": {
      "dialcode": "+245",
      "code": "GW",
      "full_number_length": 7
    },
    "Guyana": {"dialcode": "+592", "code": "GY", "full_number_length": 7},
    "Haiti": {"dialcode": "+509", "code": "HT", "full_number_length": 8},
    "Honduras": {"dialcode": "+504", "code": "HN", "full_number_length": 8},
    "Hungary": {"dialcode": "+36", "code": "HU", "full_number_length": 9},
    "Iceland": {"dialcode": "+354", "code": "IS", "full_number_length": 7},
    "India": {"dialcode": "+91", "code": "IN", "full_number_length": 10},
    "Indonesia": {"dialcode": "+62", "code": "ID", "full_number_length": 10},
    "Iran": {"dialcode": "+98", "code": "IR", "full_number_length": 10},
    "Iraq": {"dialcode": "+964", "code": "IQ", "full_number_length": 10},
    "Ireland": {"dialcode": "+353", "code": "IE", "full_number_length": 9},
    "Italy": {"dialcode": "+39", "code": "IT", "full_number_length": 10},
    "Jamaica": {"dialcode": "+1-876", "code": "JM", "full_number_length": 11},
    "Japan": {"dialcode": "+81", "code": "JP", "full_number_length": 10},
    "Jordan": {"dialcode": "+962", "code": "JO", "full_number_length": 9},
    "Kazakhstan": {"dialcode": "+7", "code": "KZ", "full_number_length": 10},
    "Kenya": {"dialcode": "+254", "code": "KE", "full_number_length": 10},
    "Kiribati": {"dialcode": "+686", "code": "KI", "full_number_length": 8},
    "Korea, North": {
      "dialcode": "+850",
      "code": "KP",
      "full_number_length": 10
    },
    "Korea, South": {"dialcode": "+82", "code": "KR", "full_number_length": 10},
    "Kosovo": {"dialcode": "+383", "code": "XK", "full_number_length": 9},
    "Kuwait": {"dialcode": "+965", "code": "KW", "full_number_length": 8},
    "Kyrgyzstan": {"dialcode": "+996", "code": "KG", "full_number_length": 9},
    "Laos": {"dialcode": "+856", "code": "LA", "full_number_length": 9},
    "Latvia": {"dialcode": "+371", "code": "LV", "full_number_length": 8},
    "Lebanon": {"dialcode": "+961", "code": "LB", "full_number_length": 8},
    "Lesotho": {"dialcode": "+266", "code": "LS", "full_number_length": 8},
    "Liberia": {"dialcode": "+231", "code": "LR", "full_number_length": 7},
    "Libya": {"dialcode": "+218", "code": "LY", "full_number_length": 9},
    "Liechtenstein": {
      "dialcode": "+423",
      "code": "LI",
      "full_number_length": 7
    },
    "Lithuania": {"dialcode": "+370", "code": "LT", "full_number_length": 8},
    "Luxembourg": {"dialcode": "+352", "code": "LU", "full_number_length": 9},
    "Madagascar": {"dialcode": "+261", "code": "MG", "full_number_length": 9},
    "Malawi": {"dialcode": "+265", "code": "MW", "full_number_length": 7},
    "Malaysia": {"dialcode": "+60", "code": "MY", "full_number_length": 10},
    "Maldives": {"dialcode": "+960", "code": "MV", "full_number_length": 7},
    "Mali": {"dialcode": "+223", "code": "ML", "full_number_length": 8},
    "Malta": {"dialcode": "+356", "code": "MT", "full_number_length": 8},
    "Marshall Islands": {
      "dialcode": "+692",
      "code": "MH",
      "full_number_length": 7
    },
    "Mauritania": {"dialcode": "+222", "code": "MR", "full_number_length": 8},
    "Mauritius": {"dialcode": "+230", "code": "MU", "full_number_length": 7},
    "Mexico": {"dialcode": "+52", "code": "MX", "full_number_length": 10},
    "Micronesia": {"dialcode": "+691", "code": "FM", "full_number_length": 7},
    "Moldova": {"dialcode": "+373", "code": "MD", "full_number_length": 8},
    "Monaco": {"dialcode": "+377", "code": "MC", "full_number_length": 8},
    "Mongolia": {"dialcode": "+976", "code": "MN", "full_number_length": 8},
    "Montenegro": {"dialcode": "+382", "code": "ME", "full_number_length": 8},
    "Morocco": {"dialcode": "+212", "code": "MA", "full_number_length": 9},
    "Mozambique": {"dialcode": "+258", "code": "MZ", "full_number_length": 9},
    "Myanmar": {"dialcode": "+95", "code": "MM", "full_number_length": 9},
    "Namibia": {"dialcode": "+264", "code": "NA", "full_number_length": 9},
    "Nauru": {"dialcode": "+674", "code": "NR", "full_number_length": 7},
    "Nepal": {"dialcode": "+977", "code": "NP", "full_number_length": 10},
    "Netherlands": {"dialcode": "+31", "code": "NL", "full_number_length": 9},
    "New Zealand": {"dialcode": "+64", "code": "NZ", "full_number_length": 9},
    "Nicaragua": {"dialcode": "+505", "code": "NI", "full_number_length": 8},
    "Niger": {"dialcode": "+227", "code": "NE", "full_number_length": 8},
    "Nigeria": {"dialcode": "+234", "code": "NG", "full_number_length": 10},
    "North Macedonia": {
      "dialcode": "+389",
      "code": "MK",
      "full_number_length": 8
    },
    "Norway": {"dialcode": "+47", "code": "NO", "full_number_length": 8},
    "Oman": {"dialcode": "+968", "code": "OM", "full_number_length": 8},
    "Pakistan": {"dialcode": "+92", "code": "PK", "full_number_length": 10},
    "Palau": {"dialcode": "+680", "code": "PW", "full_number_length": 7},
    "Panama": {"dialcode": "+507", "code": "PA", "full_number_length": 8},
    "Papua New Guinea": {
      "dialcode": "+675",
      "code": "PG",
      "full_number_length": 8
    },
    "Paraguay": {"dialcode": "+595", "code": "PY", "full_number_length": 9},
    "Peru": {"dialcode": "+51", "code": "PE", "full_number_length": 9},
    "Philippines": {"dialcode": "+63", "code": "PH", "full_number_length": 10},
    "Poland": {"dialcode": "+48", "code": "PL", "full_number_length": 9},
    "Portugal": {"dialcode": "+351", "code": "PT", "full_number_length": 9},
    "Qatar": {"dialcode": "+974", "code": "QA", "full_number_length": 8},
    "Romania": {"dialcode": "+40", "code": "RO", "full_number_length": 10},
    "Russia": {"dialcode": "+7", "code": "RU", "full_number_length": 10},
    "Rwanda": {"dialcode": "+250", "code": "RW", "full_number_length": 9},
    "Saint Kitts and Nevis": {
      "dialcode": "+1-869",
      "code": "KN",
      "full_number_length": 11
    },
    "Saint Lucia": {
      "dialcode": "+1-758",
      "code": "LC",
      "full_number_length": 11
    },
    "Saint Vincent and the Grenadines": {
      "dialcode": "+1-784",
      "code": "VC",
      "full_number_length": 11
    },
    "Samoa": {"dialcode": "+685", "code": "WS", "full_number_length": 7},
    "San Marino": {"dialcode": "+378", "code": "SM", "full_number_length": 10},
    "Sao Tome and Principe": {
      "dialcode": "+239",
      "code": "ST",
      "full_number_length": 7
    },
    "Saudi Arabia": {"dialcode": "+966", "code": "SA", "full_number_length": 9},
    "Senegal": {"dialcode": "+221", "code": "SN", "full_number_length": 9},
    "Serbia": {"dialcode": "+381", "code": "RS", "full_number_length": 9},
    "Seychelles": {"dialcode": "+248", "code": "SC", "full_number_length": 7},
    "Sierra Leone": {"dialcode": "+232", "code": "SL", "full_number_length": 8},
    "Singapore": {"dialcode": "+65", "code": "SG", "full_number_length": 8},
    "Slovakia": {"dialcode": "+421", "code": "SK", "full_number_length": 9},
    "Slovenia": {"dialcode": "+386", "code": "SI", "full_number_length": 9},
    "Solomon Islands": {
      "dialcode": "+677",
      "code": "SB",
      "full_number_length": 7
    },
    "Somalia": {"dialcode": "+252", "code": "SO", "full_number_length": 7},
    "South Africa": {"dialcode": "+27", "code": "ZA", "full_number_length": 9},
    "South Sudan": {"dialcode": "+211", "code": "SS", "full_number_length": 9},
    "Spain": {"dialcode": "+34", "code": "ES", "full_number_length": 9},
    "Sri Lanka": {"dialcode": "+94", "code": "LK", "full_number_length": 9},
    "Sudan": {"dialcode": "+249", "code": "SD", "full_number_length": 9},
    "Suriname": {"dialcode": "+597", "code": "SR", "full_number_length": 7},
    "Sweden": {"dialcode": "+46", "code": "SE", "full_number_length": 9},
    "Switzerland": {"dialcode": "+41", "code": "CH", "full_number_length": 9},
    "Syria": {"dialcode": "+963", "code": "SY", "full_number_length": 9},
    "Taiwan": {"dialcode": "+886", "code": "TW", "full_number_length": 9},
    "Tajikistan": {"dialcode": "+992", "code": "TJ", "full_number_length": 9},
    "Tanzania": {"dialcode": "+255", "code": "TZ", "full_number_length": 9},
    "Thailand": {"dialcode": "+66", "code": "TH", "full_number_length": 9},
    "Timor-Leste": {"dialcode": "+670", "code": "TL", "full_number_length": 7},
    "Togo": {"dialcode": "+228", "code": "TG", "full_number_length": 8},
    "Tonga": {"dialcode": "+676", "code": "TO", "full_number_length": 5},
    "Trinidad and Tobago": {
      "dialcode": "+1-868",
      "code": "TT",
      "full_number_length": 11
    },
    "Tunisia": {"dialcode": "+216", "code": "TN", "full_number_length": 8},
    "Turkey": {"dialcode": "+90", "code": "TR", "full_number_length": 10},
    "Turkmenistan": {"dialcode": "+993", "code": "TM", "full_number_length": 8},
    "Tuvalu": {"dialcode": "+688", "code": "TV", "full_number_length": 5},
    "Uganda": {"dialcode": "+256", "code": "UG", "full_number_length": 9},
    "Ukraine": {"dialcode": "+380", "code": "UA", "full_number_length": 9},
    "United Arab Emirates": {
      "dialcode": "+971",
      "code": "AE",
      "full_number_length": 9
    },
    "United Kingdom": {
      "dialcode": "+44",
      "code": "GB",
      "full_number_length": 10
    },
    "United States": {"dialcode": "+1", "code": "US", "full_number_length": 10},
    "Uruguay": {"dialcode": "+598", "code": "UY", "full_number_length": 9},
    "Uzbekistan": {"dialcode": "+998", "code": "UZ", "full_number_length": 9},
    "Vanuatu": {"dialcode": "+678", "code": "VU", "full_number_length": 7},
    "Vatican City": {"dialcode": "+379", "code": "VA", "full_number_length": 6},
    "Venezuela": {"dialcode": "+58", "code": "VE", "full_number_length": 10},
    "Vietnam": {"dialcode": "+84", "code": "VN", "full_number_length": 9},
    "Yemen": {"dialcode": "+967", "code": "YE", "full_number_length": 9},
    "Zambia": {"dialcode": "+260", "code": "ZM", "full_number_length": 9},
    "Zimbabwe": {"dialcode": "+263", "code": "ZW", "full_number_length": 9}
  };

  final courtryDialCode = countryInfoJson[countryName]?["full_number_length"];
  if (courtryDialCode != null) {
    return courtryDialCode as int?;
  }

  return null;
}
