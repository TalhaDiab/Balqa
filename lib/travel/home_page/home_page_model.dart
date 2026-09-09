import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/zcomponents/card_ads/card_ads_widget.dart';
import '/zcomponents/card_ashipp/card_ashipp_widget.dart';
import '/zcomponents/cardspi/cardspi_widget.dart';
import '/zcomponents/socialmedia/socialmedia_widget.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String? up;

  List<int> tripsSearch = [];
  void addToTripsSearch(int item) => tripsSearch.add(item);
  void removeFromTripsSearch(int item) => tripsSearch.remove(item);
  void removeAtIndexFromTripsSearch(int index) => tripsSearch.removeAt(index);
  void insertAtIndexInTripsSearch(int index, int item) =>
      tripsSearch.insert(index, item);
  void updateTripsSearchAtIndex(int index, Function(int) updateFn) =>
      tripsSearch[index] = updateFn(tripsSearch[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Update Row(s)] action in HomePage widget.
  List<UsersRow>? fcmToken;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for cardAds component.
  late CardAdsModel cardAdsModel;
  // State field(s) for fromTrip widget.
  String? fromTripValue;
  FormFieldController<String>? fromTripValueController;
  // State field(s) for toTrip widget.
  String? toTripValue;
  FormFieldController<String>? toTripValueController;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - Query Rows] action in calTrip widget.
  List<TripsRow>? trips;
  // Model for cardAshipp component.
  late CardAshippModel cardAshippModel;
  // Model for cardspi component.
  late CardspiModel cardspiModel;
  Stream<List<BookingsRow>>? listViewSupabaseStream;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // State field(s) for newPhone widget.
  FocusNode? newPhoneFocusNode;
  TextEditingController? newPhoneTextController;
  String? Function(BuildContext, String?)? newPhoneTextControllerValidator;
  // Stores action output result for [Backend Call - API (OTP)] action in Button widget.
  ApiCallResponse? otpNew;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UsersRow>? insert;
  // State field(s) for Notes widget.
  FocusNode? notesFocusNode;
  TextEditingController? notesTextController;
  String? Function(BuildContext, String?)? notesTextControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? logoutdialog;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UsersRow>? logout;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? deleteAccount0;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UsersRow>? paused;
  // Model for socialmedia component.
  late SocialmediaModel socialmediaModel;

  @override
  void initState(BuildContext context) {
    cardAdsModel = createModel(context, () => CardAdsModel());
    cardAshippModel = createModel(context, () => CardAshippModel());
    cardspiModel = createModel(context, () => CardspiModel());
    socialmediaModel = createModel(context, () => SocialmediaModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    cardAdsModel.dispose();
    cardAshippModel.dispose();
    cardspiModel.dispose();
    expandableExpandableController.dispose();
    newPhoneFocusNode?.dispose();
    newPhoneTextController?.dispose();

    notesFocusNode?.dispose();
    notesTextController?.dispose();

    socialmediaModel.dispose();
  }
}
