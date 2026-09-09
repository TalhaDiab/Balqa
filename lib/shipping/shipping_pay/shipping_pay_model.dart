import '/flutter_flow/flutter_flow_util.dart';
import 'shipping_pay_widget.dart' show ShippingPayWidget;
import 'package:flutter/material.dart';

class ShippingPayModel extends FlutterFlowModel<ShippingPayWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for payment widget.
  FocusNode? paymentFocusNode;
  TextEditingController? paymentTextController;
  String? Function(BuildContext, String?)? paymentTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paymentFocusNode?.dispose();
    paymentTextController?.dispose();
  }
}
