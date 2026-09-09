import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/services/custom_trip/custom_trip_widget.dart';
import '/services/vehicle_card2/vehicle_card2_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'spiceal_trip_model.dart';
export 'spiceal_trip_model.dart';

class SpicealTripWidget extends StatefulWidget {
  const SpicealTripWidget({
    super.key,
    required this.specialTrip,
    required this.citylist,
    required this.ltlng,
    required this.title,
    required this.directions,
    required this.specialTripVan,
  });

  final int? specialTrip;
  final List<String>? citylist;
  final List<String>? ltlng;
  final String? title;
  final double? directions;
  final double? specialTripVan;

  static String routeName = 'spicealTrip';
  static String routePath = 'spicealTrip';

  @override
  State<SpicealTripWidget> createState() => _SpicealTripWidgetState();
}

class _SpicealTripWidgetState extends State<SpicealTripWidget> {
  late SpicealTripModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpicealTripModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      FFAppState().up = null;
      FFAppState().upAddress = '';
      FFAppState().down = null;
      FFAppState().downAddress = '';
      FFAppState().delevery = 0.0;
      FFAppState().delevery2 = 0.0;
      FFAppState().distance = '';
      FFAppState().duration = '';
      FFAppState().duration2 = '';
      FFAppState().from = '';
      FFAppState().to = '';
      FFAppState().location = null;
      FFAppState().userCountry = '';
      FFAppState().Departure = null;
      FFAppState().distination = null;
      FFAppState().directions = 1;
      FFAppState().downkms = 00.0;
      FFAppState().kms = 00.0;
      FFAppState().van = false;
      FFAppState().car = false;
      FFAppState().spicealTripPrice = 0;
      safeSetState(() {});
    }();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 0.068),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primary,
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 13.0, 0.0, 13.0),
              child: Text(
                valueOrDefault<String>(
                  widget.title,
                  'رحلة خاصة',
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).headlineMediumFamily,
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                    ),
              ),
            ),
            actions: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(HomePageWidget.routeName);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Logo_transparent-2.png',
                    height: 58.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      '',
                    ).image,
                  ),
                ),
              ),
            ),
            centerTitle: true,
            elevation: 1.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  wrapWithModel(
                                    model: _model.customTripModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CustomTripWidget(
                                      price: widget.specialTrip!,
                                      cityList: widget.citylist!,
                                      ltlng: widget.ltlng!,
                                    ),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (FFAppState().directions == 2
                                      ? ((FFAppState().Departure != null) &&
                                          (FFAppState().returnTime != null))
                                      : (FFAppState().Departure != null))
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState().car = false;
                                              FFAppState().van = true;
                                              safeSetState(() {});
                                              _model.booking = true;
                                              safeSetState(() {});
                                              if ((FFAppState().directions ==
                                                      2) &&
                                                  (dateTimeFormat(
                                                        "yMd",
                                                        FFAppState().returnTime,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ) !=
                                                      dateTimeFormat(
                                                        "yMd",
                                                        FFAppState().Departure,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ))) {
                                                FFAppState().spicealTripPrice =
                                                    functions.intPrice(functions
                                                            .intPrice(
                                                                FFAppState()
                                                                    .delevery2) *
                                                        (widget.directions!) *
                                                        (widget
                                                            .specialTripVan!));
                                                safeSetState(() {});
                                              } else {
                                                FFAppState().spicealTripPrice =
                                                    functions.intPrice(functions
                                                            .intPrice(
                                                                FFAppState()
                                                                    .delevery2) *
                                                        (widget
                                                            .specialTripVan!));
                                                safeSetState(() {});
                                              }
                                            },
                                            child: wrapWithModel(
                                              model: _model.vehicleCardModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: VehicleCard2Widget(
                                                selected: FFAppState().van,
                                                icon: Icon(
                                                  Icons.airport_shuttle_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 28.0,
                                                ),
                                                type:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'r4p78f1q' /* فان H1 */,
                                                ),
                                                capacity: '11',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState().car = true;
                                              FFAppState().van = false;
                                              safeSetState(() {});
                                              _model.booking = true;
                                              safeSetState(() {});
                                              if ((FFAppState().directions ==
                                                      2) &&
                                                  (dateTimeFormat(
                                                        "yMd",
                                                        FFAppState().returnTime,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ) ==
                                                      dateTimeFormat(
                                                        "yMd",
                                                        FFAppState().Departure,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ))) {
                                                FFAppState().spicealTripPrice =
                                                    functions.intPrice(functions
                                                            .intPrice(
                                                                FFAppState()
                                                                    .delevery2) *
                                                        (widget.directions!));
                                                safeSetState(() {});
                                              } else if (FFAppState()
                                                      .directions ==
                                                  1) {
                                                FFAppState().spicealTripPrice =
                                                    functions.intPrice(
                                                        FFAppState().delevery2);
                                                safeSetState(() {});
                                              } else {
                                                FFAppState().spicealTripPrice =
                                                    functions.intPrice(
                                                        functions.intPrice(
                                                                FFAppState()
                                                                    .delevery2) *
                                                            2.6);
                                                safeSetState(() {});
                                              }
                                            },
                                            child: wrapWithModel(
                                              model: _model.vehicleCardModel2,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: VehicleCard2Widget(
                                                selected: FFAppState().car,
                                                icon: Icon(
                                                  Icons.directions_car_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 28.0,
                                                ),
                                                type:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'm61sb404' /* سيارة حديثة */,
                                                ),
                                                capacity: '4',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                              Material(
                                color: Colors.transparent,
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0x0D1D4847),
                                        FlutterFlowTheme.of(context).primary
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(-1.0, 0.0),
                                      end: AlignmentDirectional(1.0, 0),
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Color(0x331D4847),
                                      width: 0.3,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(24.0),
                                    child: Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: valueOrDefault<
                                                            String>(
                                                          FFAppState().distance,
                                                          '000',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelSmall
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              lineHeight: 1.27,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallIsCustom,
                                                            ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'jmj3p0gn' /*  كم */,
                                                        ),
                                                        style: TextStyle(),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          lineHeight: 1.27,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmallIsCustom,
                                                        ),
                                                  ),
                                                ),
                                                Divider(
                                                  height: 16.0,
                                                  thickness: 1.0,
                                                  indent: 10.0,
                                                  endIndent: 10.0,
                                                  color: Color(0x4D1D4847),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.schedule_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 14.0,
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        FFAppState().duration2,
                                                        '0 ----- 0 ------',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            lineHeight: 1.27,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallIsCustom,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 24.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  borderRadius: BorderRadius.circular(20.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '7vmtt13m' /* التكلفة التقديرية */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily,
                                                color: Color(0x99F0F5F9),
                                                letterSpacing: 0.0,
                                                lineHeight: 1.38,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .labelMediumIsCustom,
                                              ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    FFAppState()
                                                        .spicealTripPrice
                                                        .toString(),
                                                    '000',
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            lineHeight: 1.25,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumIsCustom,
                                                          ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '5esiuvri' /* ل.س */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            lineHeight: 1.25,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumIsCustom,
                                                          ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          height: 16.0,
                                          thickness: 1.0,
                                          indent: 0.0,
                                          endIndent: 0.0,
                                          color: Color(0x1AF0F5F9),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'tscbt09y' /* السعر النهائي يؤكد بعد مراجعة ... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmallFamily,
                                                color: Color(0x80F0F5F9),
                                                letterSpacing: 0.0,
                                                lineHeight: 1.27,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmallIsCustom,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 56.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: FFButtonWidget(
                                  onPressed: (_model.booking != true)
                                      ? null
                                      : () async {
                                          _model.insertingSpecial =
                                              await BookingsTable().insert({
                                            'user_id': FFAppState().user.id,
                                            'trip_id':
                                                'df87b80c-cc75-42dc-9702-7b41e22c2035',
                                            'seats_num':
                                                FFAppState().car == true
                                                    ? 4
                                                    : 11,
                                            'name': FFAppState().user.name,
                                            'from': FFAppState().from,
                                            'to': FFAppState().to,
                                            'price':
                                                FFAppState().spicealTripPrice,
                                            'status': 0,
                                            'barcode': random_data.randomString(
                                              10,
                                              10,
                                              false,
                                              false,
                                              true,
                                            ),
                                            'date': supaSerialize<DateTime>(
                                                FFAppState().Departure),
                                            'phone': FFAppState().user.phone,
                                            'fromStation':
                                                FFAppState().upAddress,
                                            'toStation':
                                                FFAppState().downAddress,
                                            'returnDate': supaSerialize<
                                                    DateTime>(
                                                FFAppState().returnTime != null
                                                    ? FFAppState().returnTime
                                                    : FFAppState().Departure),
                                            'directions':
                                                FFAppState().directions,
                                          });
                                          _model.notify =
                                              await NotificationsTable()
                                                  .insert({
                                            'user_id': FFAppState().user.id,
                                            'title': 'تم حجز الرحلة الخاصة',
                                            'body':
                                                'تم حجز رحلة خاصة بتاريخ${FFAppState().Departure?.toString()}من ${FFAppState().from}إلى ${FFAppState().to}',
                                            'image':
                                                'https://i.ibb.co/tT2Q3MTJ/20250829-0041-Mobile-App-Icon-remix-01k3s9y9f1exw9tmyhe28wyqd3.png',
                                          });
                                          FFAppState().location = null;
                                          FFAppState().up = null;
                                          FFAppState().upAddress = '';
                                          FFAppState().delevery = 0.0;
                                          FFAppState().delevery2 = 0.0;
                                          FFAppState().distance = '';
                                          FFAppState().distination = null;
                                          FFAppState().duration = '';
                                          FFAppState().from = '';
                                          FFAppState().to = '';
                                          FFAppState().down = null;
                                          FFAppState().downAddress = '';
                                          FFAppState().directions = 1;
                                          FFAppState().Departure = null;
                                          FFAppState().returnTime = null;
                                          FFAppState().spicealTripPrice = 0;
                                          FFAppState().car = false;
                                          safeSetState(() {});

                                          context.goNamed(
                                              HomePageWidget.routeName);

                                          safeSetState(() {});
                                        },
                                  text: FFLocalizations.of(context).getText(
                                    'rd60b678' /* احجز الآن */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 56.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleSmallIsCustom,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(24.0),
                                    disabledColor:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 24.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
