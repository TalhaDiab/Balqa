import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'trip_widget.dart' show TripWidget;
import 'package:flutter/material.dart';

class TripModel extends FlutterFlowModel<TripWidget> {
  ///  Local state fields for this page.

  int seats = 1;

  int fromDoor = 0;

  int? balqaID;

  bool? doorTodoor = false;

  bool? todoor;

  int toDoor = 0;

  String? placeTo;

  String? priceMap;

  ///  State fields for stateful widgets in this page.

  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for fromdoor widget.
  bool? fromdoorValue;
  // State field(s) for fromStation widget.
  FormFieldController<List<String>>? fromStationValueController;
  String? get fromStationValue =>
      fromStationValueController?.value?.firstOrNull;
  set fromStationValue(String? val) =>
      fromStationValueController?.value = val != null ? [val] : [];
  // State field(s) for todoor widget.
  bool? todoorValue;
  // State field(s) for toStation widget.
  FormFieldController<List<String>>? toStationValueController;
  String? get toStationValue => toStationValueController?.value?.firstOrNull;
  set toStationValue(String? val) =>
      toStationValueController?.value = val != null ? [val] : [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<TripsRow>? bookingSeat;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  BookingsRow? bookingDtod;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  NotificationsRow? notification1;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<TripsRow>? bookingSeat2;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  BookingsRow? bookingDtod2;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  NotificationsRow? notification2;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<TripsRow>? bookingSeat3;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  BookingsRow? bookingDtod3;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  NotificationsRow? notification3;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<TripsRow>? bookingSeats;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  BookingsRow? bookingStations;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  NotificationsRow? notification;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
