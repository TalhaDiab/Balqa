import '/flutter_flow/flutter_flow_util.dart';
import 'custom_trip_widget.dart' show CustomTripWidget;
import 'package:flutter/material.dart';

class CustomTripModel extends FlutterFlowModel<CustomTripWidget> {
  ///  Local state fields for this component.

  String tripType = 'ذهاب فقط';

  DateTime? selectedDate;

  DateTime? returntime;

  bool? twice;

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
