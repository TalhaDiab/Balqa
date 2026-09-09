import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/zcomponents/dialog/dialog_widget.dart';
import 'mapy_widget.dart' show MapyWidget;
import 'package:flutter/material.dart';

class MapyModel extends FlutterFlowModel<MapyWidget> {
  ///  Local state fields for this component.

  LatLng? location;

  String? address;

  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  // State field(s) for Map Google Map widget.
  LatLng? mapGoogleMapsCenter;
  final mapGoogleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Custom Action - getCurrentLocation] action in IconButton widget.
  LatLng? getlocation;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // Stores action output result for [Edge Function - address] action in Button widget.
  dynamic edgeFunction0ug;
  // Stores action output result for [Edge Function - maps] action in Button widget.
  dynamic edgeFunctionckm;
  // Stores action output result for [Edge Function - maps] action in Button widget.
  dynamic edgeFunctionckm1;
  // Stores action output result for [Edge Function - maps] action in Button widget.
  dynamic edgeFunctionckm2;
  // Stores action output result for [Edge Function - maps] action in Button widget.
  dynamic edgeFunctionckm3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }

  /// Action blocks.
  Future<LatLng?> place(
    BuildContext context, {
    required FFPlace? place0,
  }) async {
    LatLng? placeing;

    placeing = await place(
      context,
      place0: placePickerValue,
    );
    FFAppState().location = place0!.latLng;
    location = place0.latLng;
    await showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          child: Container(
            height: 28.0,
            child: DialogWidget(
              title: place0.latLng.toString(),
              text: placePickerValue.address,
              confirm: FFAppState().location!.toString(),
              dismessVis: false,
            ),
          ),
        );
      },
    );

    return null;
  }
}
