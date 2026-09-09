import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/travel/mapy/mapy_widget.dart';
import '/zcomponents/dialog/dialog_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'trip_shared_model.dart';
export 'trip_shared_model.dart';

class TripSharedWidget extends StatefulWidget {
  const TripSharedWidget({
    super.key,
    this.tripID,
  });

  final String? tripID;

  static String routeName = 'tripShared';
  static String routePath = 'tripshared/:tripID';

  @override
  State<TripSharedWidget> createState() => _TripSharedWidgetState();
}

class _TripSharedWidgetState extends State<TripSharedWidget> {
  late TripSharedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TripSharedModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().price = 0;
      safeSetState(() {});
    });

    _model.fromdoorValue = false;
    _model.todoorValue = false;
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      safeSetState(() {});
    }();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<AppRow>>(
      future: AppTable().querySingleRow(
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
        List<AppRow> tripSharedAppRowList = snapshot.data!;

        final tripSharedAppRow =
            tripSharedAppRowList.isNotEmpty ? tripSharedAppRowList.first : null;

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
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
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
                    FFLocalizations.of(context).getText(
                      '3jo7ju08' /* تفاصيل الرحلة */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).headlineMediumFamily,
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: !FlutterFlowTheme.of(context)
                              .headlineMediumIsCustom,
                        ),
                  ),
                ),
                actions: [
                  Builder(
                    builder: (context) => FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 60.0,
                      fillColor: Color(0x4CFFFFFF),
                      icon: Icon(
                        Icons.share_outlined,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        await Share.share(
                          FFAppState().sharing,
                          sharePositionOrigin: getWidgetBoundingBox(context),
                        );
                      },
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
              child: FutureBuilder<List<TripsRow>>(
                future: TripsTable().querySingleRow(
                  queryFn: (q) => q.eqOrNull(
                    'id',
                    widget.tripID,
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
                  List<TripsRow> overlayTripsRowList = snapshot.data!;

                  final overlayTripsRow = overlayTripsRowList.isNotEmpty
                      ? overlayTripsRowList.first
                      : null;

                  return Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(),
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      child: Stack(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 0.0),
                                child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.3,
                                  child: Stack(
                                    alignment: AlignmentDirectional(-0.0, 1.0),
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                          child: Image.network(
                                            overlayTripsRow!.toImage!,
                                            width: 200.0,
                                            height: 240.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 16.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Supabase
                                                .instance.client.functions
                                                .invoke(
                                              'stopdrivertracking',
                                              body: const {},
                                            );

                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'تم بحمدالله تعالى'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Confirm'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                          },
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.1,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16.0),
                                                topRight: Radius.circular(16.0),
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 18.0,
                                                  sigmaY: 18.0,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: FFLocalizations.of(context)
                                                                              .languageCode ==
                                                                          'ar'
                                                                      ? valueOrDefault<
                                                                          String>(
                                                                          overlayTripsRow
                                                                              .from,
                                                                          'حمص',
                                                                        )
                                                                      : valueOrDefault<
                                                                          String>(
                                                                          overlayTripsRow
                                                                              .fromEn,
                                                                          'حمص',
                                                                        ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            18.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'fju9wyxy' /*  -  */,
                                                                  ),
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        24.0,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text: FFLocalizations.of(context)
                                                                              .languageCode ==
                                                                          'ar'
                                                                      ? valueOrDefault<
                                                                          String>(
                                                                          overlayTripsRow
                                                                              .to,
                                                                          'حمص',
                                                                        )
                                                                      : valueOrDefault<
                                                                          String>(
                                                                          overlayTripsRow
                                                                              .toEn,
                                                                          'حمص',
                                                                        ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleMediumFamily,
                                                                        fontSize:
                                                                            18.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                      ),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyLargeIsCustom,
                                                                  ),
                                                            ),
                                                            maxLines: 1,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text:
                                                                      dateTimeFormat(
                                                                    "EEEE",
                                                                    overlayTripsRow
                                                                        .date!,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  style: GoogleFonts
                                                                      .notoKufiArabic(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'rmhfsb2s' /* :  */,
                                                                  ),
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      dateTimeFormat(
                                                                    "M/d h:mm a",
                                                                    overlayTripsRow
                                                                        .date!,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .notoKufiArabic(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .displaySmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .displaySmall
                                                                            .fontStyle,
                                                                      ),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .displaySmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .notoKufiArabic(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .displaySmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displaySmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '1ddntj7w' /* الوصول */,
                                                                  ),
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'i5b6vse7' /* :  */,
                                                                  ),
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      dateTimeFormat(
                                                                    "jm",
                                                                    overlayTripsRow
                                                                        .time!,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .notoKufiArabic(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .displaySmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .displaySmall
                                                                            .fontStyle,
                                                                      ),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .displaySmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .notoKufiArabic(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .displaySmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displaySmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: MediaQuery.sizeOf(context).height * 0.6,
                                child: Stack(
                                  alignment: AlignmentDirectional(-0.0, 0.0),
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            elevation: 4.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Container(
                                              height: 70.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  width: 0.1,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.3,
                                                        height: 52.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child:
                                                            FlutterFlowCountController(
                                                          decrementIconBuilder:
                                                              (enabled) => Icon(
                                                            Icons
                                                                .remove_rounded,
                                                            color: enabled
                                                                ? Color(
                                                                    0xFFA3C9C9)
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            size: 24.0,
                                                          ),
                                                          incrementIconBuilder:
                                                              (enabled) => Icon(
                                                            Icons.add_rounded,
                                                            color: enabled
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            size: 24.0,
                                                          ),
                                                          countBuilder:
                                                              (count) => Text(
                                                            count.toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLargeIsCustom,
                                                                ),
                                                          ),
                                                          count: _model
                                                              .countControllerValue ??= 1,
                                                          updateCount:
                                                              (count) async {
                                                            safeSetState(() =>
                                                                _model.countControllerValue =
                                                                    count);
                                                            _model.seats =
                                                                _model.seats +
                                                                    1;
                                                          },
                                                          stepSize: 1,
                                                          minimum: 1,
                                                          maximum:
                                                              overlayTripsRow
                                                                  .vehicleSeats,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.3,
                                                    height: 52.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .moneyBill,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 20.0,
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      (((overlayTripsRow.price!) + FFAppState().delevery + FFAppState().delevery2) *
                                                                              (_model.countControllerValue!))
                                                                          .toString(),
                                                                      '1000',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.notoKufiArabic(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodySmallIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'fweve1pc' /* ل.س */,
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
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 0.0)),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 16.0)),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.3,
                                                    height: 52.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .event_seat_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 20.0,
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: valueOrDefault<
                                                                      String>(
                                                                    overlayTripsRow
                                                                        .vehicleSeats
                                                                        .toString(),
                                                                    '11',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '0p84857k' /*  متوفر */,
                                                                  ),
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                )
                                                              ],
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
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              width: 16.0))
                                                          .around(SizedBox(
                                                              width: 16.0)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'rah6y1yo' /* صعود في  */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: Color(
                                                                        0xFF161C24),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode ==
                                                                      'ar'
                                                                  ? valueOrDefault<
                                                                      String>(
                                                                      overlayTripsRow
                                                                          .from,
                                                                      'حمص',
                                                                    )
                                                                  : valueOrDefault<
                                                                      String>(
                                                                      overlayTripsRow
                                                                          .fromEn,
                                                                      'حمص',
                                                                    ),
                                                              style:
                                                                  TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'xsscbtu5' /* من باب البيت؟ */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: Color(
                                                                          0xFF161C24),
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 6.0)),
                                                          ),
                                                          Switch.adaptive(
                                                            value: _model
                                                                .fromdoorValue!,
                                                            onChanged:
                                                                (newValue) async {
                                                              safeSetState(() =>
                                                                  _model.fromdoorValue =
                                                                      newValue);

                                                              if (!newValue) {
                                                                _model.fromDoor =
                                                                    0;
                                                                safeSetState(
                                                                    () {});
                                                                FFAppState()
                                                                        .delevery =
                                                                    0.0;
                                                                FFAppState()
                                                                    .upAddress = '';
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            activeColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            activeTrackColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            inactiveTrackColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            inactiveThumbColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 2.0)),
                                                      ),
                                                    ],
                                                  ),
                                                  if (_model.fromdoorValue ==
                                                      true)
                                                    Container(
                                                      height: 56.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Visibility(
                                                        visible: _model
                                                                .fromdoorValue ==
                                                            true,
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {},
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 56.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(context).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                Container(
                                                                              height: 600.0,
                                                                              child: MapyWidget(
                                                                                title: 'up',
                                                                                price: overlayTripsRow.kmPrice!,
                                                                                citylist: tripSharedAppRow!.fromShipping,
                                                                                ltlng: tripSharedAppRow.latlngGovrs,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  },
                                                                  text: valueOrDefault<
                                                                      String>(
                                                                    FFAppState().upAddress !=
                                                                                ''
                                                                        ? FFAppState()
                                                                            .upAddress
                                                                        : 'اختر موقع الصعود',
                                                                    'اختر موقع الصعود',
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.93,
                                                                    height:
                                                                        48.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    textStyle: FlutterFlowTheme.of(
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
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (_model.fromdoorValue !=
                                                      true)
                                                    Expanded(
                                                      child: ClipRRect(
                                                        child: Container(
                                                          height: 44.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child:
                                                              FlutterFlowChoiceChips(
                                                            options: (FFLocalizations.of(context)
                                                                            .languageCode ==
                                                                        'ar'
                                                                    ? overlayTripsRow
                                                                        .fromStations
                                                                    : overlayTripsRow
                                                                        .fromStationsEN)
                                                                .map((label) =>
                                                                    ChipData(
                                                                        label))
                                                                .toList(),
                                                            onChanged: (val) =>
                                                                safeSetState(() =>
                                                                    _model.fromStationValue =
                                                                        val?.firstOrNull),
                                                            selectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              iconSize: 16.0,
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            unselectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              iconColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              iconSize: 16.0,
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            chipSpacing: 8.0,
                                                            rowSpacing: 8.0,
                                                            multiselect: false,
                                                            initialized: _model
                                                                    .fromStationValue !=
                                                                null,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            controller: _model
                                                                    .fromStationValueController ??=
                                                                FormFieldController<
                                                                    List<
                                                                        String>>(
                                                              [
                                                                overlayTripsRow
                                                                    .fromStations
                                                                    .firstOrNull!
                                                              ],
                                                            ),
                                                            wrapped: false,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'e91xoavl' /* نزول في  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: Color(
                                                                    0xFF161C24),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode ==
                                                                  'ar'
                                                              ? valueOrDefault<
                                                                  String>(
                                                                  overlayTripsRow
                                                                      .to,
                                                                  'حمص',
                                                                )
                                                              : valueOrDefault<
                                                                  String>(
                                                                  overlayTripsRow
                                                                      .toEn,
                                                                  'حمص',
                                                                ),
                                                          style: TextStyle(),
                                                        )
                                                      ],
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
                                                                    .primary,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
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
                                                          await launchMap(
                                                            address:
                                                                'Hayyat Hospital, Adawi, Damascus, Syria',
                                                            title: 'jhgvfguy',
                                                          );
                                                        },
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'eznxgp5n' /* وجهة مخصصة؟ */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: Color(
                                                                    0xFF161C24),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                      Switch.adaptive(
                                                        value:
                                                            _model.todoorValue!,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.todoorValue =
                                                                  newValue);

                                                          if (!newValue) {
                                                            _model.toDoor = 0;
                                                            safeSetState(() {});
                                                            FFAppState()
                                                                    .delevery2 =
                                                                0.0;
                                                            FFAppState()
                                                                .downAddress = '';
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        activeTrackColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        inactiveTrackColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        inactiveThumbColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 2.0)),
                                                  ),
                                                ],
                                              ),
                                              if (_model.todoorValue == true)
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
                                                    await launchMap(
                                                      address:
                                                          'Hayyat Hospital, Adawi, Damascus, Syria',
                                                      title: 'hguhbk',
                                                    );
                                                  },
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          600.0,
                                                                      child:
                                                                          MapyWidget(
                                                                        title:
                                                                            'down',
                                                                        price: overlayTripsRow
                                                                            .kmPrice!,
                                                                        citylist:
                                                                            tripSharedAppRow!.fromShipping,
                                                                        ltlng: tripSharedAppRow
                                                                            .latlngGovrs,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          },
                                                          text: valueOrDefault<
                                                              String>(
                                                            FFAppState()
                                                                            .downAddress !=
                                                                        ''
                                                                ? FFAppState()
                                                                    .downAddress
                                                                : 'اختر موقع النزول',
                                                            'اختر موقع النزول',
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.93,
                                                            height: 48.0,
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .titleSmallIsCustom,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              if (_model.todoorValue != true)
                                                Container(
                                                  child: ClipRRect(
                                                    child: Container(
                                                      height: 44.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child:
                                                          FlutterFlowChoiceChips(
                                                        options: (FFLocalizations.of(
                                                                            context)
                                                                        .languageCode ==
                                                                    'ar'
                                                                ? overlayTripsRow
                                                                    .toStations
                                                                : overlayTripsRow
                                                                    .toStationsEN)
                                                            .map((label) =>
                                                                ChipData(label))
                                                            .toList(),
                                                        onChanged: (val) =>
                                                            safeSetState(() => _model
                                                                    .toStationValue =
                                                                val?.firstOrNull),
                                                        selectedChipStyle:
                                                            ChipStyle(
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                          iconColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .info,
                                                          iconSize: 16.0,
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        unselectedChipStyle:
                                                            ChipStyle(
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                          iconColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                          iconSize: 16.0,
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        chipSpacing: 8.0,
                                                        rowSpacing: 8.0,
                                                        multiselect: false,
                                                        initialized: _model
                                                                .toStationValue !=
                                                            null,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        controller: _model
                                                                .toStationValueController ??=
                                                            FormFieldController<
                                                                List<String>>(
                                                          [
                                                            overlayTripsRow
                                                                .toStations
                                                                .firstOrNull!
                                                          ],
                                                        ),
                                                        wrapped: false,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ].divide(SizedBox(height: 8.0)),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.info_outline,
                                                        color:
                                                            Color(0xFF161C24),
                                                        size: 18.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 11,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                        context)
                                                                    .languageCode ==
                                                                'ar'
                                                            ? valueOrDefault<
                                                                String>(
                                                                overlayTripsRow
                                                                    .notes,
                                                                'حمص',
                                                              )
                                                            : valueOrDefault<
                                                                String>(
                                                                overlayTripsRow
                                                                    .notesEn,
                                                                'حمص',
                                                              ),
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              color: Color(
                                                                  0xFF161C24),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 48.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              child: TextFormField(
                                                controller:
                                                    _model.textController,
                                                focusNode:
                                                    _model.textFieldFocusNode,
                                                autofocus: false,
                                                enabled: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumIsCustom,
                                                          ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '25an4f4d' /* أضف ملاحظة... */,
                                                  ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumIsCustom,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      width: 0.4,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 0.4,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 0.4,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 0.4,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  suffixIcon: Icon(
                                                    FontAwesomeIcons.edit,
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                enableInteractiveSelection:
                                                    true,
                                                validator: _model
                                                    .textControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Builder(
                                                  builder: (context) =>
                                                      FFButtonWidget(
                                                    onPressed: () async {
                                                      if ((_model.fromdoorValue ==
                                                              true) &&
                                                          (_model.todoor ==
                                                              true)) {
                                                        if ((FFAppState()
                                                                    .delevery !=
                                                                null) &&
                                                            (FFAppState()
                                                                    .delevery2 !=
                                                                null)) {
                                                          await TripsTable()
                                                              .update(
                                                            data: {
                                                              'Vehicle_seats':
                                                                  valueOrDefault<
                                                                      int>(
                                                                overlayTripsRow
                                                                        .vehicleSeats -
                                                                    (_model
                                                                        .countControllerValue!),
                                                                8,
                                                              ),
                                                              'booked_Seats':
                                                                  valueOrDefault<
                                                                      int>(
                                                                (overlayTripsRow
                                                                        .bookedSeats!) +
                                                                    (_model
                                                                        .countControllerValue!),
                                                                18,
                                                              ),
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              widget.tripID,
                                                            ),
                                                          );
                                                          _model.bookingDtod =
                                                              await BookingsTable()
                                                                  .insert({
                                                            'name': FFAppState()
                                                                .user
                                                                .name,
                                                            'from':
                                                                overlayTripsRow
                                                                    .from,
                                                            'trip_id':
                                                                widget.tripID,
                                                            'seats_num': _model
                                                                .countControllerValue,
                                                            'user_id':
                                                                FFAppState()
                                                                    .user
                                                                    .id,
                                                            'to':
                                                                overlayTripsRow
                                                                    .to,
                                                            'tripPrice':
                                                                overlayTripsRow
                                                                    .price,
                                                            'status': 0,
                                                            'price': functions
                                                                .intPrice(
                                                                    valueOrDefault<
                                                                        double>(
                                                              ((overlayTripsRow.price!) +
                                                                      FFAppState()
                                                                          .delevery +
                                                                      FFAppState()
                                                                          .delevery2) *
                                                                  (_model
                                                                      .countControllerValue!),
                                                              500.0,
                                                            )),
                                                            'barcode': random_data
                                                                .randomString(
                                                              10,
                                                              10,
                                                              false,
                                                              false,
                                                              true,
                                                            ),
                                                            'fromStation':
                                                                FFAppState()
                                                                    .location
                                                                    ?.toString(),
                                                            'toStation':
                                                                FFAppState()
                                                                    .down
                                                                    ?.toString(),
                                                            'date': supaSerialize<
                                                                    DateTime>(
                                                                overlayTripsRow
                                                                    .date),
                                                            'phone':
                                                                FFAppState()
                                                                    .user
                                                                    .phone,
                                                            'duration': FFAppState()
                                                                            .duration !=
                                                                        ''
                                                                ? FFAppState()
                                                                    .duration
                                                                : '15 دقيقة',
                                                          });
                                                          _model.notification1 =
                                                              await NotificationsTable()
                                                                  .insert({
                                                            'user_id':
                                                                FFAppState()
                                                                    .user
                                                                    .id,
                                                            'body':
                                                                '${overlayTripsRow.from} - ${overlayTripsRow.to} في ${dateTimeFormat(
                                                              "MMMMEEEEd",
                                                              overlayTripsRow
                                                                  .date,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            )}',
                                                            'title':
                                                                'تم حجز الرحلة بنجاح',
                                                            'image':
                                                                'https://i.ibb.co/tT2Q3MTJ/20250829-0041-Mobile-App-Icon-remix-01k3s9y9f1exw9tmyhe28wyqd3.png',
                                                            'type':
                                                                'booking_confirmed',
                                                            'screen': 'trip',
                                                            'booking_id': _model
                                                                .bookingDtod
                                                                ?.id,
                                                            'service': 'trip',
                                                          });
                                                          FFAppState().price =
                                                              functions.intPrice(
                                                                  valueOrDefault<
                                                                      double>(
                                                            ((overlayTripsRow
                                                                        .price!) +
                                                                    FFAppState()
                                                                        .delevery +
                                                                    FFAppState()
                                                                        .delevery2) *
                                                                (_model
                                                                    .countControllerValue!),
                                                            500.0,
                                                          ));
                                                          FFAppState().booking =
                                                              _model
                                                                  .bookingDtod!
                                                                  .id;
                                                          safeSetState(() {});
                                                          FFAppState()
                                                              .location = null;
                                                          FFAppState().up =
                                                              null;
                                                          FFAppState()
                                                              .upAddress = '';
                                                          FFAppState()
                                                              .delevery = 0.0;
                                                          FFAppState()
                                                              .delevery2 = 0.0;
                                                          FFAppState()
                                                              .distance = '';
                                                          FFAppState()
                                                                  .distination =
                                                              null;
                                                          FFAppState()
                                                              .duration = '';
                                                          FFAppState().from =
                                                              '';
                                                          FFAppState().to = '';
                                                          FFAppState().down =
                                                              null;
                                                          FFAppState()
                                                              .downAddress = '';
                                                          safeSetState(() {});

                                                          context.goNamed(
                                                            TripPayWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'tripid':
                                                                  serializeParam(
                                                                widget.tripID,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'status':
                                                                  serializeParam(
                                                                0,
                                                                ParamType.int,
                                                              ),
                                                              'booking':
                                                                  serializeParam(
                                                                _model
                                                                    .bookingDtod
                                                                    ?.id,
                                                                ParamType.int,
                                                              ),
                                                              'bookingRow':
                                                                  serializeParam(
                                                                _model
                                                                    .bookingDtod,
                                                                ParamType
                                                                    .SupabaseRow,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
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
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.36,
                                                                    child:
                                                                        DialogWidget(
                                                                      title: FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        arText:
                                                                            'يرجى اختيار الموقع',
                                                                        enText:
                                                                            'Please select a location',
                                                                      ),
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        arText:
                                                                            'في حال كنت ترغب برحلة من الباب للباب يرجى تحديد الموقع',
                                                                        enText:
                                                                            'If you would like a door-to-door service, please specify the location.',
                                                                      ),
                                                                      confirm: FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        arText:
                                                                            'حسناً',
                                                                        enText:
                                                                            'OK',
                                                                      ),
                                                                      dismessVis:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }
                                                      } else if ((_model
                                                                  .fromdoorValue ==
                                                              true) &&
                                                          (_model.todoor ==
                                                              false)) {
                                                        if ((FFAppState()
                                                                    .delevery !=
                                                                null) &&
                                                            (FFAppState()
                                                                    .delevery2 ==
                                                                null)) {
                                                          await TripsTable()
                                                              .update(
                                                            data: {
                                                              'Vehicle_seats':
                                                                  valueOrDefault<
                                                                      int>(
                                                                overlayTripsRow
                                                                        .vehicleSeats -
                                                                    (_model
                                                                        .countControllerValue!),
                                                                8,
                                                              ),
                                                              'booked_Seats':
                                                                  valueOrDefault<
                                                                      int>(
                                                                (overlayTripsRow
                                                                        .bookedSeats!) +
                                                                    (_model
                                                                        .countControllerValue!),
                                                                18,
                                                              ),
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              widget.tripID,
                                                            ),
                                                          );
                                                          _model.bookingDtod2 =
                                                              await BookingsTable()
                                                                  .insert({
                                                            'name': FFAppState()
                                                                .user
                                                                .name,
                                                            'from':
                                                                overlayTripsRow
                                                                    .from,
                                                            'trip_id':
                                                                widget.tripID,
                                                            'seats_num': _model
                                                                .countControllerValue,
                                                            'user_id':
                                                                FFAppState()
                                                                    .user
                                                                    .id,
                                                            'to':
                                                                overlayTripsRow
                                                                    .to,
                                                            'tripPrice':
                                                                overlayTripsRow
                                                                    .price,
                                                            'status': 0,
                                                            'price': functions
                                                                .intPrice(
                                                                    valueOrDefault<
                                                                        double>(
                                                              ((overlayTripsRow
                                                                          .price!) +
                                                                      FFAppState()
                                                                          .delevery) *
                                                                  (_model
                                                                      .countControllerValue!),
                                                              500.0,
                                                            )),
                                                            'barcode': random_data
                                                                .randomString(
                                                              10,
                                                              10,
                                                              false,
                                                              false,
                                                              true,
                                                            ),
                                                            'fromStation':
                                                                FFAppState()
                                                                    .location
                                                                    ?.toString(),
                                                            'toStation':
                                                                FFAppState()
                                                                    .down
                                                                    ?.toString(),
                                                            'date': supaSerialize<
                                                                    DateTime>(
                                                                overlayTripsRow
                                                                    .date),
                                                            'phone':
                                                                FFAppState()
                                                                    .user
                                                                    .phone,
                                                            'duration': FFAppState()
                                                                            .duration !=
                                                                        ''
                                                                ? FFAppState()
                                                                    .duration
                                                                : '15 دقيقة',
                                                          });
                                                          _model.notification2 =
                                                              await NotificationsTable()
                                                                  .insert({
                                                            'user_id':
                                                                FFAppState()
                                                                    .user
                                                                    .id,
                                                            'body':
                                                                '${overlayTripsRow.from} - ${overlayTripsRow.to} في ${dateTimeFormat(
                                                              "MMMMEEEEd",
                                                              overlayTripsRow
                                                                  .date,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            )}',
                                                            'title':
                                                                'تم حجز الرحلة بنجاح',
                                                            'image':
                                                                'https://i.ibb.co/tT2Q3MTJ/20250829-0041-Mobile-App-Icon-remix-01k3s9y9f1exw9tmyhe28wyqd3.png',
                                                            'type':
                                                                'booking_confirmed',
                                                            'screen': 'trip',
                                                            'booking_id': _model
                                                                .bookingDtod2
                                                                ?.id,
                                                            'service': 'trip',
                                                          });
                                                          FFAppState().price =
                                                              functions.intPrice(
                                                                  valueOrDefault<
                                                                      double>(
                                                            ((overlayTripsRow
                                                                        .price!) +
                                                                    FFAppState()
                                                                        .delevery) *
                                                                (_model
                                                                    .countControllerValue!),
                                                            500.0,
                                                          ));
                                                          FFAppState().booking =
                                                              _model
                                                                  .bookingDtod2!
                                                                  .id;
                                                          safeSetState(() {});
                                                          FFAppState()
                                                              .location = null;
                                                          FFAppState().up =
                                                              null;
                                                          FFAppState()
                                                              .upAddress = '';
                                                          FFAppState()
                                                              .delevery = 0.0;
                                                          FFAppState()
                                                              .delevery2 = 0.0;
                                                          FFAppState()
                                                              .distance = '';
                                                          FFAppState()
                                                                  .distination =
                                                              null;
                                                          FFAppState()
                                                              .duration = '';
                                                          FFAppState().from =
                                                              '';
                                                          FFAppState().to = '';
                                                          FFAppState().down =
                                                              null;
                                                          FFAppState()
                                                              .downAddress = '';
                                                          safeSetState(() {});

                                                          context.goNamed(
                                                            TripPayWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'tripid':
                                                                  serializeParam(
                                                                widget.tripID,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'status':
                                                                  serializeParam(
                                                                0,
                                                                ParamType.int,
                                                              ),
                                                              'booking':
                                                                  serializeParam(
                                                                _model
                                                                    .bookingDtod2
                                                                    ?.id,
                                                                ParamType.int,
                                                              ),
                                                              'bookingRow':
                                                                  serializeParam(
                                                                _model
                                                                    .bookingDtod2,
                                                                ParamType
                                                                    .SupabaseRow,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
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
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.36,
                                                                    child:
                                                                        DialogWidget(
                                                                      title: FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        arText:
                                                                            'يرجى اختيار الموقع',
                                                                        enText:
                                                                            'Please select a location',
                                                                      ),
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        arText:
                                                                            'في حال كنت ترغب برحلة من الباب للباب يرجى تحديد الموقع',
                                                                        enText:
                                                                            'If you would like a door-to-door service, please specify the location.',
                                                                      ),
                                                                      confirm: FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        arText:
                                                                            'حسناً',
                                                                        enText:
                                                                            'OK',
                                                                      ),
                                                                      dismessVis:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }
                                                      } else if ((_model
                                                                  .fromdoorValue ==
                                                              false) &&
                                                          (_model.todoor ==
                                                              true)) {
                                                        if ((FFAppState()
                                                                    .delevery ==
                                                                null) &&
                                                            (FFAppState()
                                                                    .delevery2 !=
                                                                null)) {
                                                          await TripsTable()
                                                              .update(
                                                            data: {
                                                              'Vehicle_seats':
                                                                  valueOrDefault<
                                                                      int>(
                                                                overlayTripsRow
                                                                        .vehicleSeats -
                                                                    (_model
                                                                        .countControllerValue!),
                                                                8,
                                                              ),
                                                              'booked_Seats':
                                                                  valueOrDefault<
                                                                      int>(
                                                                (overlayTripsRow
                                                                        .bookedSeats!) +
                                                                    (_model
                                                                        .countControllerValue!),
                                                                18,
                                                              ),
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              widget.tripID,
                                                            ),
                                                          );
                                                          _model.bookingDtod3 =
                                                              await BookingsTable()
                                                                  .insert({
                                                            'name': FFAppState()
                                                                .user
                                                                .name,
                                                            'from':
                                                                overlayTripsRow
                                                                    .from,
                                                            'trip_id':
                                                                widget.tripID,
                                                            'seats_num': _model
                                                                .countControllerValue,
                                                            'user_id':
                                                                FFAppState()
                                                                    .user
                                                                    .id,
                                                            'to':
                                                                overlayTripsRow
                                                                    .to,
                                                            'tripPrice':
                                                                overlayTripsRow
                                                                    .price,
                                                            'status': 0,
                                                            'price': functions
                                                                .intPrice(
                                                                    valueOrDefault<
                                                                        double>(
                                                              ((overlayTripsRow
                                                                          .price!) +
                                                                      FFAppState()
                                                                          .delevery2) *
                                                                  (_model
                                                                      .countControllerValue!),
                                                              500.0,
                                                            )),
                                                            'barcode': random_data
                                                                .randomString(
                                                              10,
                                                              10,
                                                              false,
                                                              false,
                                                              true,
                                                            ),
                                                            'fromStation':
                                                                FFAppState()
                                                                    .location
                                                                    ?.toString(),
                                                            'toStation':
                                                                FFAppState()
                                                                    .down
                                                                    ?.toString(),
                                                            'date': supaSerialize<
                                                                    DateTime>(
                                                                overlayTripsRow
                                                                    .date),
                                                            'phone':
                                                                FFAppState()
                                                                    .user
                                                                    .phone,
                                                            'duration': FFAppState()
                                                                            .duration !=
                                                                        ''
                                                                ? FFAppState()
                                                                    .duration
                                                                : '15 دقيقة',
                                                          });
                                                          _model.notification3 =
                                                              await NotificationsTable()
                                                                  .insert({
                                                            'user_id':
                                                                FFAppState()
                                                                    .user
                                                                    .id,
                                                            'body':
                                                                '${overlayTripsRow.from} - ${overlayTripsRow.to} في ${dateTimeFormat(
                                                              "MMMMEEEEd",
                                                              overlayTripsRow
                                                                  .date,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            )}',
                                                            'title':
                                                                'تم حجز الرحلة بنجاح',
                                                            'image':
                                                                'https://i.ibb.co/tT2Q3MTJ/20250829-0041-Mobile-App-Icon-remix-01k3s9y9f1exw9tmyhe28wyqd3.png',
                                                            'type':
                                                                'booking_confirmed',
                                                            'screen': 'trip',
                                                            'booking_id': _model
                                                                .bookingDtod3
                                                                ?.id,
                                                            'service': 'trip',
                                                          });
                                                          FFAppState().price =
                                                              functions.intPrice(
                                                                  valueOrDefault<
                                                                      double>(
                                                            ((overlayTripsRow
                                                                        .price!) +
                                                                    FFAppState()
                                                                        .delevery2) *
                                                                (_model
                                                                    .countControllerValue!),
                                                            500.0,
                                                          ));
                                                          FFAppState().booking =
                                                              _model
                                                                  .bookingDtod3!
                                                                  .id;
                                                          safeSetState(() {});
                                                          FFAppState()
                                                              .location = null;
                                                          FFAppState().up =
                                                              null;
                                                          FFAppState()
                                                              .upAddress = '';
                                                          FFAppState()
                                                              .delevery = 0.0;
                                                          FFAppState()
                                                              .delevery2 = 0.0;
                                                          FFAppState()
                                                              .distance = '';
                                                          FFAppState()
                                                                  .distination =
                                                              null;
                                                          FFAppState()
                                                              .duration = '';
                                                          FFAppState().from =
                                                              '';
                                                          FFAppState().to = '';
                                                          FFAppState().down =
                                                              null;
                                                          FFAppState()
                                                              .downAddress = '';
                                                          safeSetState(() {});

                                                          context.goNamed(
                                                            TripPayWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'tripid':
                                                                  serializeParam(
                                                                widget.tripID,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'status':
                                                                  serializeParam(
                                                                0,
                                                                ParamType.int,
                                                              ),
                                                              'booking':
                                                                  serializeParam(
                                                                _model
                                                                    .bookingDtod3
                                                                    ?.id,
                                                                ParamType.int,
                                                              ),
                                                              'bookingRow':
                                                                  serializeParam(
                                                                _model
                                                                    .bookingDtod3,
                                                                ParamType
                                                                    .SupabaseRow,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
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
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.36,
                                                                    child:
                                                                        DialogWidget(
                                                                      title: FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        arText:
                                                                            'يرجى اختيار الموقع',
                                                                        enText:
                                                                            'Please select a location',
                                                                      ),
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        arText:
                                                                            'في حال كنت ترغب برحلة من الباب للباب يرجى تحديد الموقع',
                                                                        enText:
                                                                            'If you would like a door-to-door service, please specify the location.',
                                                                      ),
                                                                      confirm: FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        arText:
                                                                            'حسناً',
                                                                        enText:
                                                                            'OK',
                                                                      ),
                                                                      dismessVis:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }
                                                      } else {
                                                        if ((_model.fromStationValue !=
                                                                    null &&
                                                                _model.fromStationValue !=
                                                                    '') &&
                                                            (_model.toStationValue !=
                                                                    null &&
                                                                _model.toStationValue !=
                                                                    '')) {
                                                          await TripsTable()
                                                              .update(
                                                            data: {
                                                              'Vehicle_seats':
                                                                  valueOrDefault<
                                                                      int>(
                                                                overlayTripsRow
                                                                        .vehicleSeats -
                                                                    (_model
                                                                        .countControllerValue!),
                                                                8,
                                                              ),
                                                              'booked_Seats':
                                                                  valueOrDefault<
                                                                      int>(
                                                                (overlayTripsRow
                                                                        .bookedSeats!) +
                                                                    (_model
                                                                        .countControllerValue!),
                                                                18,
                                                              ),
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'id',
                                                              widget.tripID,
                                                            ),
                                                          );
                                                          _model.bookingStations =
                                                              await BookingsTable()
                                                                  .insert({
                                                            'name': FFAppState()
                                                                .user
                                                                .name,
                                                            'from':
                                                                overlayTripsRow
                                                                    .from,
                                                            'trip_id':
                                                                widget.tripID,
                                                            'seats_num': _model
                                                                .countControllerValue,
                                                            'user_id':
                                                                FFAppState()
                                                                    .user
                                                                    .id,
                                                            'to':
                                                                overlayTripsRow
                                                                    .to,
                                                            'tripPrice':
                                                                overlayTripsRow
                                                                    .price,
                                                            'status': 0,
                                                            'price': (overlayTripsRow
                                                                    .price!) *
                                                                (_model
                                                                    .countControllerValue!),
                                                            'barcode': random_data
                                                                .randomString(
                                                              10,
                                                              10,
                                                              false,
                                                              false,
                                                              true,
                                                            ),
                                                            'fromStation': _model
                                                                .fromStationValue,
                                                            'toStation': _model
                                                                .toStationValue,
                                                            'date': supaSerialize<
                                                                    DateTime>(
                                                                overlayTripsRow
                                                                    .date),
                                                            'phone':
                                                                FFAppState()
                                                                    .user
                                                                    .phone,
                                                            'duration': FFAppState()
                                                                            .duration !=
                                                                        ''
                                                                ? FFAppState()
                                                                    .duration
                                                                : '15 دقيقة',
                                                          });
                                                          _model.notification =
                                                              await NotificationsTable()
                                                                  .insert({
                                                            'user_id':
                                                                FFAppState()
                                                                    .user
                                                                    .id,
                                                            'body':
                                                                '${overlayTripsRow.from} - ${overlayTripsRow.to} في ${dateTimeFormat(
                                                              "MMMMEEEEd",
                                                              overlayTripsRow
                                                                  .date,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            )}',
                                                            'title':
                                                                'تم حجز الرحلة بنجاح',
                                                            'image':
                                                                'https://i.ibb.co/tT2Q3MTJ/20250829-0041-Mobile-App-Icon-remix-01k3s9y9f1exw9tmyhe28wyqd3.png',
                                                            'type':
                                                                'booking_confirmed',
                                                            'screen': 'trip',
                                                            'booking_id': _model
                                                                .bookingStations
                                                                ?.id,
                                                            'service': 'trip',
                                                          });
                                                          FFAppState().price =
                                                              (overlayTripsRow
                                                                      .price!) *
                                                                  (_model
                                                                      .countControllerValue!);
                                                          FFAppState().booking =
                                                              _model
                                                                  .bookingStations!
                                                                  .id;
                                                          safeSetState(() {});
                                                          FFAppState()
                                                              .location = null;
                                                          FFAppState().up =
                                                              null;
                                                          FFAppState()
                                                              .upAddress = '';
                                                          FFAppState()
                                                              .delevery = 0.0;
                                                          FFAppState()
                                                              .delevery2 = 0.0;
                                                          FFAppState()
                                                              .distance = '';
                                                          FFAppState()
                                                                  .distination =
                                                              null;
                                                          FFAppState()
                                                              .duration = '';
                                                          FFAppState().from =
                                                              '';
                                                          FFAppState().to = '';
                                                          FFAppState().down =
                                                              null;
                                                          FFAppState()
                                                              .downAddress = '';
                                                          safeSetState(() {});

                                                          context.goNamed(
                                                            TripPayWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'tripid':
                                                                  serializeParam(
                                                                widget.tripID,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'status':
                                                                  serializeParam(
                                                                0,
                                                                ParamType.int,
                                                              ),
                                                              'booking':
                                                                  serializeParam(
                                                                _model
                                                                    .bookingStations
                                                                    ?.id,
                                                                ParamType.int,
                                                              ),
                                                              'bookingRow':
                                                                  serializeParam(
                                                                _model
                                                                    .bookingStations,
                                                                ParamType
                                                                    .SupabaseRow,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
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
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.32,
                                                                    child:
                                                                        DialogWidget(
                                                                      title: FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        arText:
                                                                            'يرجى اختيار المواقف',
                                                                        enText:
                                                                            'Please select positions',
                                                                      ),
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        arText:
                                                                            'يرجى اختيار مواقف الصعود والنزول',
                                                                        enText:
                                                                            'Please select your pick-up and drop-off positions.',
                                                                      ),
                                                                      confirm: FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        arText:
                                                                            'حسناً',
                                                                        enText:
                                                                            'OK',
                                                                      ),
                                                                      dismessVis:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'e04j8cyd' /* احجز الآن */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.45,
                                                      height: 48.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xFF2D5050),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoKufiArabic(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                        ]
                                            .divide(SizedBox(height: 8.0))
                                            .around(SizedBox(height: 8.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].addToEnd(SizedBox(height: 16.0)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
