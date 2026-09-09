import '/flutter_flow/flutter_flow_util.dart';
import 'phone_widget.dart' show PhoneWidget;
import 'package:flutter/material.dart';

class PhoneModel extends FlutterFlowModel<PhoneWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
  }
}
