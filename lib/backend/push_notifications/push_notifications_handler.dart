import 'dart:async';

import 'serialization_util.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    await _handlePushNotificationData(message.data);
  }

  Future _handlePushNotificationData(Map<String, dynamic> messageData) async {
    safeSetState(() => _loading = true);
    try {
      final initialPageName = messageData['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(messageData);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitFadingCircle(
              color: FlutterFlowTheme.of(context).primary,
              size: 50.0,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'HomePage': (data) async => ParameterData(
        allParams: {
          'phone': getParameter<String>(data, 'phone'),
          'tabIndex': getParameter<int>(data, 'tabIndex'),
          'update': getParameter<bool>(data, 'update'),
          'android': getParameter<String>(data, 'android'),
          'apple': getParameter<String>(data, 'apple'),
          'share': getParameter<String>(data, 'share'),
        },
      ),
  'signup': ParameterData.none(),
  'code': (data) async => ParameterData(
        allParams: {
          'phone': getParameter<String>(data, 'phone'),
        },
      ),
  'service': (data) async => ParameterData(
        allParams: {
          'price': getParameter<double>(data, 'price'),
          'letter': getParameter<String>(data, 'letter'),
        },
      ),
  'tripPay': (data) async => ParameterData(
        allParams: {
          'status': getParameter<int>(data, 'status'),
          'booking': getParameter<int>(data, 'booking'),
          'tripid': getParameter<String>(data, 'tripid'),
        },
      ),
  'shippingInfo': (data) async => ParameterData(
        allParams: {
          'kmPrice': getParameter<double>(data, 'kmPrice'),
          'pay': getParameter<bool>(data, 'pay'),
        },
      ),
  'shipmentTracking': (data) async => ParameterData(
        allParams: {
          'shipmentID': getParameter<int>(data, 'shipmentID'),
          'time': getParameter<DateTime>(data, 'time'),
        },
      ),
  'trip': (data) async => ParameterData(
        allParams: {
          'tripID': getParameter<String>(data, 'tripID'),
        },
      ),
  'terms': ParameterData.none(),
  'shippingAcc': (data) async => ParameterData(
        allParams: {
          'pay': getParameter<bool>(data, 'pay'),
        },
      ),
  'SplashPage': ParameterData.none(),
  'order': (data) async => ParameterData(
        allParams: {
          'kmPrice': getParameter<int>(data, 'kmPrice'),
          'pay': getParameter<bool>(data, 'pay'),
        },
      ),
  'spicealTrip': (data) async => ParameterData(
        allParams: {
          'specialTrip': getParameter<int>(data, 'specialTrip'),
          'title': getParameter<String>(data, 'title'),
          'directions': getParameter<double>(data, 'directions'),
          'specialTripVan': getParameter<double>(data, 'specialTripVan'),
        },
      ),
  'tracking': (data) async => ParameterData(
        allParams: {
          'tripID': getParameter<String>(data, 'tripID'),
          'booking': getParameter<int>(data, 'booking'),
        },
      ),
  'tripShared': (data) async {
    final allParams = {
      'tripID': getParameter<String>(data, 'tripID'),
    };
    return ParameterData(
      requiredParams: {
        'tripID': serializeParam(
          allParams['tripID'],
          ParamType.String,
        ),
      },
      allParams: allParams,
    );
  },
  'TripResolver': ParameterData.none(),
  'signin': ParameterData.none(),
  'notify': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
