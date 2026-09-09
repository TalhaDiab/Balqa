import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/zcomponents/dialog/dialog_widget.dart';
import '/zcomponents/ticket_card/ticket_card_widget.dart';
import '/index.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'trip_pay_model.dart';
export 'trip_pay_model.dart';

class TripPayWidget extends StatefulWidget {
  const TripPayWidget({
    super.key,
    required this.status,
    this.booking,
    required this.bookingRow,
    this.tripid,
  });

  final int? status;
  final int? booking;
  final BookingsRow? bookingRow;
  final String? tripid;

  static String routeName = 'tripPay';
  static String routePath = 'tripPay';

  @override
  State<TripPayWidget> createState() => _TripPayWidgetState();
}

class _TripPayWidgetState extends State<TripPayWidget> {
  late TripPayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TripPayModel());

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: true)
          ..addListener(() => safeSetState(() {}));
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: true)
          ..addListener(() => safeSetState(() {}));
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.payFieldTextController ??= TextEditingController();
    _model.payFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      safeSetState(() {
        _model.textController1?.clear();
        _model.payFieldTextController?.clear();
      });
    }();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<DiscountCodesRow>>(
      future: DiscountCodesTable().queryRows(
        queryFn: (q) => q,
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
        List<DiscountCodesRow> tripPayDiscountCodesRowList = snapshot.data!;

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
              appBar: PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuery.sizeOf(context).height * 0.068),
                child: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  automaticallyImplyLeading: false,
                  leading: Builder(
                    builder: (context) => FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.share_outlined,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        await Share.share(
                          'https://balqa-share.eshadahsy.workers.dev',
                          sharePositionOrigin: getWidgetBoundingBox(context),
                        );
                      },
                    ),
                  ),
                  title: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 13.0, 0.0, 13.0),
                    child: Text(
                      () {
                        if (widget.status == 0) {
                          return FFLocalizations.of(context).getVariableText(
                            arText: 'قيد المعالجة',
                            enText: 'In processing',
                          );
                        } else if (widget.status == 1) {
                          return FFLocalizations.of(context).getVariableText(
                            arText: 'تم تأكيد الحجز',
                            enText: 'Confirmed',
                          );
                        } else if (widget.status == 2) {
                          return FFLocalizations.of(context).getVariableText(
                            arText: 'في الطريق',
                            enText: 'On way',
                          );
                        } else {
                          return FFLocalizations.of(context).getVariableText(
                            arText: 'انتهت الرحلة',
                            enText: 'Finished',
                          );
                        }
                      }(),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .headlineMediumIsCustom,
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
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                  ),
                  centerTitle: true,
                  elevation: 2.0,
                ),
              ),
              body: SafeArea(
                top: true,
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.93,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.network(
                        '',
                      ).image,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FutureBuilder<List<BookingsRow>>(
                                    future: BookingsTable().querySingleRow(
                                      queryFn: (q) => q.eqOrNull(
                                        'id',
                                        FFAppState().booking,
                                      ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: SpinKitFadingCircle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<BookingsRow> cardBookingsRowList =
                                          snapshot.data!;

                                      final cardBookingsRow =
                                          cardBookingsRowList.isNotEmpty
                                              ? cardBookingsRowList.first
                                              : null;

                                      return Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 1.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: wrapWithModel(
                                          model: _model.ticketCardModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: TicketCardWidget(
                                            from: widget.bookingRow!.from!,
                                            to: widget.bookingRow!.to!,
                                            up: widget
                                                .bookingRow!.fromStation!,
                                            down:
                                                widget.bookingRow!.toStation!,
                                            barcode:
                                                widget.bookingRow!.barcode!,
                                            state: widget.bookingRow!.status!,
                                            name: widget.bookingRow!.name!,
                                            phone: widget.bookingRow!.phone!,
                                            seats:
                                                widget.bookingRow!.seatsNum!,
                                            price: widget.bookingRow!.price!
                                                .toString(),
                                            date: widget.bookingRow!.date!,
                                            duration:
                                                widget.bookingRow!.duration!,
                                            directions:
                                                widget.bookingRow!.directions!,
                                            returnDate:
                                                widget.bookingRow!.returnDate!,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  if (widget.bookingRow?.tripId !=
                                      'df87b80c-cc75-42dc-9702-7b41e22c2035')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 1.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 4.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    color: Color(0x00000000),
                                                    child: ExpandableNotifier(
                                                      controller: _model
                                                          .expandableExpandableController1,
                                                      child: ExpandablePanel(
                                                        header: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons.movie_edit,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'mtdyjh11' /* تعديل الحجز */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 16.0))
                                                              .addToStart(
                                                                  SizedBox(
                                                                      width:
                                                                          16.0)),
                                                        ),
                                                        collapsed: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        expanded: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '6awucqh5' /* عدد الركاب */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: Color(0xFF1D4847),
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ]
                                                                        .divide(SizedBox(
                                                                            width:
                                                                                16.0))
                                                                        .addToStart(SizedBox(
                                                                            width:
                                                                                16.0)),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child: Card(
                                                                      clipBehavior:
                                                                          Clip.antiAliasWithSaveLayer,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      elevation:
                                                                          1.0,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            60.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'bbjl0fv4' /* المقاعد المحجوزة: */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                              child: Container(
                                                                                width: 120.0,
                                                                                height: 40.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  shape: BoxShape.rectangle,
                                                                                ),
                                                                                child: FlutterFlowCountController(
                                                                                  decrementIconBuilder: (enabled) => Icon(
                                                                                    Icons.remove_rounded,
                                                                                    color: enabled ? FlutterFlowTheme.of(context).secondaryText : FlutterFlowTheme.of(context).alternate,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                  incrementIconBuilder: (enabled) => Icon(
                                                                                    Icons.add_rounded,
                                                                                    color: enabled ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).alternate,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                  countBuilder: (count) => Text(
                                                                                    count.toString(),
                                                                                    style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).titleLargeIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                  count: _model.countControllerValue ??= widget.bookingRow!.seatsNum!,
                                                                                  updateCount: (count) => safeSetState(() => _model.countControllerValue = count),
                                                                                  stepSize: 1,
                                                                                  minimum: 1,
                                                                                  maximum: 50,
                                                                                  contentPadding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Builder(
                                                                        builder:
                                                                            (context) =>
                                                                                FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            _model.editingConfirm =
                                                                                await BookingsTable().update(
                                                                              data: {
                                                                                'price': (widget.bookingRow!.price!) + ((widget.bookingRow!.tripPrice!) * (widget.bookingRow!.seatsNum! > _model.countControllerValue! ? (-((widget.bookingRow!.seatsNum!) - (_model.countControllerValue!))) : ((_model.countControllerValue!) - (widget.bookingRow!.seatsNum!)))),
                                                                                'status': widget.bookingRow?.status,
                                                                                'seats_num': _model.countControllerValue,
                                                                              },
                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                'id',
                                                                                FFAppState().booking,
                                                                              ),
                                                                              returnRows: true,
                                                                            );
                                                                            _model.notify =
                                                                                await NotificationsTable().insert({
                                                                              'user_id': FFAppState().user.id,
                                                                              'body': 'يمكنك الاطلاع على التفاصيل من صفحة التذاكر',
                                                                              'title': 'تم تعديل الحجز بنجاح',
                                                                              'type': 'booking_change',
                                                                              'screen': 'trip',
                                                                              'booking_id': FFAppState().booking,
                                                                              'service': 'trip',
                                                                            });
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
                                                                                      height: MediaQuery.sizeOf(context).height * 0.32,
                                                                                      child: DialogWidget(
                                                                                        title: FFLocalizations.of(context).getVariableText(
                                                                                          arText: 'تعديل الحجز',
                                                                                          enText: 'Modify booking',
                                                                                        ),
                                                                                        text: FFLocalizations.of(context).getVariableText(
                                                                                          arText: 'تم تعديل الحجز بنجاح',
                                                                                          enText: 'The booking was successfully modified.',
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

                                                                            context.pushNamed(
                                                                              TripPayWidget.routeName,
                                                                              queryParameters: {
                                                                                'bookingRow': serializeParam(
                                                                                  _model.editingConfirm?.firstOrNull,
                                                                                  ParamType.SupabaseRow,
                                                                                ),
                                                                                'status': serializeParam(
                                                                                  _model.updated?.firstOrNull?.status,
                                                                                  ParamType.int,
                                                                                ),
                                                                                'booking': serializeParam(
                                                                                  widget.booking,
                                                                                  ParamType.int,
                                                                                ),
                                                                                'tripid': serializeParam(
                                                                                  widget.tripid,
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );

                                                                            safeSetState(() {});
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            '4xd69lsi' /* تأكيد التعديل */,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.44,
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  color: Colors.white,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                ),
                                                                            elevation:
                                                                                1.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ]
                                                                        .addToStart(SizedBox(
                                                                            width:
                                                                                16.0))
                                                                        .addToEnd(SizedBox(
                                                                            width:
                                                                                16.0)),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        4.0)),
                                                              ),
                                                            ]
                                                                .divide(SizedBox(
                                                                    height:
                                                                        12.0))
                                                                .addToStart(
                                                                    SizedBox(
                                                                        height:
                                                                            4.0))
                                                                .addToEnd(
                                                                    SizedBox(
                                                                        height:
                                                                            8.0)),
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
                                                          hasIcon: true,
                                                          iconColor:
                                                              Color(0xFF1D4847),
                                                          iconPadding:
                                                              EdgeInsets.all(
                                                                  12.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 12.0)),
                                        ),
                                      ),
                                    ),
                                  if (FFAppState().pay == true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 1.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 4.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    color: Color(0x00000000),
                                                    child: ExpandableNotifier(
                                                      controller: _model
                                                          .expandableExpandableController2,
                                                      child: ExpandablePanel(
                                                        header: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .credit_score_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'o1onba90' /* تأكيد الحجز */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 16.0))
                                                              .addToStart(
                                                                  SizedBox(
                                                                      width:
                                                                          16.0)),
                                                        ),
                                                        collapsed: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        expanded: Container(
                                                          height: 316.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Flexible(
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 92.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            14.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'fuwtfn4l' /* طريقة الدفع */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: Color(0xFF1D4847),
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 16.0)).addToStart(SizedBox(width: 4.0)).addToEnd(SizedBox(width: 4.0)),
                                                                            ),
                                                                            Card(
                                                                              clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                              elevation: 0.0,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Container(
                                                                                height: 60.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSb8QZvNNnSnrZS5XUgzXTxTb6uAALx_hyE1g&s',
                                                                                        width: 55.0,
                                                                                        height: 200.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'a9dtyg87' /* شام كاش */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                ),
                                                                                          ),
                                                                                          SelectionArea(
                                                                                              child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'xter0i9b' /* انقر على الأيقونة لنسخ رقم الح... */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                ),
                                                                                          )),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    FlutterFlowIconButton(
                                                                                      borderRadius: 8.0,
                                                                                      buttonSize: 40.0,
                                                                                      icon: Icon(
                                                                                        Icons.content_copy,
                                                                                        color: Color(0xFF1D4847),
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      onPressed: () async {
                                                                                        await Clipboard.setData(ClipboardData(text: 'adddce53cea4c5e65b2a377d86cd25b6'));
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'تم نسخ معرف الحساب',
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 4.0)),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'skm46kfg' /* الكوبونات */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: Color(0xFF1D4847),
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ]
                                                                        .divide(SizedBox(
                                                                            width:
                                                                                16.0))
                                                                        .addToStart(SizedBox(
                                                                            width:
                                                                                16.0)),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child: Card(
                                                                      clipBehavior:
                                                                          Clip.antiAliasWithSaveLayer,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      elevation:
                                                                          0.0,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            60.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    height: 50.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: FutureBuilder<List<BookingsRow>>(
                                                                                      future: BookingsTable().querySingleRow(
                                                                                        queryFn: (q) => q.eqOrNull(
                                                                                          'discount_code',
                                                                                          _model.textController1.text,
                                                                                        ),
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
                                                                                        List<BookingsRow> textFieldBookingsRowList = snapshot.data!;

                                                                                        final textFieldBookingsRow = textFieldBookingsRowList.isNotEmpty ? textFieldBookingsRowList.first : null;

                                                                                        return Container(
                                                                                          width: double.infinity,
                                                                                          child: TextFormField(
                                                                                            controller: _model.textController1,
                                                                                            focusNode: _model.textFieldFocusNode,
                                                                                            autofocus: false,
                                                                                            obscureText: false,
                                                                                            decoration: InputDecoration(
                                                                                              isDense: true,
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                  ),
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                '8g7qfs70' /* أدخل كود الخصم */,
                                                                                              ),
                                                                                              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                  ),
                                                                                              enabledBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: Color(0x00000000),
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(14.0),
                                                                                              ),
                                                                                              focusedBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: Color(0x00000000),
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(14.0),
                                                                                              ),
                                                                                              errorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(14.0),
                                                                                              ),
                                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(14.0),
                                                                                              ),
                                                                                              filled: true,
                                                                                              fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              contentPadding: EdgeInsets.all(16.0),
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                ),
                                                                                            textAlign: TextAlign.start,
                                                                                            cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                            validator: _model.textController1Validator.asValidator(context),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                    child: FlutterFlowIconButton(
                                                                                      borderRadius: 12.0,
                                                                                      buttonSize: 40.0,
                                                                                      fillColor: Color(0xFF2D5050),
                                                                                      icon: Icon(
                                                                                        Icons.check_outlined,
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      onPressed: () async {
                                                                                        _model.discountCode = await DiscountCodesTable().queryRows(
                                                                                          queryFn: (q) => q,
                                                                                        );
                                                                                        _model.usage = await DiscountUsageTable().queryRows(
                                                                                          queryFn: (q) => q
                                                                                              .eqOrNull(
                                                                                                'user_id',
                                                                                                FFAppState().user.id,
                                                                                              )
                                                                                              .eqOrNull(
                                                                                                'discount_code_id',
                                                                                                tripPayDiscountCodesRowList.where((e) => e.code == _model.textController1.text).toList().firstOrNull?.id,
                                                                                              ),
                                                                                        );
                                                                                        if ((tripPayDiscountCodesRowList.where((e) => e.code == _model.textController1.text).toList().firstOrNull?.code == _model.textController1.text) && (tripPayDiscountCodesRowList.firstOrNull!.usedCount! < tripPayDiscountCodesRowList.firstOrNull!.usageLimit!) && (tripPayDiscountCodesRowList.firstOrNull!.limitPerUser! > _model.usage!.length) && (tripPayDiscountCodesRowList.firstOrNull?.discountType == 'trips')) {
                                                                                          _model.bookingDiscountQuery = await BookingsTable().queryRows(
                                                                                            queryFn: (q) => q
                                                                                                .eqOrNull(
                                                                                                  'trip_id',
                                                                                                  widget.tripid,
                                                                                                )
                                                                                                .eqOrNull(
                                                                                                  'user_id',
                                                                                                  FFAppState().user.id,
                                                                                                )
                                                                                                .eqOrNull(
                                                                                                  'discount_code',
                                                                                                  _model.textController1.text,
                                                                                                ),
                                                                                          );
                                                                                          if (_model.bookingDiscountQuery?.length == 0) {
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
                                                                                                      height: MediaQuery.sizeOf(context).height * 0.32,
                                                                                                      child: DialogWidget(
                                                                                                        title: FFLocalizations.of(context).getVariableText(
                                                                                                          arText: 'مبارك',
                                                                                                          enText: 'Congrats',
                                                                                                        ),
                                                                                                        text: FFLocalizations.of(context).getVariableText(
                                                                                                          arText: 'تم تطبيق الخصم',
                                                                                                          enText: 'Discount applied',
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

                                                                                            _model.discountUsage = await DiscountUsageTable().insert({
                                                                                              'discount_code_id': tripPayDiscountCodesRowList.firstOrNull?.id,
                                                                                              'user_id': FFAppState().user.id,
                                                                                              'booking_id': widget.booking,
                                                                                              'used_at': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                                            });
                                                                                            _model.updated = await BookingsTable().update(
                                                                                              data: {
                                                                                                'discount_code': tripPayDiscountCodesRowList.firstOrNull?.code,
                                                                                                'price': (widget.bookingRow!.price!) - (tripPayDiscountCodesRowList.firstOrNull!.discountValue!),
                                                                                                'discount': tripPayDiscountCodesRowList.firstOrNull?.id,
                                                                                              },
                                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                                'id',
                                                                                                widget.bookingRow?.id,
                                                                                              ),
                                                                                              returnRows: true,
                                                                                            );
                                                                                            await DiscountCodesTable().update(
                                                                                              data: {
                                                                                                'used_count': (tripPayDiscountCodesRowList.firstOrNull!.usedCount!) + 1,
                                                                                              },
                                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                                'id',
                                                                                                tripPayDiscountCodesRowList.firstOrNull?.id,
                                                                                              ),
                                                                                            );
                                                                                            await Future.delayed(
                                                                                              Duration(
                                                                                                milliseconds: 500,
                                                                                              ),
                                                                                            );

                                                                                            context.pushNamed(
                                                                                              TripPayWidget.routeName,
                                                                                              queryParameters: {
                                                                                                'bookingRow': serializeParam(
                                                                                                  _model.updated?.firstOrNull,
                                                                                                  ParamType.SupabaseRow,
                                                                                                ),
                                                                                                'status': serializeParam(
                                                                                                  _model.updated?.firstOrNull?.status,
                                                                                                  ParamType.int,
                                                                                                ),
                                                                                                'booking': serializeParam(
                                                                                                  widget.booking,
                                                                                                  ParamType.int,
                                                                                                ),
                                                                                                'tripid': serializeParam(
                                                                                                  widget.tripid,
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
                                                                                                      height: MediaQuery.sizeOf(context).height * 0.32,
                                                                                                      child: DialogWidget(
                                                                                                        title: FFLocalizations.of(context).getVariableText(
                                                                                                          arText: 'تم',
                                                                                                          enText: 'Done',
                                                                                                        ),
                                                                                                        text: FFLocalizations.of(context).getVariableText(
                                                                                                          arText: 'تم تطبيق الخصم بالفعل',
                                                                                                          enText: 'The discount has already been applied.',
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
                                                                                                    height: MediaQuery.sizeOf(context).height * 0.32,
                                                                                                    child: DialogWidget(
                                                                                                      title: FFLocalizations.of(context).getVariableText(
                                                                                                        arText: 'خطأ',
                                                                                                        enText: 'Error',
                                                                                                      ),
                                                                                                      text: FFLocalizations.of(context).getVariableText(
                                                                                                        arText: 'يرجى إدخال الكود بشكل صحيح',
                                                                                                        enText: 'Please enter the code correctly',
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
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 12.0)),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        4.0)),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
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
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'e5q91c8k' /* أدخل معرف عملية الدفع */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                color: Color(0xFF1D4847),
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleLargeIsCustom,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(width: 16.0)).addToStart(SizedBox(width: 4.0)).addToEnd(
                                                                              SizedBox(width: 4.0)),
                                                                    ),
                                                                    Card(
                                                                      clipBehavior:
                                                                          Clip.antiAliasWithSaveLayer,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      elevation:
                                                                          0.0,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            60.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    height: 50.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      child: TextFormField(
                                                                                        controller: _model.payFieldTextController,
                                                                                        focusNode: _model.payFieldFocusNode,
                                                                                        autofocus: false,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            '9wsfwhg9' /* أدخل معرف عملية الدفع */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: Color(0x00000000),
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(14.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: Color(0x00000000),
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(14.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(14.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(14.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          contentPadding: EdgeInsets.all(16.0),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                        textAlign: TextAlign.start,
                                                                                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                        validator: _model.payFieldTextControllerValidator.asValidator(context),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                    child: FlutterFlowIconButton(
                                                                                      borderRadius: 12.0,
                                                                                      buttonSize: 40.0,
                                                                                      fillColor: Color(0xFF2D5050),
                                                                                      icon: Icon(
                                                                                        Icons.check_outlined,
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      onPressed: () async {
                                                                                        if (_model.payFieldTextController.text != '') {
                                                                                          await BookingsTable().update(
                                                                                            data: {
                                                                                              'payment': _model.payFieldTextController.text,
                                                                                            },
                                                                                            matchingRows: (rows) => rows.eqOrNull(
                                                                                              'id',
                                                                                              widget.bookingRow?.id,
                                                                                            ),
                                                                                          );
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
                                                                                                    height: MediaQuery.sizeOf(context).height * 0.36,
                                                                                                    child: DialogWidget(
                                                                                                      title: FFLocalizations.of(context).getVariableText(
                                                                                                        arText: 'رقم عملية التحويل',
                                                                                                        enText: 'Transfer transaction number',
                                                                                                      ),
                                                                                                      text: FFLocalizations.of(context).getVariableText(
                                                                                                        arText: 'سيتم إلغاء الحجز في حال عدم تطابق رقم عملية الدفع.',
                                                                                                        enText: 'The reservation will be cancelled if the payment transaction number does not match.',
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

                                                                                          await NotificationsTable().insert({
                                                                                            'user_id': FFAppState().user.id,
                                                                                            'body': FFLocalizations.of(context).getVariableText(
                                                                                              arText: 'تم استلام الدفع جاري تأكيد حجزك',
                                                                                              enText: 'Payment received. Your booking is being confirmed.',
                                                                                            ),
                                                                                            'title': FFLocalizations.of(context).getVariableText(
                                                                                              arText: 'إشعار الدفع',
                                                                                              enText: 'Payment notification',
                                                                                            ),
                                                                                            'service': 'trip',
                                                                                          });

                                                                                          context.pushNamed(HomePageWidget.routeName);
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
                                                                                                    height: MediaQuery.sizeOf(context).height * 0.36,
                                                                                                    child: DialogWidget(
                                                                                                      title: FFLocalizations.of(context).getVariableText(
                                                                                                        arText: 'حقل فارغ',
                                                                                                        enText: 'Empty field',
                                                                                                      ),
                                                                                                      text: FFLocalizations.of(context).getVariableText(
                                                                                                        arText: 'يجب إدخال معرف عملية الدفع لتأكيد الحجز',
                                                                                                        enText: 'A payment transaction ID must be entered to confirm the booking.',
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
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 12.0)),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          4.0)),
                                                                ),
                                                              ),
                                                            ]
                                                                .divide(SizedBox(
                                                                    height:
                                                                        12.0))
                                                                .addToStart(
                                                                    SizedBox(
                                                                        height:
                                                                            4.0))
                                                                .addToEnd(SizedBox(
                                                                    height:
                                                                        12.0)),
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
                                                          hasIcon: true,
                                                          iconColor:
                                                              Color(0xFF1D4847),
                                                          iconPadding:
                                                              EdgeInsets.all(
                                                                  12.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 12.0)),
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 1.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .info_outlined,
                                                              color: Color(
                                                                  0xFF1D4847),
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 11,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'sa92h553' /* يُلغى الحجز تلقائياً إذا لم يت... */,
                                                        ),
                                                        maxLines: 2,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              color: Color(
                                                                  0xFF1D4847),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'lkr12jop' /* الرحلات التي قبل 8 ص التثبيت ق... */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.5,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]
                                                  .divide(SizedBox(width: 12.0))
                                                  .addToStart(
                                                      SizedBox(width: 12.0))
                                                  .addToEnd(
                                                      SizedBox(width: 12.0)),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 8.0)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 12.0, 4.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Builder(
                                            builder: (context) =>
                                                FFButtonWidget(
                                              onPressed: () async {
                                                await showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Container(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.36,
                                                          child: DialogWidget(
                                                            title: FFLocalizations
                                                                    .of(context)
                                                                .getVariableText(
                                                              arText:
                                                                  'هل تريد فعلاً إلغاء هذا الحجز؟',
                                                              enText:
                                                                  'Do you really want to cancel this reservation?',
                                                            ),
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getVariableText(
                                                              arText:
                                                                  'يمكن إلغاء الحجز مجاناً حتى ساعتين قبل موعد الرحلة',
                                                              enText:
                                                                  'Bookings can be cancelled free of charge up to two hours before departure.',
                                                            ),
                                                            confirm: FFLocalizations
                                                                    .of(context)
                                                                .getVariableText(
                                                              arText: 'تأكيد',
                                                              enText: 'Confirm',
                                                            ),
                                                            dismessVis: true,
                                                            dismess: FFLocalizations
                                                                    .of(context)
                                                                .getVariableText(
                                                              arText: 'تجاهل',
                                                              enText: 'Ignore',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) => safeSetState(
                                                    () =>
                                                        _model.cancel = value));

                                                if (_model.cancel == true) {
                                                  await BookingsTable().delete(
                                                    matchingRows: (rows) =>
                                                        rows.eqOrNull(
                                                      'id',
                                                      widget.bookingRow?.id,
                                                    ),
                                                  );

                                                  context.pushNamed(
                                                      HomePageWidget.routeName);
                                                }

                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '6nnc40lr' /* إلغاء الحجز */,
                                              ),
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.44,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLargeFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLargeIsCustom,
                                                    ),
                                                elevation: 1.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Stack(
                                          children: [
                                            if (widget.bookingRow?.tracking ==
                                                true)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: (widget.bookingRow
                                                              ?.tracking !=
                                                          true)
                                                      ? null
                                                      : () async {
                                                          context.pushNamed(
                                                            TrackingWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'tripID':
                                                                  serializeParam(
                                                                widget.tripid,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'booking':
                                                                  serializeParam(
                                                                widget
                                                                    .bookingRow
                                                                    ?.id,
                                                                ParamType.int,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '5yzh2s1q' /* تتبع الرحلة */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.44,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeIsCustom,
                                                            ),
                                                    elevation: 1.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    disabledColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    disabledTextColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                  ),
                                                ),
                                              ),
                                            if (widget.bookingRow?.tracking !=
                                                true)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                        HomePageWidget
                                                            .routeName);
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'ikaz6azo' /* الرئيسية */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.44,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeIsCustom,
                                                            ),
                                                    elevation: 1.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ]
                                    .addToStart(SizedBox(height: 8.0))
                                    .addToEnd(SizedBox(height: 8.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
