import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/zcomponents/shipping_card/shipping_card_widget.dart';
import '/index.dart';
import 'shipping_acc_widget.dart' show ShippingAccWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ShippingAccModel extends FlutterFlowModel<ShippingAccWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for shippingCard component.
  late ShippingCardModel shippingCardModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<DiscountCodesRow>? discountCode;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<DiscountUsageRow>? usage;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<ShippingRow>? bookingDiscountQuery;
  // Stores action output result for [Backend Call - Insert Row] action in IconButton widget.
  DiscountUsageRow? discountUsage;
  // Stores action output result for [Backend Call - Update Row(s)] action in IconButton widget.
  List<ShippingRow>? updated;
  // State field(s) for payField widget.
  FocusNode? payFieldFocusNode;
  TextEditingController? payFieldTextController;
  String? Function(BuildContext, String?)? payFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in IconButton widget.
  List<ShippingRow>? booking;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? dialog;
  // Stores action output result for [Backend Call - Delete Row(s)] action in Button widget.
  List<ShippingRow>? cancelBooking;

  @override
  void initState(BuildContext context) {
    shippingCardModel = createModel(context, () => ShippingCardModel());
  }

  @override
  void dispose() {
    shippingCardModel.dispose();
    expandableExpandableController.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    payFieldFocusNode?.dispose();
    payFieldTextController?.dispose();
  }
}
