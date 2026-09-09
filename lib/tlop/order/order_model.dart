import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/tlop/summary_row/summary_row_widget.dart';
import '/index.dart';
import 'order_widget.dart' show OrderWidget;
import 'package:flutter/material.dart';

class OrderModel extends FlutterFlowModel<OrderWidget> {
  ///  Local state fields for this page.

  bool store = false;

  bool location = false;

  String currency = 'ل.س';

  double? price;

  double? shipping;

  double? delevery;

  double? total;

  bool branch = true;

  bool eStore = true;

  String hvbb = 'jgfhg';

  bool creating = false;

  double? delevery2;

  ///  State fields for stateful widgets in this page.

  // State field(s) for category widget.
  String? categoryValue;
  FormFieldController<String>? categoryValueController;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
  // State field(s) for currency widget.
  FormFieldController<List<String>>? currencyValueController;
  String? get currencyValue => currencyValueController?.value?.firstOrNull;
  set currencyValue(String? val) =>
      currencyValueController?.value = val != null ? [val] : [];
  // State field(s) for size widget.
  FormFieldController<List<String>>? sizeValueController;
  String? get sizeValue => sizeValueController?.value?.firstOrNull;
  set sizeValue(String? val) =>
      sizeValueController?.value = val != null ? [val] : [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for store widget.
  FocusNode? storeFocusNode;
  TextEditingController? storeTextController;
  String? Function(BuildContext, String?)? storeTextControllerValidator;
  // State field(s) for storePhone widget.
  FocusNode? storePhoneFocusNode;
  TextEditingController? storePhoneTextController;
  String? Function(BuildContext, String?)? storePhoneTextControllerValidator;
  // State field(s) for prodGovernorates widget.
  String? prodGovernoratesValue;
  FormFieldController<String>? prodGovernoratesValueController;
  // State field(s) for reels widget.
  FocusNode? reelsFocusNode;
  TextEditingController? reelsTextController;
  String? Function(BuildContext, String?)? reelsTextControllerValidator;
  // State field(s) for deleveryGovernorates widget.
  String? deleveryGovernoratesValue;
  FormFieldController<String>? deleveryGovernoratesValueController;
  // State field(s) for branchGovernorates widget.
  String? branchGovernoratesValue;
  FormFieldController<String>? branchGovernoratesValueController;
  // State field(s) for branches widget.
  String? branchesValue;
  FormFieldController<String>? branchesValueController;
  // Model for SummaryRow.
  late SummaryRowModel summaryRowModel1;
  // Model for SummaryRow.
  late SummaryRowModel summaryRowModel2;
  // Model for SummaryRow.
  late SummaryRowModel summaryRowModel3;
  // Model for SummaryRow.
  late SummaryRowModel summaryRowModel4;
  // Model for SummaryRow.
  late SummaryRowModel summaryRowModel5;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ShippingRow? otlop;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<ShippingRow>? storeadd;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<ShippingRow>? storetobranchadd;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  NotificationsRow? notifysl;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<ShippingRow>? storetolocationadd;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  NotificationsRow? notifysb;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<ShippingRow>? estoreadd;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<ShippingRow>? estoretolocationadd;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  NotificationsRow? notifyrel;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<ShippingRow>? estoretobranchadd;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  NotificationsRow? notifyreb;

  @override
  void initState(BuildContext context) {
    summaryRowModel1 = createModel(context, () => SummaryRowModel());
    summaryRowModel2 = createModel(context, () => SummaryRowModel());
    summaryRowModel3 = createModel(context, () => SummaryRowModel());
    summaryRowModel4 = createModel(context, () => SummaryRowModel());
    summaryRowModel5 = createModel(context, () => SummaryRowModel());
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    priceFocusNode?.dispose();
    priceTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();

    storeFocusNode?.dispose();
    storeTextController?.dispose();

    storePhoneFocusNode?.dispose();
    storePhoneTextController?.dispose();

    reelsFocusNode?.dispose();
    reelsTextController?.dispose();

    summaryRowModel1.dispose();
    summaryRowModel2.dispose();
    summaryRowModel3.dispose();
    summaryRowModel4.dispose();
    summaryRowModel5.dispose();
  }
}
