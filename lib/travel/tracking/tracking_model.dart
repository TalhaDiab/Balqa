import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/travel/map_badge/map_badge_widget.dart';
import '/index.dart';
import 'tracking_widget.dart' show TrackingWidget;
import 'package:flutter/material.dart';

class TrackingModel extends FlutterFlowModel<TrackingWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for MapBadge.
  late MapBadgeModel mapBadgeModel1;
  // Model for MapBadge.
  late MapBadgeModel mapBadgeModel2;

  @override
  void initState(BuildContext context) {
    mapBadgeModel1 = createModel(context, () => MapBadgeModel());
    mapBadgeModel2 = createModel(context, () => MapBadgeModel());
  }

  @override
  void dispose() {
    mapBadgeModel1.dispose();
    mapBadgeModel2.dispose();
  }
}
