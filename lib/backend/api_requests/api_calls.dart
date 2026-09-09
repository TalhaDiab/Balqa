import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class OtpCall {
  static Future<ApiCallResponse> call({
    String? phone = '',
    String? code = '',
  }) async {
    final ffApiRequestBody = '''
{
  "channel": "auto",
  "messageType": "otp",
  "options": {
    "priority": "high"
  },
  "to": "${escapeStringForJson(phone)}",
  "template": {
    "id": "69b7f49018e150aca6099ecb",
    "key": "61ca0cbaeaeb99ee841f49b432fe9a6aaa9a618f626a31dae3e64b29ec40d011",
    "language": "ar",
    "variablesIndexed": [
      "${escapeStringForJson(code)}"
    ]
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'OTP',
      apiUrl: 'https://raselsms.com/api/v2/messages/send',
      callType: ApiCallType.POST,
      headers: {
        'X-API-Key':
            '61ca0cbaeaeb99ee841f49b432fe9a6aaa9a618f626a31dae3e64b29ec40d011',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MapsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'maps',
      apiUrl: 'AIzaSyABLQKG3OrkwBe_xnjTu9Z8suUoTl3fNf8',
      callType: ApiCallType.GET,
      headers: {
        'key': 'AIzaSyABLQKG3OrkwBe_xnjTu9Z8suUoTl3fNf8',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
