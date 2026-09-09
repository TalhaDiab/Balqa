import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/zcomponents/dialog/dialog_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'mapy_model.dart';
export 'mapy_model.dart';

/// a bottum sheet that contains gooogle map with map center move button and
/// function
class MapyWidget extends StatefulWidget {
  const MapyWidget({
    super.key,
    String? title,
    required this.price,
    required this.citylist,
    required this.ltlng,
  }) : this.title = title ?? '';

  final String title;
  final double? price;
  final List<String>? citylist;
  final List<String>? ltlng;

  @override
  State<MapyWidget> createState() => _MapyWidgetState();
}

class _MapyWidgetState extends State<MapyWidget> {
  late MapyModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapyModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          _model.location = _model.placePickerValue.latLng;
          safeSetState(() {});
          await _model.mapGoogleMapsController.future.then(
            (c) => c.animateCamera(
              CameraUpdate.newLatLng(
                  _model.placePickerValue.latLng.toGoogleMaps()),
            ),
          );
          _model.instantTimer?.cancel();
                },
        startImmediately: true,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On component dispose action.
    () async {
      _model.instantTimer?.cancel();
    }();

    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
      child: Container(
        height: 600.0,
        constraints: BoxConstraints(
          minHeight: 400.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
          shape: BoxShape.rectangle,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: Container(
                  child: Container(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 40.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(9999.0),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Stack(
              alignment: AlignmentDirectional(-0.0, 0.0),
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'ph1mzveh' /* اختر موقعاً أو ابحث عن عنوان */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    lineHeight: 1.35,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .titleMediumIsCustom,
                                  ),
                            ),
                          ].divide(SizedBox(height: 4.0)),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.9, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: Colors.transparent,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    height: 400.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      children: [
                        Container(
                          child: Builder(builder: (context) {
                            final _googleMapMarker =
                                _model.placePickerValue.latLng;
                            return FlutterFlowGoogleMap(
                              controller: _model.mapGoogleMapsController,
                              onCameraIdle: (latLng) =>
                                  _model.mapGoogleMapsCenter = latLng,
                              initialLocation: _model.mapGoogleMapsCenter ??=
                                  LatLng(33.513803, 36.276549),
                              markers: [
                                FlutterFlowMarker(
                                  _googleMapMarker.serialize(),
                                  _googleMapMarker,
                                ),
                              ],
                              markerColor: GoogleMarkerColor.violet,
                              markerImage: MarkerImage(
                                imagePath:
                                    'assets/images/Logo_transparent-2.png',
                                isAssetImage: true,
                                size: 48.0 ?? 20,
                              ),
                              mapType: MapType.normal,
                              style: GoogleMapStyle.standard,
                              initialZoom: 15.0,
                              allowInteraction: true,
                              allowZoom: true,
                              showZoomControls: false,
                              showLocation: true,
                              showCompass: true,
                              showMapToolbar: true,
                              showTraffic: false,
                              centerMapOnMarkerTap: true,
                              mapTakesGesturePreference: true,
                            );
                          }),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.0, 1.0),
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 9999.0,
                                        buttonSize: 48.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        icon: Icon(
                                          Icons.my_location_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 28.0,
                                        ),
                                        onPressed: () async {
                                          currentUserLocationValue =
                                              await getCurrentUserLocation(
                                                  defaultLocation:
                                                      LatLng(0.0, 0.0));
                                          _model.getlocation = await actions
                                              .getCurrentLocation();
                                          await _model
                                              .mapGoogleMapsController.future
                                              .then(
                                            (c) => c.animateCamera(
                                              CameraUpdate.newLatLng(
                                                  currentUserLocationValue!
                                                      .toGoogleMaps()),
                                            ),
                                          );
                                          _model.location = _model.getlocation;
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/balqa_icon-2.png',
                              width: 56.0,
                              height: 56.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 120.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('hfgj'),
                              content: Text('ghdftjytr676757'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        child: FlutterFlowPlacePicker(
                          iOSGoogleMapsApiKey:
                              'AIzaSyAJCiMr1C4CrHfaBIEto2jKICPW6mkWyc4',
                          androidGoogleMapsApiKey:
                              'AIzaSyDO1WCgIIPM5d9e31AEEUfd2Co-El4Ihf0',
                          webGoogleMapsApiKey:
                              'AIzaSyBBFmSKRBcI479ZhJYgdBQxiu1EsBYFV1s',
                          onSelect: (place) async {
                            safeSetState(() => _model.placePickerValue = place);
                            (await _model.mapGoogleMapsController.future)
                                .animateCamera(CameraUpdate.newLatLng(
                                    place.latLng.toGoogleMaps()));
                          },
                          defaultText: FFLocalizations.of(context).getText(
                            'prxmkfef' /* اختر موقعاً */,
                          ),
                          icon: Icon(
                            Icons.search,
                            color: FlutterFlowTheme.of(context).info,
                            size: 16.0,
                          ),
                          buttonOptions: FFButtonOptions(
                            width: 200.0,
                            height: 40.0,
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleSmallIsCustom,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Builder(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            if (functions.isWithinService(
                                    _model.mapGoogleMapsCenter!.toString()) ==
                                true) {
                              final _edgeFunction0ug = await Supabase
                                  .instance.client.functions
                                  .invoke(
                                'address',
                                body: {
                                  "location":
                                      _model.mapGoogleMapsCenter?.toString()
                                },
                              );
                              _model.edgeFunction0ug = _edgeFunction0ug.data;

                              FFAppState().location = functions.getPerChoice(
                                  widget.citylist?.toList(),
                                  widget.ltlng?.toList(),
                                  getJsonField(
                                    _model.edgeFunction0ug,
                                    r'''$["governorate"]''',
                                  ).toString());
                              FFAppState().userCountry = getJsonField(
                                _model.edgeFunction0ug,
                                r'''$["country"]''',
                              ).toString();
                              if ((FFAppState().userCountry == 'سوريا') ||
                                  (FFAppState().userCountry == 'Syria') ||
                                  (FFAppState().userCountry == 'syria')) {
                                if (widget.title == 'up') {
                                  final _edgeFunctionckm = await Supabase
                                      .instance.client.functions
                                      .invoke(
                                    'maps',
                                    body: {
                                      "origin": _model.mapGoogleMapsCenter
                                          ?.toString(),
                                      "destination":
                                          FFAppState().location?.toString()
                                    },
                                  );
                                  _model.edgeFunctionckm =
                                      _edgeFunctionckm.data;

                                  FFAppState().up = _model.mapGoogleMapsCenter;
                                  FFAppState().delevery = widget.price! > 1.0
                                      ? functions
                                          .intPrice(getJsonField(
                                                _model.edgeFunctionckm,
                                                r'''$["distance_km"]''',
                                              ) *
                                              (widget.price!))
                                          .toDouble()
                                      : functions
                                          .roundUpToNearestHalf(getJsonField(
                                                _model.edgeFunctionckm,
                                                r'''$["distance_km"]''',
                                              ) *
                                              (widget.price!));
                                  FFAppState().upAddress = getJsonField(
                                    _model.edgeFunction0ug,
                                    r'''$["display_address"]''',
                                  ).toString();
                                  FFAppState().distance = getJsonField(
                                    _model.edgeFunctionckm,
                                    r'''$["distance_km"]''',
                                  ).toString();
                                  FFAppState().duration = getJsonField(
                                    _model.edgeFunctionckm,
                                    r'''$["duration"]''',
                                  ).toString();
                                  FFAppState().from = getJsonField(
                                    _model.edgeFunction0ug,
                                    r'''$["governorate"]''',
                                  ).toString();
                                  safeSetState(() {});
                                } else if (widget.title == 'specialup') {
                                  final _edgeFunctionckm1 = await Supabase
                                      .instance.client.functions
                                      .invoke(
                                    'maps',
                                    body: {
                                      "origin": _model.mapGoogleMapsCenter
                                          ?.toString(),
                                      "destination":
                                          FFAppState().location?.toString()
                                    },
                                  );
                                  _model.edgeFunctionckm1 =
                                      _edgeFunctionckm1.data;

                                  FFAppState().kms = getJsonField(
                                    _model.edgeFunctionckm1,
                                    r'''$["distance_km"]''',
                                  );
                                  safeSetState(() {});
                                  FFAppState().up = _model.mapGoogleMapsCenter;
                                  FFAppState().upAddress = getJsonField(
                                    _model.edgeFunction0ug,
                                    r'''$["display_address"]''',
                                  ).toString();
                                  FFAppState().from = getJsonField(
                                    _model.edgeFunction0ug,
                                    r'''$["governorate"]''',
                                  ).toString();
                                  safeSetState(() {});
                                } else if (widget.title == 'specialdown') {
                                  final _edgeFunctionckm2 = await Supabase
                                      .instance.client.functions
                                      .invoke(
                                    'maps',
                                    body: {
                                      "origin": _model.mapGoogleMapsCenter
                                          ?.toString(),
                                      "destination": FFAppState().up?.toString()
                                    },
                                  );
                                  _model.edgeFunctionckm2 =
                                      _edgeFunctionckm2.data;

                                  FFAppState().kms = getJsonField(
                                    _model.edgeFunctionckm2,
                                    r'''$["distance_km"]''',
                                  );
                                  safeSetState(() {});
                                  FFAppState().down =
                                      _model.mapGoogleMapsCenter;
                                  FFAppState().delevery2 = widget.price! > 1.0
                                      ? functions
                                          .intPrice(getJsonField(
                                                _model.edgeFunctionckm2,
                                                r'''$["distance_km"]''',
                                              ) *
                                              (widget.price!))
                                          .toDouble()
                                      : (getJsonField(
                                            _model.edgeFunctionckm2,
                                            r'''$["distance_km"]''',
                                          ) *
                                          (widget.price!));
                                  FFAppState().downAddress = getJsonField(
                                    _model.edgeFunction0ug,
                                    r'''$["display_address"]''',
                                  ).toString();
                                  FFAppState().distance = getJsonField(
                                    _model.edgeFunctionckm2,
                                    r'''$["distance_km"]''',
                                  ).toString();
                                  FFAppState().to = getJsonField(
                                    _model.edgeFunction0ug,
                                    r'''$["governorate"]''',
                                  ).toString();
                                  FFAppState().duration2 = getJsonField(
                                    _model.edgeFunctionckm2,
                                    r'''$["duration"]''',
                                  ).toString();
                                  safeSetState(() {});
                                } else {
                                  final _edgeFunctionckm3 = await Supabase
                                      .instance.client.functions
                                      .invoke(
                                    'maps',
                                    body: {
                                      "origin": _model.mapGoogleMapsCenter
                                          ?.toString(),
                                      "destination":
                                          FFAppState().location?.toString()
                                    },
                                  );
                                  _model.edgeFunctionckm3 =
                                      _edgeFunctionckm3.data;

                                  FFAppState().down =
                                      _model.mapGoogleMapsCenter;
                                  FFAppState().delevery2 = widget.price! > 1.0
                                      ? functions
                                          .intPrice(getJsonField(
                                                _model.edgeFunctionckm3,
                                                r'''$["distance_km"]''',
                                              ) *
                                              (widget.price!))
                                          .toDouble()
                                      : functions
                                          .roundUpToNearestHalf(getJsonField(
                                                _model.edgeFunctionckm3,
                                                r'''$["distance_km"]''',
                                              ) *
                                              (widget.price!));
                                  FFAppState().downAddress = getJsonField(
                                    _model.edgeFunction0ug,
                                    r'''$["display_address"]''',
                                  ).toString();
                                  FFAppState().distance = getJsonField(
                                    _model.edgeFunctionckm3,
                                    r'''$["distance_km"]''',
                                  ).toString();
                                  FFAppState().to = getJsonField(
                                    _model.edgeFunction0ug,
                                    r'''$["governorate"]''',
                                  ).toString();
                                  FFAppState().duration2 = getJsonField(
                                    _model.edgeFunctionckm3,
                                    r'''$["duration"]''',
                                  ).toString();
                                  safeSetState(() {});
                                }

                                Navigator.pop(context);
                                _model.instantTimer?.cancel();
                              } else {
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
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.28,
                                        child: DialogWidget(
                                          title: 'عذراً',
                                          text:
                                              'الخدمة غير متوفرة حالياً في منطقتك',
                                          confirm: 'حسناً',
                                          dismessVis: false,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            } else {
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
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.28,
                                      child: DialogWidget(
                                        title: 'عذراً',
                                        text:
                                            'الخدمة غير متوفرة حالياً في منطقتك',
                                        confirm: 'حسناً',
                                        dismessVis: false,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }

                            safeSetState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'ewounkpd' /* حفظ الموقع */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleSmallIsCustom,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
            ),
          ].divide(SizedBox(height: 12.0)).around(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
