import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/zcomponents/ticket_card/ticket_card_widget.dart';
import '/index.dart';
import 'trip_pay_widget.dart' show TripPayWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class TripPayModel extends FlutterFlowModel<TripPayWidget> {
  ///  Local state fields for this page.

  String? payment;

  String? copoun;

  int? discount = 0;

  bool? isDis;

  DiscountCodesRow? discountC;

  ///  State fields for stateful widgets in this page.

  // Model for ticketCard component.
  late TicketCardModel ticketCardModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for CountController widget.
  int? countControllerValue;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<BookingsRow>? editingConfirm;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  NotificationsRow? notify;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<DiscountCodesRow>? discountCode;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<DiscountUsageRow>? usage;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<BookingsRow>? bookingDiscountQuery;
  // Stores action output result for [Backend Call - Insert Row] action in IconButton widget.
  DiscountUsageRow? discountUsage;
  // Stores action output result for [Backend Call - Update Row(s)] action in IconButton widget.
  List<BookingsRow>? updated;
  // State field(s) for payField widget.
  FocusNode? payFieldFocusNode;
  TextEditingController? payFieldTextController;
  String? Function(BuildContext, String?)? payFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in IconButton widget.
  List<BookingsRow>? booking;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? cancel;
  // Stores action output result for [Backend Call - Delete Row(s)] action in Button widget.
  List<BookingsRow>? cancelBooking;

  @override
  void initState(BuildContext context) {
    ticketCardModel = createModel(context, () => TicketCardModel());
  }

  @override
  void dispose() {
    ticketCardModel.dispose();
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    payFieldFocusNode?.dispose();
    payFieldTextController?.dispose();
  }
}
