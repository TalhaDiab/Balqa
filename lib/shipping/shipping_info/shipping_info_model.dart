import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'shipping_info_widget.dart' show ShippingInfoWidget;
import 'package:flutter/material.dart';

class ShippingInfoModel extends FlutterFlowModel<ShippingInfoWidget> {
  ///  Local state fields for this page.

  bool? pricing = false;

  String? firstLocation;

  String? distanceLocation;

  double? deleveryPrice;

  double? amountOppositepay;

  int? governorateID;

  bool isA = false;

  bool isB = false;

  bool? isC;

  bool? isD;

  double? total;

  int? price;

  double? commision;

  double? deleveryPrice2;

  ///  State fields for stateful widgets in this page.

  // State field(s) for recipient widget.
  FocusNode? recipientFocusNode;
  TextEditingController? recipientTextController;
  String? Function(BuildContext, String?)? recipientTextControllerValidator;
  // State field(s) for recipientPhone widget.
  FocusNode? recipientPhoneFocusNode;
  TextEditingController? recipientPhoneTextController;
  String? Function(BuildContext, String?)?
      recipientPhoneTextControllerValidator;
  // State field(s) for sens widget.
  bool? sensValue;
  // State field(s) for directly widget.
  bool? directlyValue;
  // State field(s) for size widget.
  FormFieldController<List<String>>? sizeValueController;
  String? get sizeValue => sizeValueController?.value?.firstOrNull;
  set sizeValue(String? val) =>
      sizeValueController?.value = val != null ? [val] : [];
  // State field(s) for boxesCount widget.
  int? boxesCountValue;
  // State field(s) for contains widget.
  FocusNode? containsFocusNode;
  TextEditingController? containsTextController;
  String? Function(BuildContext, String?)? containsTextControllerValidator;
  // State field(s) for notes widget.
  FocusNode? notesFocusNode;
  TextEditingController? notesTextController;
  String? Function(BuildContext, String?)? notesTextControllerValidator;
  // State field(s) for payBy widget.
  FormFieldController<String>? payByValueController;
  // State field(s) for opposite widget.
  bool? oppositeValue;
  // State field(s) for amuont widget.
  FocusNode? amuontFocusNode;
  TextEditingController? amuontTextController;
  String? Function(BuildContext, String?)? amuontTextControllerValidator;
  // State field(s) for currency widget.
  FormFieldController<List<String>>? currencyValueController;
  String? get currencyValue => currencyValueController?.value?.firstOrNull;
  set currencyValue(String? val) =>
      currencyValueController?.value = val != null ? [val] : [];
  // State field(s) for recLoca widget.
  FormFieldController<String>? recLocaValueController;
  // State field(s) for governorate widget.
  String? governorateValue;
  FormFieldController<String>? governorateValueController;
  // State field(s) for branches widget.
  String? branchesValue;
  FormFieldController<String>? branchesValueController;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for payment widget.
  FocusNode? paymentFocusNode;
  TextEditingController? paymentTextController;
  String? Function(BuildContext, String?)? paymentTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ShippingRow? addShipping;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? updateShippingop;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  NotificationsRow? notifyrecepopp;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ShippingRow? addShippingrnoop;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? updateShippingunop;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  NotificationsRow? notifyrecepnoopp;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ShippingRow? addShippingsender;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? updateShippingsender;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  NotificationsRow? notifysender;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ShippingRow? addShippingsender1;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? updateShippingsender1;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  NotificationsRow? notifysender1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    recipientFocusNode?.dispose();
    recipientTextController?.dispose();

    recipientPhoneFocusNode?.dispose();
    recipientPhoneTextController?.dispose();

    containsFocusNode?.dispose();
    containsTextController?.dispose();

    notesFocusNode?.dispose();
    notesTextController?.dispose();

    amuontFocusNode?.dispose();
    amuontTextController?.dispose();

    paymentFocusNode?.dispose();
    paymentTextController?.dispose();
  }

  /// Action blocks.
  Future distance(BuildContext context) async {}

  /// Additional helper methods.
  String? get payByValue => payByValueController?.value;
  String? get recLocaValue => recLocaValueController?.value;
  String? get radioButtonValue => radioButtonValueController?.value;
}
