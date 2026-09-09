import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/signpay/update/update_widget.dart';
import '/zcomponents/card_ads/card_ads_widget.dart';
import '/zcomponents/card_ashipp/card_ashipp_widget.dart';
import '/zcomponents/card_shipping/card_shipping_widget.dart';
import '/zcomponents/cardspi/cardspi_widget.dart';
import '/zcomponents/dialog/dialog_widget.dart';
import '/zcomponents/empty/empty_widget.dart';
import '/zcomponents/empty_shipping/empty_shipping_widget.dart';
import '/zcomponents/empty_tickets/empty_tickets_widget.dart';
import '/zcomponents/socialmedia/socialmedia_widget.dart';
import '/zcomponents/ticket/ticket_widget.dart';
import '/zcomponents/trip_card/trip_card_widget.dart';
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    super.key,
    this.phone,
    this.welcomeTrip,
    this.emptyTrips,
    int? tabIndex,
    this.update,
    this.android,
    this.apple,
    this.share,
  }) : this.tabIndex = tabIndex ?? 1;

  final String? phone;
  final List<TripsRow>? welcomeTrip;
  final AppRow? emptyTrips;
  final int tabIndex;
  final bool? update;
  final String? android;
  final String? apple;
  final String? share;

  static String routeName = 'HomePage';
  static String routePath = 'HomePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          if (widget.update == true) {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              isDismissible: false,
              enableDrag: false,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: Container(
                      height: 600.0,
                      child: UpdateWidget(
                        version: '2',
                        play: widget.android!,
                        app: widget.apple!,
                      ),
                    ),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));

            FFAppState().sharing = widget.share!;
            safeSetState(() {});
          }
        }),
        Future(() async {
          await UsersTable().update(
            data: {
              'fcm_token': FFAppState().fcmToken,
            },
            matchingRows: (rows) => rows.eqOrNull(
              'id',
              FFAppState().user.id,
            ),
          );
        }),
      ]);
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )
      ..addListener(() => safeSetState(() {}))
      ..addListener(() async {
        if (_model.tabBarController!.indexIsChanging) {
          return;
        }

        safeSetState(() {});
      });

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false)
          ..addListener(() => safeSetState(() {}));
    _model.newPhoneTextController ??= TextEditingController();
    _model.newPhoneFocusNode ??= FocusNode();

    _model.notesTextController ??= TextEditingController();
    _model.notesFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(115.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<UsersRow>>(
      future: FFAppState().userID(
        requestFn: () => UsersTable().querySingleRow(
          queryFn: (q) => q.eqOrNull(
            'phone',
            widget.phone,
          ),
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFadingCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<UsersRow> homePageUsersRowList = snapshot.data!;

        final homePageUsersRow =
            homePageUsersRowList.isNotEmpty ? homePageUsersRowList.first : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: PopScope(
            canPop: false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SafeArea(
                top: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: FutureBuilder<List<AppRow>>(
                        future: AppTable().querySingleRow(
                          queryFn: (q) => q,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitFadingCircle(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<AppRow> containerAppRowList = snapshot.data!;

                          final containerAppRow = containerAppRowList.isNotEmpty
                              ? containerAppRowList.first
                              : null;

                          return Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              children: [
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: [
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 58.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'bhlqtedi' /* احجز رحلتك */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallIsCustom,
                                                          ),
                                                    ),
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/Logo_transparent-2.png',
                                                      height: 58.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Opacity(
                                              opacity: 0.9,
                                              child: wrapWithModel(
                                                model: _model.cardAdsModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: CardAdsWidget(),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 44.0,
                                              decoration: BoxDecoration(),
                                              child: Opacity(
                                                opacity: 0.95,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Material(
                                                      color: Colors.transparent,
                                                      elevation: 8.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.33,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          controller: _model
                                                                  .fromTripValueController ??=
                                                              FormFieldController<
                                                                  String>(null),
                                                          options: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode ==
                                                                  'ar'
                                                              ? containerAppRow!
                                                                  .fromDrop
                                                              : containerAppRow!
                                                                  .fromDropEn,
                                                          onChanged: (val) =>
                                                              safeSetState(() =>
                                                                  _model.fromTripValue =
                                                                      val),
                                                          height: 40.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .notoKufiArabic(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'e1enemyh' /* من */,
                                                          ),
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 24.0,
                                                          ),
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          elevation: 2.0,
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderWidth: 1.0,
                                                          borderRadius: 16.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          hidesUnderline: true,
                                                          isOverButton: false,
                                                          isSearchable: false,
                                                          isMultiSelect: false,
                                                        ),
                                                      ),
                                                    ),
                                                    Material(
                                                      color: Colors.transparent,
                                                      elevation: 8.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.33,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          controller: _model
                                                                  .toTripValueController ??=
                                                              FormFieldController<
                                                                  String>(null),
                                                          options: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode ==
                                                                  'ar'
                                                              ? containerAppRow
                                                                  .toDrop
                                                              : containerAppRow
                                                                  .toDropEn,
                                                          onChanged: (val) =>
                                                              safeSetState(() =>
                                                                  _model.toTripValue =
                                                                      val),
                                                          height: 40.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .notoKufiArabic(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'z6dgmu5k' /* إلى */,
                                                          ),
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 24.0,
                                                          ),
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          elevation: 2.0,
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderWidth: 1.0,
                                                          borderRadius: 16.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          hidesUnderline: true,
                                                          isOverButton: false,
                                                          isSearchable: false,
                                                          isMultiSelect: false,
                                                        ),
                                                      ),
                                                    ),
                                                    Material(
                                                      color: Colors.transparent,
                                                      elevation: 8.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderRadius: 16.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          icon: Icon(
                                                            Icons
                                                                .calendar_month,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            final _datePickedDate =
                                                                await showDatePicker(
                                                              context: context,
                                                              barrierDismissible:
                                                                  false,
                                                              initialDate:
                                                                  getCurrentTimestamp,
                                                              firstDate:
                                                                  (getCurrentTimestamp ??
                                                                      DateTime(
                                                                          1900)),
                                                              lastDate:
                                                                  DateTime(
                                                                      2050),
                                                              builder: (context,
                                                                  child) {
                                                                return wrapInMaterialDatePickerTheme(
                                                                  context,
                                                                  child!,
                                                                  headerBackgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  headerForegroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  headerTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                        fontSize:
                                                                            32.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).headlineLargeIsCustom,
                                                                      ),
                                                                  pickerBackgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                  pickerForegroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  selectedDateTimeBackgroundColor:
                                                                      Color(
                                                                          0xFF2C3539),
                                                                  selectedDateTimeForegroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  actionButtonForegroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  iconSize:
                                                                      24.0,
                                                                );
                                                              },
                                                            );

                                                            if (_datePickedDate !=
                                                                null) {
                                                              safeSetState(() {
                                                                _model.datePicked =
                                                                    DateTime(
                                                                  _datePickedDate
                                                                      .year,
                                                                  _datePickedDate
                                                                      .month,
                                                                  _datePickedDate
                                                                      .day,
                                                                );
                                                              });
                                                            } else if (_model
                                                                    .datePicked !=
                                                                null) {
                                                              safeSetState(() {
                                                                _model.datePicked =
                                                                    getCurrentTimestamp;
                                                              });
                                                            }
                                                            if ((_model.fromTripValue != null && _model.fromTripValue != '') &&
                                                                (_model.toTripValue !=
                                                                        null &&
                                                                    _model.toTripValue !=
                                                                        '') &&
                                                                (_model.datePicked !=
                                                                    null)) {
                                                              _model.trips =
                                                                  await TripsTable()
                                                                      .queryRows(
                                                                queryFn: (q) => q
                                                                    .eqOrNull(
                                                                      'from',
                                                                      _model
                                                                          .fromTripValue,
                                                                    )
                                                                    .gtOrNull(
                                                                      'date',
                                                                      supaSerialize<
                                                                              DateTime>(
                                                                          _model
                                                                              .datePicked),
                                                                    )
                                                                    .eqOrNull(
                                                                      'to',
                                                                      _model
                                                                          .toTripValue,
                                                                    ),
                                                              );
                                                              FFAppState()
                                                                      .trip =
                                                                  FFAppState()
                                                                      .trip
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                              _model.up = '1';
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'خطأ'),
                                                                    content: Text(
                                                                        'يرجى تحديد الحقول الثلاثة'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'حسناً'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            }

                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Material(
                                                      color: Colors.transparent,
                                                      elevation: 8.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                          borderRadius: 16.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                          icon: Icon(
                                                            Icons.sos,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await launchUrl(Uri(
                                                              scheme: 'tel',
                                                              path:
                                                                  '+963998178034',
                                                            ));
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ]
                                                      .divide(
                                                          SizedBox(width: 6.0))
                                                      .around(
                                                          SizedBox(width: 6.0)),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            ),
                                            SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FutureBuilder<List<TripsRow>>(
                                                    future:
                                                        TripsTable().queryRows(
                                                      queryFn: (q) => q
                                                          .eqOrNull(
                                                            'toWelcome',
                                                            containerAppRow
                                                                .welcomeTo,
                                                          )
                                                          .gteOrNull(
                                                            'date',
                                                            supaSerialize<
                                                                    DateTime>(
                                                                getCurrentTimestamp),
                                                          ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                SpinKitFadingCircle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<TripsRow>
                                                          containerTripsRowList =
                                                          snapshot.data!;

                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Builder(
                                                          builder: (context) {
                                                            if ((_model.fromTripValue != null && _model.fromTripValue != '') &&
                                                                (_model.toTripValue !=
                                                                        null &&
                                                                    _model.toTripValue !=
                                                                        '') &&
                                                                (_model.datePicked !=
                                                                    null) &&
                                                                (_model.up !=
                                                                        null &&
                                                                    _model.up !=
                                                                        '')) {
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            9.0,
                                                                            0.0,
                                                                            9.0,
                                                                            0.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final tripsMain = _model
                                                                            .trips
                                                                            ?.sortedList(
                                                                                keyOf: (e) => e.vehicleSeats,
                                                                                desc: true)
                                                                            .toList() ??
                                                                        [];
                                                                    if (tripsMain
                                                                        .isEmpty) {
                                                                      return EmptyWidget();
                                                                    }

                                                                    return SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            tripsMain.length,
                                                                            (tripsMainIndex) {
                                                                          final tripsMainItem =
                                                                              tripsMain[tripsMainIndex];
                                                                          return Opacity(
                                                                            opacity:
                                                                                0.9,
                                                                            child:
                                                                                TripCardWidget(
                                                                              key: Key('Keyyb7_${tripsMainIndex}_of_${tripsMain.length}'),
                                                                              from: FFLocalizations.of(context).languageCode == 'ar' ? tripsMainItem.from : tripsMainItem.fromEn,
                                                                              to: FFLocalizations.of(context).languageCode == 'ar' ? tripsMainItem.to : tripsMainItem.toEn,
                                                                              time: dateTimeFormat(
                                                                                "EEEE",
                                                                                tripsMainItem.date!,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              date: dateTimeFormat(
                                                                                "M/d h:mm a",
                                                                                tripsMainItem.time!,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              seats: tripsMainItem.vehicleSeats,
                                                                              trip: tripsMainItem,
                                                                              cityList: containerAppRow.fromShipping,
                                                                              ltlng: containerAppRow.latlngGovrs,
                                                                              img: tripsMainItem.vehiclePhoto!,
                                                                            ),
                                                                          );
                                                                        }).divide(SizedBox(
                                                                            height:
                                                                                2.0)),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            } else {
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            9.0,
                                                                            0.0,
                                                                            9.0,
                                                                            0.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final tripsWelcome = containerTripsRowList
                                                                        .sortedList(
                                                                            keyOf: (e) =>
                                                                                e.vehicleSeats,
                                                                            desc: true)
                                                                        .toList();
                                                                    if (tripsWelcome
                                                                        .isEmpty) {
                                                                      return EmptyWidget();
                                                                    }

                                                                    return SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            tripsWelcome.length,
                                                                            (tripsWelcomeIndex) {
                                                                          final tripsWelcomeItem =
                                                                              tripsWelcome[tripsWelcomeIndex];
                                                                          return TripCardWidget(
                                                                            key:
                                                                                Key('Keyjf7_${tripsWelcomeIndex}_of_${tripsWelcome.length}'),
                                                                            from: FFLocalizations.of(context).languageCode == 'ar'
                                                                                ? tripsWelcomeItem.from
                                                                                : tripsWelcomeItem.fromEn,
                                                                            to: FFLocalizations.of(context).languageCode == 'ar'
                                                                                ? tripsWelcomeItem.to
                                                                                : tripsWelcomeItem.toEn,
                                                                            time:
                                                                                dateTimeFormat(
                                                                              "EEEE",
                                                                              tripsWelcomeItem.date!,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            date:
                                                                                dateTimeFormat(
                                                                              "M/d h:mm a",
                                                                              tripsWelcomeItem.time!,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            seats:
                                                                                tripsWelcomeItem.vehicleSeats,
                                                                            trip:
                                                                                tripsWelcomeItem,
                                                                            cityList:
                                                                                containerAppRow.fromShipping,
                                                                            ltlng:
                                                                                containerAppRow.latlngGovrs,
                                                                            img:
                                                                                tripsWelcomeItem.vehiclePhoto!,
                                                                          );
                                                                        }).divide(SizedBox(
                                                                            height:
                                                                                2.0)),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 3.0)),
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 58.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'q9vce6e4' /* تسليم خلال ساعات */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallIsCustom,
                                                          ),
                                                    ),
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/Logo_transparent-2.png',
                                                      height: 58.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.cardAshippModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: CardAshippWidget(
                                                sizes:
                                                    FFLocalizations.of(context)
                                                                .languageCode ==
                                                            'ar'
                                                        ? containerAppRow
                                                            .shippingSizes
                                                        : containerAppRow
                                                            .shippingsizesEn,
                                                prices: containerAppRow
                                                    .shipppingPrices,
                                                kmPrice: containerAppRow
                                                    .kmPriceShipping!,
                                                cityList:
                                                    FFLocalizations.of(context)
                                                                .languageCode ==
                                                            'ar'
                                                        ? containerAppRow
                                                            .fromShipping
                                                        : containerAppRow
                                                            .fromShippingEn,
                                                ltlng: containerAppRow
                                                    .latlngGovrs,
                                                branches: FFLocalizations.of(
                                                                context)
                                                            .languageCode ==
                                                        'ar'
                                                    ? containerAppRow.branches
                                                    : containerAppRow.branches,
                                                dollar: containerAppRow
                                                    .shipppingPricesDollar,
                                                euro: containerAppRow
                                                    .shipppingPricesEuro,
                                                pay: containerAppRow.pay!,
                                                categories:
                                                    FFLocalizations.of(context)
                                                                .languageCode ==
                                                            'ar'
                                                        ? containerAppRow
                                                            .categories
                                                        : containerAppRow
                                                            .categoriesEn,
                                                currency:
                                                    FFLocalizations.of(context)
                                                                .languageCode ==
                                                            'ar'
                                                        ? containerAppRow
                                                            .currencyAR
                                                        : containerAppRow
                                                            .currency,
                                                cityListAR: containerAppRow
                                                    .fromShipping,
                                              ),
                                            ),
                                            Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.55,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: FutureBuilder<
                                                    List<ShippingRow>>(
                                                  future:
                                                      ShippingTable().queryRows(
                                                    queryFn: (q) =>
                                                        q.orGroupOrNull(
                                                            orFilterGroup([
                                                      orFilterLeaf(
                                                          'sender',
                                                          'eq',
                                                          FFAppState().user.id),
                                                      orFilterLeaf(
                                                          'recipientID',
                                                          'eq',
                                                          FFAppState().user.id),
                                                    ], isAnd: false)),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              SpinKitFadingCircle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<ShippingRow>
                                                        columnShippingRowList =
                                                        snapshot.data!;

                                                    if (columnShippingRowList
                                                        .isEmpty) {
                                                      return EmptyShippingWidget();
                                                    }

                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            columnShippingRowList
                                                                .length,
                                                            (columnIndex) {
                                                          final columnShippingRow =
                                                              columnShippingRowList[
                                                                  columnIndex];
                                                          return CardShippingWidget(
                                                            key: Key(
                                                                'Key4gg_${columnIndex}_of_${columnShippingRowList.length}'),
                                                            recipent:
                                                                columnShippingRow
                                                                    .recipientName!,
                                                            from:
                                                                columnShippingRow
                                                                    .from!,
                                                            to: columnShippingRow
                                                                .to!,
                                                            price:
                                                                columnShippingRow
                                                                    .price!,
                                                            state:
                                                                columnShippingRow
                                                                    .status!
                                                                    .toString(),
                                                            oppositePay:
                                                                columnShippingRow
                                                                    .payment!,
                                                            status:
                                                                columnShippingRow
                                                                    .status!,
                                                            size:
                                                                columnShippingRow
                                                                    .size!,
                                                            shipping:
                                                                columnShippingRow,
                                                            otlob:
                                                                columnShippingRow
                                                                    .otlob,
                                                            id: columnShippingRow
                                                                .id,
                                                            time: columnShippingRow
                                                                .deliveryDate!,
                                                            pay:
                                                                containerAppRow
                                                                    .pay!,
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                        ShippingInfoWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'kmPrice':
                                                              serializeParam(
                                                            containerAppRow
                                                                .kmPriceShipping
                                                                ?.toDouble(),
                                                            ParamType.double,
                                                          ),
                                                          'sizes':
                                                              serializeParam(
                                                            FFLocalizations.of(
                                                                            context)
                                                                        .languageCode ==
                                                                    'ar'
                                                                ? containerAppRow
                                                                    .shippingSizes
                                                                : containerAppRow
                                                                    .shippingsizesEn,
                                                            ParamType.String,
                                                            isList: true,
                                                          ),
                                                          'prices':
                                                              serializeParam(
                                                            containerAppRow
                                                                .shipppingPrices,
                                                            ParamType.double,
                                                            isList: true,
                                                          ),
                                                          'from':
                                                              serializeParam(
                                                            FFLocalizations.of(
                                                                            context)
                                                                        .languageCode ==
                                                                    'ar'
                                                                ? containerAppRow
                                                                    .fromShipping
                                                                : containerAppRow
                                                                    .fromShippingEn,
                                                            ParamType.String,
                                                            isList: true,
                                                          ),
                                                          'branches':
                                                              serializeParam(
                                                            containerAppRow
                                                                .branches,
                                                            ParamType.String,
                                                            isList: true,
                                                          ),
                                                          'pay': serializeParam(
                                                            containerAppRow
                                                                .pay,
                                                            ParamType.bool,
                                                          ),
                                                          'ltlng':
                                                              serializeParam(
                                                            containerAppRow
                                                                .latlngGovrs,
                                                            ParamType.String,
                                                            isList: true,
                                                          ),
                                                          'dollar':
                                                              serializeParam(
                                                            containerAppRow
                                                                .shipppingPricesDollar,
                                                            ParamType.double,
                                                            isList: true,
                                                          ),
                                                          'euro':
                                                              serializeParam(
                                                            containerAppRow
                                                                .shipppingPricesEuro,
                                                            ParamType.double,
                                                            isList: true,
                                                          ),
                                                          'currency':
                                                              serializeParam(
                                                            FFLocalizations.of(
                                                                            context)
                                                                        .languageCode ==
                                                                    'ar'
                                                                ? containerAppRow
                                                                    .currencyAR
                                                                : containerAppRow
                                                                    .currency,
                                                            ParamType.String,
                                                            isList: true,
                                                          ),
                                                          'cityList':
                                                              serializeParam(
                                                            containerAppRow
                                                                .fromShipping,
                                                            ParamType.String,
                                                            isList: true,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'fvgcn4re' /* إرسال */,
                                                    ),
                                                    icon: Icon(
                                                      Icons.upload_outlined,
                                                      size: 20.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.94,
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xFF1D4847),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmallIsCustom,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 3.0)),
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 58.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'hwef8cxh' /* بلقاء معك  */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallIsCustom,
                                                          ),
                                                    ),
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/Logo_transparent-2.png',
                                                      height: 58.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.cardspiModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: CardspiWidget(),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Opacity(
                                                opacity: 0.95,
                                                child: Wrap(
                                                  spacing: 16.0,
                                                  runSpacing: 8.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          SpicealTripWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'specialTrip':
                                                                serializeParam(
                                                              containerAppRow
                                                                  .specialTripPrice,
                                                              ParamType.int,
                                                            ),
                                                            'citylist':
                                                                serializeParam(
                                                              containerAppRow
                                                                  .fromShipping,
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                            'ltlng':
                                                                serializeParam(
                                                              containerAppRow
                                                                  .latlngGovrs,
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                            'title':
                                                                serializeParam(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                                arText:
                                                                    'رحلة خاصة',
                                                                enText:
                                                                    'Special trip',
                                                              ),
                                                              ParamType.String,
                                                            ),
                                                            'directions':
                                                                serializeParam(
                                                              containerAppRow
                                                                  .field2directions,
                                                              ParamType.double,
                                                            ),
                                                            'specialTripVan':
                                                                serializeParam(
                                                              containerAppRow
                                                                  .specialTripPriceVan,
                                                              ParamType.double,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.45,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                              child:
                                                                  Image.network(
                                                                'https://i.pinimg.com/736x/b7/b5/5a/b7b55a5b429e2f395df2206380be2020.jpg',
                                                                width: double
                                                                    .infinity,
                                                                height: 200.0,
                                                                fit: BoxFit
                                                                    .fitHeight,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          2.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'l82e1cl8' /* رحلة خاصة */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              font: GoogleFonts.notoKufiArabic(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          SpicealTripWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'specialTrip':
                                                                serializeParam(
                                                              containerAppRow
                                                                  .specialTripVip,
                                                              ParamType.int,
                                                            ),
                                                            'citylist':
                                                                serializeParam(
                                                              FFLocalizations.of(
                                                                              context)
                                                                          .languageCode ==
                                                                      'ar'
                                                                  ? containerAppRow
                                                                      .fromShipping
                                                                  : containerAppRow
                                                                      .fromShippingEn,
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                            'ltlng':
                                                                serializeParam(
                                                              containerAppRow
                                                                  .latlngGovrs,
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                            'title':
                                                                serializeParam(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                                arText:
                                                                    'VIP رحلة خاصة',
                                                                enText:
                                                                    'Special trip VIP',
                                                              ),
                                                              ParamType.String,
                                                            ),
                                                            'directions':
                                                                serializeParam(
                                                              containerAppRow
                                                                  .field2directions,
                                                              ParamType.double,
                                                            ),
                                                            'specialTripVan':
                                                                serializeParam(
                                                              containerAppRow
                                                                  .specialTripPriceVan,
                                                              ParamType.double,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.45,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                              child:
                                                                  Image.network(
                                                                'https://www.hyundai.com/content/dam/hyundai/ww/en/images/find-a-car/pip/commercial/h-1/h1-tq-design-kv-m.jpg',
                                                                width: double
                                                                    .infinity,
                                                                height: 200.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          2.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'ivpnih1m' /* رحلة خاصة  */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                font: GoogleFonts.notoKufiArabic(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            '76vok5oo' /* VIP */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.notoKufiArabic(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          ServiceWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'service':
                                                                serializeParam(
                                                              ServiceStruct(
                                                                type: FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                  arText:
                                                                      'رافعة سطحة',
                                                                  enText:
                                                                      'Flatbed crane',
                                                                ),
                                                                description:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                  arText:
                                                                      'نقل سيارتك بأمان وموثوقية، من موقعك إلى وجهتك.',
                                                                  enText:
                                                                      'Transport your vehicle safely and reliably, from your location to your destination.',
                                                                ),
                                                                image:
                                                                    'https://i.ibb.co/TBM2q1W8/images-33.jpg',
                                                                price: FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                  arText:
                                                                      'ابتداءً من 50 \$ داخل المدينة',
                                                                  enText:
                                                                      'Starting from \$50 within the city',
                                                                ),
                                                              ),
                                                              ParamType
                                                                  .DataStruct,
                                                            ),
                                                            'price':
                                                                serializeParam(
                                                              containerAppRow
                                                                  .kmPriceTravell
                                                                  ?.toDouble(),
                                                              ParamType.double,
                                                            ),
                                                            'letter':
                                                                serializeParam(
                                                              'https://wa.me/963939253326?text=السلام%20عليكم%20ورحمة%20الله%20وبركاته%0Aأرغب%20بطلب%20خدمة%20سطحة%20لنقل%20سيارة.%0A%0Aموقع%20استلام%20السيارة:%0Aالوجهة:%0Aنوع%20السيارة:%0Aموعد%20النقل:%0A%0Aأرجو%20تزويدي%20بالتكلفة%20والتفاصيل.%0Aشكراً%20لكم.',
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.45,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/RSshutterstock_1560724700-640w.jpg.webp',
                                                                width: double
                                                                    .infinity,
                                                                height: 210.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          2.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'cgb5q8gh' /* رافعة سطحة */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.notoKufiArabic(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          ServiceWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'service':
                                                                serializeParam(
                                                              ServiceStruct(
                                                                type: FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                  arText:
                                                                      'تحميل وتفريغ',
                                                                  enText:
                                                                      'Loading goods',
                                                                ),
                                                                description:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                  arText:
                                                                      'نوفر لك خدمة تحميل وتفريغ احترافية للعفش والبضائع، بعناية وسرعة من البداية حتى النهاية.',
                                                                  enText:
                                                                      'We provide you with a professional loading and unloading service for furniture and goods, with care and speed from start to finish.',
                                                                ),
                                                                image:
                                                                    'https://i.ibb.co/tTbKPfwY/1692ea48-29c5-4e94-9615-fba8551d9174.png',
                                                                price: FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                  arText:
                                                                      'ابتداءً من 1000 ل.س',
                                                                  enText:
                                                                      'Starting from 1000 New S.P',
                                                                ),
                                                              ),
                                                              ParamType
                                                                  .DataStruct,
                                                            ),
                                                            'price':
                                                                serializeParam(
                                                              containerAppRow
                                                                  .kmPriceTravell
                                                                  ?.toDouble(),
                                                              ParamType.double,
                                                            ),
                                                            'letter':
                                                                serializeParam(
                                                              'https://wa.me/963939253326?text=السلام%20عليكم%20ورحمة%20الله%20وبركاته%0Aأرغب%20بطلب%20خدمة%20تحميل%20وتفريغ%20العفش%20والبضائع.%0A%0Aموقع%20الخدمة:%0Aنوع%20العفش%20أو%20البضائع:%0Aموعد%20الخدمة:%0Aتفاصيل%20إضافية:%0A%0Aأرجو%20تزويدي%20بالتكلفة%20والتفاصيل.%0Aشكراً%20لكم.',
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.45,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/best-furniture-moving-with-low-cost.webp',
                                                                width: double
                                                                    .infinity,
                                                                height: 210.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          2.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'oakdiqwk' /* تحميل وتفريغ */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.notoKufiArabic(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ],
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
                                          ].divide(SizedBox(height: 3.0)),
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 58.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'p330vmxy' /* حجوزاتك معنا */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallIsCustom,
                                                          ),
                                                    ),
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/Logo_transparent-2.png',
                                                      height: 58.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.83,
                                              decoration: BoxDecoration(),
                                              child: Opacity(
                                                opacity: 0.95,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<BookingsRow>>(
                                                    stream: _model
                                                            .listViewSupabaseStream ??=
                                                        SupaFlow.client
                                                            .from("bookings")
                                                            .stream(
                                                                primaryKey: [
                                                                  'id'
                                                                ])
                                                            .eqOrNull(
                                                              'user_id',
                                                              FFAppState()
                                                                  .user
                                                                  .id,
                                                            )
                                                            .map((list) => list
                                                                .map((item) =>
                                                                    BookingsRow(
                                                                        item))
                                                                .toList()),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                SpinKitFadingCircle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<BookingsRow>
                                                          listViewBookingsRowList =
                                                          snapshot.data!;

                                                      if (listViewBookingsRowList
                                                          .isEmpty) {
                                                        return EmptyTicketsWidget();
                                                      }

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewBookingsRowList
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 4.0),
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewBookingsRow =
                                                              listViewBookingsRowList[
                                                                  listViewIndex];
                                                          return TicketWidget(
                                                            key: Key(
                                                                'Key49j_${listViewIndex}_of_${listViewBookingsRowList.length}'),
                                                            state:
                                                                listViewBookingsRow
                                                                    .status,
                                                            from:
                                                                listViewBookingsRow
                                                                    .from,
                                                            to: listViewBookingsRow
                                                                .to,
                                                            fromS:
                                                                listViewBookingsRow
                                                                    .fromStation,
                                                            toS:
                                                                listViewBookingsRow
                                                                    .toStation,
                                                            price:
                                                                listViewBookingsRow
                                                                    .price,
                                                            seats:
                                                                listViewBookingsRow
                                                                    .seatsNum,
                                                            time:
                                                                listViewBookingsRow
                                                                    .date,
                                                            booking:
                                                                listViewBookingsRow,
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 3.0)),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.91,
                                            constraints: BoxConstraints(
                                              maxWidth: 670.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 12.0,
                                                  color: Color(0x1E000000),
                                                  offset: Offset(
                                                    0.0,
                                                    5.0,
                                                  ),
                                                )
                                              ],
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  height: 58.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'qzd1z2sr' /* طابت أوقاتكم */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmallIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                  NotifyWidget
                                                                      .routeName);
                                                            },
                                                            child: Stack(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/Logo_transparent-2.png',
                                                                    height:
                                                                        56.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: badges
                                                                      .Badge(
                                                                    badgeContent:
                                                                        Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'isgo2l7p' /*   */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                Colors.white,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                          ),
                                                                    ),
                                                                    showBadge:
                                                                        true,
                                                                    shape: badges
                                                                        .BadgeShape
                                                                        .circle,
                                                                    badgeColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    elevation:
                                                                        4.0,
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            4.0),
                                                                    position: badges
                                                                            .BadgePosition
                                                                        .topEnd(),
                                                                    animationType: badges
                                                                        .BadgeAnimationType
                                                                        .scale,
                                                                    toAnimate:
                                                                        true,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          11.0, 0.0, 11.0, 0.0),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      FFAppState()
                                                                          .user
                                                                          .name,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                20.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                                                          ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          FFAppState()
                                                                              .user
                                                                              .phone,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 8.0)),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 12.0)),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      3.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                    ),
                                                                    child:
                                                                        FlutterFlowLanguageSelector(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          40.0,
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      dropdownIconColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      borderRadius:
                                                                          16.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                          ),
                                                                      hideFlags:
                                                                          true,
                                                                      flagSize:
                                                                          24.0,
                                                                      flagTextGap:
                                                                          8.0,
                                                                      currentLanguage:
                                                                          FFLocalizations.of(context)
                                                                              .languageCode,
                                                                      languages:
                                                                          FFLocalizations
                                                                              .languages(),
                                                                      onChanged: (lang) => setAppLanguage(
                                                                          context,
                                                                          lang),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      3.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                    ),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderRadius:
                                                                          16.0,
                                                                      buttonSize:
                                                                          40.0,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .call,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        await launchUrl(
                                                                            Uri(
                                                                          scheme:
                                                                              'tel',
                                                                          path:
                                                                              containerAppRow.phone!,
                                                                        ));
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ],
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 3.0,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 56.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            4.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          setDarkModeSetting(
                                                                              context,
                                                                              ThemeMode.light);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              115.0,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: Theme.of(context).brightness == Brightness.light
                                                                                ? FlutterFlowTheme.of(context).secondaryBackground
                                                                                : FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: valueOrDefault<Color>(
                                                                                Theme.of(context).brightness == Brightness.light ? FlutterFlowTheme.of(context).alternate : FlutterFlowTheme.of(context).primaryBackground,
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                              ),
                                                                              width: 1.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.wb_sunny_rounded,
                                                                                color: Theme.of(context).brightness == Brightness.light ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 16.0,
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '9hwtrvz0' /* مظهر فاتح */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: Theme.of(context).brightness == Brightness.light ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          setDarkModeSetting(
                                                                              context,
                                                                              ThemeMode.dark);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              115.0,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: Theme.of(context).brightness == Brightness.dark
                                                                                ? FlutterFlowTheme.of(context).secondaryBackground
                                                                                : FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: valueOrDefault<Color>(
                                                                                Theme.of(context).brightness == Brightness.dark ? FlutterFlowTheme.of(context).alternate : FlutterFlowTheme.of(context).primaryBackground,
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                              ),
                                                                              width: 1.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.nightlight_round,
                                                                                color: Theme.of(context).brightness == Brightness.dark ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 16.0,
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'c9bh2tay' /* مظهر داكن */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: Theme.of(context).brightness == Brightness.dark ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ).animateOnActionTrigger(
                                                                        animationsMap[
                                                                            'containerOnActionTriggerAnimation']!,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      1.0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 3.0,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                color: Color(
                                                                    0x00000000),
                                                                child:
                                                                    ExpandableNotifier(
                                                                  controller: _model
                                                                      .expandableExpandableController,
                                                                  child:
                                                                      ExpandablePanel(
                                                                    header:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(12.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'r1bdjk15' /* تعديل المعلومات الشخصية */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    font: GoogleFonts.notoKufiArabic(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    collapsed:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              0.1,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    expanded:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children:
                                                                            [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                1.0,
                                                                                0.0),
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.newPhoneTextController,
                                                                              focusNode: _model.newPhoneFocusNode,
                                                                              autofocus: false,
                                                                              enabled: true,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                isDense: true,
                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  '5onp0k8v' /* رقم الهاتف الجديد */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                    ),
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    width: 0.3,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(18.0),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 0.3,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(18.0),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    width: 0.3,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(18.0),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    width: 0.3,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(18.0),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(12.0, 40.0, 0.0, 0.0),
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                              keyboardType: TextInputType.phone,
                                                                              cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                              enableInteractiveSelection: true,
                                                                              validator: _model.newPhoneTextControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                          Builder(
                                                                            builder: (context) =>
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                FFAppState().updateUserStruct(
                                                                                  (e) => e..phone = _model.newPhoneTextController.text,
                                                                                );
                                                                                _model.otpNew = await OtpCall.call(
                                                                                  phone: _model.newPhoneTextController.text,
                                                                                  code: FFAppState().user.code,
                                                                                );

                                                                                if ((_model.otpNew?.succeeded ?? true)) {
                                                                                  await UsersTable().update(
                                                                                    data: {
                                                                                      'phone': _model.newPhoneTextController.text,
                                                                                    },
                                                                                    matchingRows: (rows) => rows.eqOrNull(
                                                                                      'id',
                                                                                      FFAppState().user.id,
                                                                                    ),
                                                                                  );

                                                                                  context.pushNamed(
                                                                                    CodeWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'phone': serializeParam(
                                                                                        _model.newPhoneTextController.text,
                                                                                        ParamType.String,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                } else {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (dialogContext) {
                                                                                      return Dialog(
                                                                                        elevation: 0,
                                                                                        insetPadding: EdgeInsets.zero,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                        child: GestureDetector(
                                                                                          onTap: () {
                                                                                            FocusScope.of(dialogContext).unfocus();
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
                                                                                          child: Container(
                                                                                            height: MediaQuery.sizeOf(context).height * 0.34,
                                                                                            child: DialogWidget(
                                                                                              title: FFLocalizations.of(context).getVariableText(
                                                                                                arText: 'خطأ',
                                                                                                enText: 'Errror',
                                                                                              ),
                                                                                              text: FFLocalizations.of(context).getVariableText(
                                                                                                arText: 'يرجى إدخال رقم الهاتف مع رمز الدولة بشكل صحيح',
                                                                                                enText: 'Please enter your phone number with the country code correctly.',
                                                                                              ),
                                                                                              confirm: FFLocalizations.of(context).getVariableText(
                                                                                                arText: 'حسناً',
                                                                                                enText: 'OK',
                                                                                              ),
                                                                                              dismessVis: false,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                }

                                                                                safeSetState(() {});
                                                                              },
                                                                              text: FFLocalizations.of(context).getText(
                                                                                '9mcrj7dt' /* تحقق */,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 8.0)).addToEnd(SizedBox(height: 8.0)),
                                                                      ),
                                                                    ),
                                                                    theme:
                                                                        ExpandableThemeData(
                                                                      tapHeaderToExpand:
                                                                          true,
                                                                      tapBodyToExpand:
                                                                          false,
                                                                      tapBodyToCollapse:
                                                                          false,
                                                                      headerAlignment:
                                                                          ExpandablePanelHeaderAlignment
                                                                              .center,
                                                                      hasIcon:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'n0qb8n36' /* تقديم شكوى أو استفسار: */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .labelLargeIsCustom,
                                                                  ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        if (_model.notesTextController.text !=
                                                                                '') {
                                                                          await NotesTable()
                                                                              .insert({
                                                                            'userID':
                                                                                FFAppState().user.id,
                                                                            'note':
                                                                                _model.notesTextController.text,
                                                                          });
                                                                          safeSetState(
                                                                              () {
                                                                            _model.notesTextController?.clear();
                                                                          });
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Dialog(
                                                                                elevation: 0,
                                                                                insetPadding: EdgeInsets.zero,
                                                                                backgroundColor: Colors.transparent,
                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(dialogContext).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: Container(
                                                                                    height: MediaQuery.sizeOf(context).height * 0.37,
                                                                                    child: DialogWidget(
                                                                                      title: FFLocalizations.of(context).getVariableText(
                                                                                        arText: 'شكراً لاهتمامكم',
                                                                                        enText: 'Thank you for your attention.',
                                                                                      ),
                                                                                      text: FFLocalizations.of(context).getVariableText(
                                                                                        arText: 'نحرص على متابعة ملاحظاتكم، وسيتم التواصل معكم في أقرب وقت ممكن. شكرًا لتواصلكم معنا.',
                                                                                        enText: 'We value your feedback and will contact you as soon as possible. Thank you for contacting us.',
                                                                                      ),
                                                                                      confirm: FFLocalizations.of(context).getVariableText(
                                                                                        arText: 'حسناً',
                                                                                        enText: 'OK',
                                                                                      ),
                                                                                      dismessVis: false,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        } else {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Dialog(
                                                                                elevation: 0,
                                                                                insetPadding: EdgeInsets.zero,
                                                                                backgroundColor: Colors.transparent,
                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(dialogContext).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: Container(
                                                                                    height: MediaQuery.sizeOf(context).height * 0.32,
                                                                                    child: DialogWidget(
                                                                                      title: FFLocalizations.of(context).getVariableText(
                                                                                        arText: 'خطأ',
                                                                                        enText: 'Error',
                                                                                      ),
                                                                                      text: FFLocalizations.of(context).getVariableText(
                                                                                        arText: 'املأ الحقل بالأسفل لإرسال ملاحظة',
                                                                                        enText: 'Fill in the field below to send a note',
                                                                                      ),
                                                                                      confirm: FFLocalizations.of(context).getVariableText(
                                                                                        arText: 'حسناً',
                                                                                        enText: 'OK',
                                                                                      ),
                                                                                      dismessVis: false,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        }
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '0kby43lq' /* إرسال */,
                                                                      ),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .send_outlined,
                                                                        size:
                                                                            15.0,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            40.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: Color(
                                                                            0xFF1D4847),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: Colors.white,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 3.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Container(
                                                            height: 56.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          1.0,
                                                                          0.0),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .notesTextController,
                                                                focusNode: _model
                                                                    .notesFocusNode,
                                                                autofocus:
                                                                    false,
                                                                enabled: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  isDense: true,
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                      ),
                                                                  hintText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '5aqze5x8' /* أقترح تطوير الخدمة من خلال ... */,
                                                                  ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  filled: true,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  contentPadding:
                                                                      EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          40.0,
                                                                          12.0,
                                                                          0.0),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                                cursorColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                enableInteractiveSelection:
                                                                    true,
                                                                validator: _model
                                                                    .notesTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Builder(
                                                          builder: (context) =>
                                                              FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.32,
                                                                        child:
                                                                            DialogWidget(
                                                                          title:
                                                                              FFLocalizations.of(context).getVariableText(
                                                                            arText:
                                                                                'تسجيل الخروج',
                                                                            enText:
                                                                                'Log out',
                                                                          ),
                                                                          text:
                                                                              FFLocalizations.of(context).getVariableText(
                                                                            arText:
                                                                                'هل تريد فعلاً تسجيل الخروج؟',
                                                                            enText:
                                                                                'Do you really want to log out?',
                                                                          ),
                                                                          confirm:
                                                                              FFLocalizations.of(context).getVariableText(
                                                                            arText:
                                                                                'تأكيد',
                                                                            enText:
                                                                                'confirm',
                                                                          ),
                                                                          dismessVis:
                                                                              true,
                                                                          dismess:
                                                                              FFLocalizations.of(context).getVariableText(
                                                                            arText:
                                                                                'إلغاء',
                                                                            enText:
                                                                                'cancel',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(() =>
                                                                      _model.logoutdialog =
                                                                          value));

                                                              if (_model
                                                                      .logoutdialog ==
                                                                  true) {
                                                                await UsersTable()
                                                                    .update(
                                                                  data: {
                                                                    'status': 2,
                                                                  },
                                                                  matchingRows:
                                                                      (rows) =>
                                                                          rows.eqOrNull(
                                                                    'id',
                                                                    homePageUsersRow
                                                                        ?.id,
                                                                  ),
                                                                );
                                                                FFAppState()
                                                                        .user =
                                                                    UserStruct();

                                                                context.goNamed(
                                                                    SignupWidget
                                                                        .routeName);
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'ycd7bcfe' /* تسجيل الخروج */,
                                                            ),
                                                            icon: Icon(
                                                              Icons
                                                                  .logout_sharp,
                                                              size: 15.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.94,
                                                              height: 40.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                          ),
                                                        ),
                                                        Builder(
                                                          builder: (context) =>
                                                              FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.42,
                                                                        child:
                                                                            DialogWidget(
                                                                          title:
                                                                              FFLocalizations.of(context).getVariableText(
                                                                            arText:
                                                                                'حذف الحساب',
                                                                            enText:
                                                                                'Delete account',
                                                                          ),
                                                                          text:
                                                                              FFLocalizations.of(context).getVariableText(
                                                                            arText:
                                                                                'سيتم إغلاق حسابك وحذف بياناتك الشخصية، مع الاحتفاظ بسجلات الرحلات السابقة لأغراض أمنية وتنظيمية وفقاً للقانون.',
                                                                            enText:
                                                                                'Your account will be closed and your personal data deleted, while records of previous trips will be retained for security and regulatory purposes in accordance with the law.',
                                                                          ),
                                                                          confirm:
                                                                              FFLocalizations.of(context).getVariableText(
                                                                            arText:
                                                                                'تأكيد',
                                                                            enText:
                                                                                'confirm',
                                                                          ),
                                                                          dismessVis:
                                                                              true,
                                                                          dismess:
                                                                              FFLocalizations.of(context).getVariableText(
                                                                            arText:
                                                                                'إلغاء',
                                                                            enText:
                                                                                'cancel',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(() =>
                                                                      _model.deleteAccount0 =
                                                                          value));

                                                              if (_model
                                                                      .deleteAccount0 ==
                                                                  true) {
                                                                await UsersTable()
                                                                    .update(
                                                                  data: {
                                                                    'status': 2,
                                                                  },
                                                                  matchingRows:
                                                                      (rows) =>
                                                                          rows.eqOrNull(
                                                                    'id',
                                                                    homePageUsersRow
                                                                        ?.id,
                                                                  ),
                                                                );
                                                                FFAppState()
                                                                        .user =
                                                                    UserStruct();

                                                                context.goNamed(
                                                                    SignupWidget
                                                                        .routeName);
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'gcmi4jw8' /* حذف الحساب */,
                                                            ),
                                                            icon: Icon(
                                                              Icons.delete,
                                                              size: 15.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.94,
                                                              height: 40.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'qcngxw3b' /* تقدمه */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await launchURL(
                                                                    containerAppRow
                                                                        .valor!);
                                                              },
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'eou0o7la' /* VALOR */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'lpzl4k5x' /* للبرمجيات */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                        wrapWithModel(
                                                          model: _model
                                                              .socialmediaModel,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              SocialmediaWidget(
                                                            site:
                                                                containerAppRow
                                                                    .siteUrl!,
                                                          ),
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              height: 24.0))
                                                          .addToStart(SizedBox(
                                                              height: 12.0)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation']!),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(0.0, 0),
                                  child: FlutterFlowButtonTabBar(
                                    useToggleButtonStyle: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          font: GoogleFonts.notoKufiArabic(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                        ),
                                    unselectedLabelStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              font: GoogleFonts.notoKufiArabic(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontStyle,
                                              ),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontStyle,
                                            ),
                                    labelColor:
                                        FlutterFlowTheme.of(context).info,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    unselectedBackgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
                                    unselectedBorderColor:
                                        FlutterFlowTheme.of(context).error,
                                    borderWidth: 0.0,
                                    borderRadius: 16.0,
                                    elevation: 3.0,
                                    buttonMargin:
                                        EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 12.0),
                                    tabs: [
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'h7gtgjr2' /* رحلات */,
                                        ),
                                        icon: FaIcon(
                                          FontAwesomeIcons.shuttleVan,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'z3nc4uyn' /* شحن */,
                                        ),
                                        icon: FaIcon(
                                          FontAwesomeIcons.cubes,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '3h4yxkrk' /* طلب خاص */,
                                        ),
                                        icon: FaIcon(
                                          FontAwesomeIcons.route,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'h37j4ix6' /* التذاكر */,
                                        ),
                                        icon: FaIcon(
                                          FontAwesomeIcons.ticketAlt,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'z09ql2qe' /* حسابي */,
                                        ),
                                        icon: Icon(
                                          Icons.person,
                                        ),
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                    onTap: (i) async {
                                      [
                                        () async {},
                                        () async {},
                                        () async {},
                                        () async {},
                                        () async {}
                                      ][i]();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
