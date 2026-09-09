import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'signin_widget.dart' show SigninWidget;
import 'package:flutter/material.dart';

class SigninModel extends FlutterFlowModel<SigninWidget> {
  ///  Local state fields for this page.

  String? ttds;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PhoneNumberField widget.
  FocusNode? phoneNumberFieldFocusNode;
  TextEditingController? phoneNumberFieldTextController;
  String? Function(BuildContext, String?)?
      phoneNumberFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? user;
  // Stores action output result for [Backend Call - API (OTP)] action in Button widget.
  ApiCallResponse? otp;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UsersRow>? insert;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? signUp;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    phoneNumberFieldFocusNode?.dispose();
    phoneNumberFieldTextController?.dispose();
  }
}
