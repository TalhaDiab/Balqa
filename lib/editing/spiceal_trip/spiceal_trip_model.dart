import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/services/custom_trip/custom_trip_widget.dart';
import '/services/vehicle_card2/vehicle_card2_widget.dart';
import '/index.dart';
import 'spiceal_trip_widget.dart' show SpicealTripWidget;
import 'package:flutter/material.dart';

class SpicealTripModel extends FlutterFlowModel<SpicealTripWidget> {
  ///  Local state fields for this page.

  bool booking = false;

  ///  State fields for stateful widgets in this page.

  // Model for customTrip component.
  late CustomTripModel customTripModel;
  // Model for VehicleCard.
  late VehicleCard2Model vehicleCardModel1;
  // Model for VehicleCard.
  late VehicleCard2Model vehicleCardModel2;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  BookingsRow? insertingSpecial;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  NotificationsRow? notify;

  @override
  void initState(BuildContext context) {
    customTripModel = createModel(context, () => CustomTripModel());
    vehicleCardModel1 = createModel(context, () => VehicleCard2Model());
    vehicleCardModel2 = createModel(context, () => VehicleCard2Model());
  }

  @override
  void dispose() {
    customTripModel.dispose();
    vehicleCardModel1.dispose();
    vehicleCardModel2.dispose();
  }
}
