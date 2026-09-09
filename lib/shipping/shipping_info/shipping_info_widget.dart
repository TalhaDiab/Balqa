import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/travel/mapy/mapy_widget.dart';
import '/zcomponents/dialog/dialog_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'shipping_info_model.dart';
export 'shipping_info_model.dart';

class ShippingInfoWidget extends StatefulWidget {
  const ShippingInfoWidget({
    super.key,
    this.kmPrice,
    this.sizes,
    required this.prices,
    this.from,
    this.branches,
    required this.pay,
    required this.ltlng,
    required this.dollar,
    required this.euro,
    required this.currency,
    required this.cityList,
  });

  final double? kmPrice;
  final List<String>? sizes;
  final List<double>? prices;
  final List<String>? from;
  final List<String>? branches;
  final bool? pay;
  final List<String>? ltlng;
  final List<double>? dollar;
  final List<double>? euro;
  final List<String>? currency;
  final List<String>? cityList;

  static String routeName = 'shippingInfo';
  static String routePath = 'shippingInfo';

  @override
  State<ShippingInfoWidget> createState() => _ShippingInfoWidgetState();
}

class _ShippingInfoWidgetState extends State<ShippingInfoWidget> {
  late ShippingInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShippingInfoModel());

    _model.recipientTextController ??= TextEditingController();
    _model.recipientFocusNode ??= FocusNode();

    _model.recipientPhoneTextController ??= TextEditingController();
    _model.recipientPhoneFocusNode ??= FocusNode();

    _model.sensValue = false;
    _model.directlyValue = false;
    _model.containsTextController ??= TextEditingController();
    _model.containsFocusNode ??= FocusNode();

    _model.notesTextController ??= TextEditingController();
    _model.notesFocusNode ??= FocusNode();

    _model.oppositeValue = false;
    _model.amuontTextController ??= TextEditingController();
    _model.amuontFocusNode ??= FocusNode();

    _model.paymentTextController ??= TextEditingController();
    _model.paymentFocusNode ??= FocusNode();

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
      safeSetState(() {
        _model.recipientTextController?.clear();
        _model.recipientPhoneTextController?.clear();
        _model.containsTextController?.clear();
        _model.notesTextController?.clear();
        _model.amuontTextController?.clear();
        _model.paymentTextController?.clear();
      });
    }();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      excludeFromSemantics: true,
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
                FFLocalizations.of(context).getText(
                  'uqp9m9jr' /* أدخل معلومات الشحنة */,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Builder(
                  builder: (context) {
                    if (_model.pricing != true) {
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 1.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.co_present,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            AnimatedDefaultTextStyle(
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLargeFamily,
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLargeIsCustom,
                                                      ),
                                              duration:
                                                  Duration(milliseconds: 600),
                                              curve: Curves.easeIn,
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '1vyh10j2' /* المرسل إليه */,
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 48.0,
                                                decoration: BoxDecoration(),
                                                child: TextFormField(
                                                  controller: _model
                                                      .recipientTextController,
                                                  focusNode:
                                                      _model.recipientFocusNode,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumIsCustom,
                                                            ),
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'kg0d0pup' /* اسم المرسل إليه */,
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
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                                .primary,
                                                        width: 0.3,
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
                                                        width: 0.3,
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
                                                        width: 0.3,
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
                                                        width: 0.3,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                  validator: _model
                                                      .recipientTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 48.0,
                                                  decoration: BoxDecoration(),
                                                  child: TextFormField(
                                                    controller: _model
                                                        .recipientPhoneTextController,
                                                    focusNode: _model
                                                        .recipientPhoneFocusNode,
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumIsCustom,
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '1am81db1' /* هاتف المرسل إليه */,
                                                      ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumIsCustom,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 0.3,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 0.3,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 0.3,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 0.3,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                    keyboardType:
                                                        TextInputType.phone,
                                                    validator: _model
                                                        .recipientPhoneTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(height: 12.0))
                                          .around(SizedBox(height: 12.0)),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 1.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.boxOpen,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 22.0,
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ki43h5lm' /* الشحنة */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLargeFamily,
                                                        color: Colors.black,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLargeIsCustom,
                                                      ),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'zei7nabo' /* محتويات معرضة للتلف أو حساسة؟ */,
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
                                            ),
                                            Switch.adaptive(
                                              value: _model.sensValue!,
                                              onChanged: (newValue) async {
                                                safeSetState(() => _model
                                                    .sensValue = newValue);
                                              },
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              activeTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              inactiveTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              inactiveThumbColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '6k9kqp8d' /* شحن مباشر؟ */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.info_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 16.0,
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'e8m8kwpw' /* تنطبق رسوم إضافية */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 4.0)),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'sma6kjjy' /* (اختياري) */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                                Switch.adaptive(
                                                  value: _model.directlyValue!,
                                                  onChanged: (newValue) async {
                                                    safeSetState(() =>
                                                        _model.directlyValue =
                                                            newValue);
                                                    if (newValue) {
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'تنبيه التكلفة'),
                                                                    content: Text(
                                                                        '**الشحن المباشر** هو خدمة نقل مخصصة بين المحافظات، تُنفَّذ مباشرةً دون المرور بمراحل الشحن المعتادة. يتم تحديد تكلفة الخدمة بعد مراجعة تفاصيل الشحنة من قبل فريقنا، ثم التواصل معكم لتأكيد السعر وإتمام الطلب.'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'إلغاء'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: Text(
                                                                            'تأكيد'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ) ??
                                                              false;
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
                                              ].divide(SizedBox(width: 4.0)),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'gqz04jrd' /* حجم الشحنة */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                  ),
                                                  ClipRRect(
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child:
                                                          FlutterFlowChoiceChips(
                                                        options: widget.sizes!
                                                            .map((label) =>
                                                                ChipData(label))
                                                            .toList(),
                                                        onChanged: (val) =>
                                                            safeSetState(() => _model
                                                                    .sizeValue =
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
                                                                    fontSize:
                                                                        16.0,
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
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
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
                                                                    fontSize:
                                                                        16.0,
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
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        chipSpacing: 8.0,
                                                        rowSpacing: 8.0,
                                                        multiselect: false,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        controller: _model
                                                                .sizeValueController ??=
                                                            FormFieldController<
                                                                List<String>>(
                                                          [],
                                                        ),
                                                        wrapped: false,
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '4hftjos1' /* عدد الطرود: */,
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
                                              ),
                                              Material(
                                                color: Colors.transparent,
                                                child: Container(
                                                  width: 138.0,
                                                  height: 44.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    shape: BoxShape.rectangle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 0.3,
                                                    ),
                                                  ),
                                                  child:
                                                      FlutterFlowCountController(
                                                    decrementIconBuilder:
                                                        (enabled) => Icon(
                                                      Icons.remove_rounded,
                                                      color: enabled
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText
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
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      size: 24.0,
                                                    ),
                                                    countBuilder: (count) =>
                                                        Text(
                                                      count.toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily,
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeIsCustom,
                                                          ),
                                                    ),
                                                    count: _model
                                                        .boxesCountValue ??= 1,
                                                    updateCount: (count) async {
                                                      safeSetState(() => _model
                                                              .boxesCountValue =
                                                          count);
                                                      safeSetState(() {});
                                                    },
                                                    stepSize: 1,
                                                    minimum: 1,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '4mfxvdq1' /* المحتويات */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 48.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .containsTextController,
                                                        focusNode: _model
                                                            .containsFocusNode,
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .labelMediumIsCustom,
                                                                  ),
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'qocflv5z' /* يرجى وصف محتويات الشحنة */,
                                                          ),
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .labelMediumIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFF1D4847),
                                                              width: 0.3,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 0.3,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 0.3,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 0.3,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .containsTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
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
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'aqnvqp0m' /* ملاحظات: */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
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
                                                          '3bywugh9' /* (اختياري) */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 48.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .notesTextController,
                                                        focusNode: _model
                                                            .notesFocusNode,
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .labelMediumIsCustom,
                                                                  ),
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'fnfe1daf' /* قابلة للكسر .. ضعها بشكل أفقي ... */,
                                                          ),
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .labelMediumIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFF1D4847),
                                                              width: 0.3,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 0.3,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 0.3,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 0.3,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .notesTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]
                                          .divide(SizedBox(height: 12.0))
                                          .around(SizedBox(height: 12.0)),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 1.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.payments_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ylp3tjm5' /* معلومات الدفع */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLargeFamily,
                                                        color: Colors.black,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLargeIsCustom,
                                                      ),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '7tjim4tn' /* الأجور من: */,
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
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FlutterFlowRadioButton(
                                                  options: [
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'v9oph9cn' /* المرسل (أنا) */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '1wwbc1pb' /* المرسل إليه */,
                                                    )
                                                  ].toList(),
                                                  onChanged: (val) =>
                                                      safeSetState(() {}),
                                                  controller: _model
                                                          .payByValueController ??=
                                                      FormFieldController<
                                                          String>(null),
                                                  optionHeight: 32.0,
                                                  textStyle:
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
                                                  selectedTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                  buttonPosition:
                                                      RadioButtonPosition.left,
                                                  direction: Axis.vertical,
                                                  radioButtonColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  inactiveRadioButtonColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  toggleable: false,
                                                  horizontalAlignment:
                                                      WrapAlignment.start,
                                                  verticalAlignment:
                                                      WrapCrossAlignment.start,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'm94aw6pb' /* حوالة ضد الدفع؟ */,
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
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Switch.adaptive(
                                                  value: _model.oppositeValue!,
                                                  onChanged: (newValue) async {
                                                    safeSetState(() =>
                                                        _model.oppositeValue =
                                                            newValue);
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
                                              ],
                                            ),
                                          ],
                                        ),
                                        if (_model.oppositeValue == true)
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
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
                                                          'vceytl2p' /* القيمة المطلوب تحصيلها */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
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
                                                          'wpp9ar50' /* * لا تشمل أجور الشحن */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              fontSize: 11.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: 90.0,
                                                    height: 48.0,
                                                    decoration: BoxDecoration(),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .amuontTextController,
                                                      focusNode: _model
                                                          .amuontFocusNode,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '3vy0opka' /* 000 */,
                                                        ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFF1D4847),
                                                            width: 0.3,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 0.3,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 0.3,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 0.3,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsets.all(
                                                                12.0),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                      keyboardType:
                                                          const TextInputType
                                                              .numberWithOptions(
                                                              decimal: true),
                                                      validator: _model
                                                          .amuontTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 12.0)),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: ClipRRect(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child:
                                                            FlutterFlowChoiceChips(
                                                          options: [
                                                            ChipData(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'v5ljoszn' /* ليرة سورية */,
                                                            )),
                                                            ChipData(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              '3pwelgwr' /* دولار */,
                                                            )),
                                                            ChipData(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'z8wlm238' /* يورو */,
                                                            ))
                                                          ],
                                                          onChanged: (val) =>
                                                              safeSetState(() =>
                                                                  _model.currencyValue =
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
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            iconColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            iconSize: 16.0,
                                                            elevation: 1.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
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
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            iconColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            iconSize: 16.0,
                                                            elevation: 0.0,
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            borderWidth: 0.3,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          chipSpacing: 12.0,
                                                          rowSpacing: 8.0,
                                                          multiselect: false,
                                                          initialized: _model
                                                                  .currencyValue !=
                                                              null,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          controller: _model
                                                                  .currencyValueController ??=
                                                              FormFieldController<
                                                                  List<String>>(
                                                            [
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '7qxhznh6' /* ليرة سورية */,
                                                              )
                                                            ],
                                                          ),
                                                          wrapped: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ].divide(SizedBox(height: 12.0)),
                                          ),
                                      ]
                                          .divide(SizedBox(height: 12.0))
                                          .around(SizedBox(height: 12.0)),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 1.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 22.0,
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'sg9hwf8x' /* الموقع */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLargeFamily,
                                                        color: Colors.black,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLargeIsCustom,
                                                      ),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
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
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'g4e8ajys' /* اختر موقعك */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
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
                                                                        excludeFromSemantics:
                                                                            true,
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(context)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                600.0,
                                                                            child:
                                                                                MapyWidget(
                                                                              price: _model.currencyValue != 'ليرة سورية' ? 0.4 : widget.kmPrice!,
                                                                              title: 'up',
                                                                              citylist: widget.cityList!,
                                                                              ltlng: widget.ltlng!,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));
                                                                },
                                                                text:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  FFAppState().upAddress !=
                                                                              ''
                                                                      ? FFAppState()
                                                                          .upAddress
                                                                      : 'اختر موقعك',
                                                                  'اختر موقعك',
                                                                ),
                                                                icon: Icon(
                                                                  Icons
                                                                      .location_on,
                                                                  size: 15.0,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.82,
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
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
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                      ),
                                                                  elevation:
                                                                      1.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            FlutterFlowRadioButton(
                                              options: [
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'c35joa4q' /* موقع المرسل إليه */,
                                                ),
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'epyzrx0g' /* تسليم في فروعنا */,
                                                )
                                              ].toList(),
                                              onChanged: (val) =>
                                                  safeSetState(() {}),
                                              controller: _model
                                                      .recLocaValueController ??=
                                                  FormFieldController<String>(
                                                      null),
                                              optionHeight: 32.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMediumIsCustom,
                                                      ),
                                              selectedTextStyle:
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
                                              buttonPosition:
                                                  RadioButtonPosition.left,
                                              direction: Axis.vertical,
                                              radioButtonColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              inactiveRadioButtonColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              toggleable: false,
                                              horizontalAlignment:
                                                  WrapAlignment.start,
                                              verticalAlignment:
                                                  WrapCrossAlignment.start,
                                            ),
                                            if (_model.recLocaValue ==
                                                'موقع المرسل إليه')
                                              Expanded(
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
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
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                excludeFromSemantics:
                                                                    true,
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        600.0,
                                                                    child:
                                                                        MapyWidget(
                                                                      price: _model.currencyValue !=
                                                                              'ليرة سورية'
                                                                          ? 0.4
                                                                          : widget
                                                                              .kmPrice!,
                                                                      title:
                                                                          'down',
                                                                      citylist:
                                                                          widget
                                                                              .cityList!,
                                                                      ltlng: widget
                                                                          .ltlng!,
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
                                                              : 'اختر موقع التسليم',
                                                          'اختر موقع التسليم',
                                                        ),
                                                        icon: Icon(
                                                          Icons.location_on,
                                                          size: 15.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.82,
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
                                                          elevation: 1.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if ((_model.recLocaValue ==
                                                          'تسليم في فروعنا') ||
                                                      (_model.recLocaValue ==
                                                          'Delivery at our branches'))
                                                    Expanded(
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
                                                              'usrnxuh4' /* المحافظة */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                          Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 0.0,
                                                            child: Container(
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child:
                                                                  FlutterFlowDropDown<
                                                                      String>(
                                                                controller: _model
                                                                        .governorateValueController ??=
                                                                    FormFieldController<
                                                                            String>(
                                                                        null),
                                                                options: widget
                                                                    .from!,
                                                                onChanged: (val) =>
                                                                    safeSetState(() =>
                                                                        _model.governorateValue =
                                                                            val),
                                                                width: double
                                                                    .infinity,
                                                                height: 40.0,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      lineHeight:
                                                                          1.47,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                                hintText:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  'm7jee8rh' /* اختر المحافظة */,
                                                                ),
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 2.0,
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                borderWidth:
                                                                    1.0,
                                                                borderRadius:
                                                                    16.0,
                                                                margin: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                                hidesUnderline:
                                                                    true,
                                                                isOverButton:
                                                                    false,
                                                                isSearchable:
                                                                    false,
                                                                isMultiSelect:
                                                                    false,
                                                                labelText:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  'tijric92' /* الفئة */,
                                                                ),
                                                                labelTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          lineHeight:
                                                                              1.38,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                        ),
                                                              ),
                                                            ),
                                                          ),
                                                          if (_model.governorateValue !=
                                                                  null &&
                                                              _model.governorateValue !=
                                                                  '')
                                                            FutureBuilder<
                                                                List<
                                                                    BranchesRow>>(
                                                              future: BranchesTable()
                                                                  .querySingleRow(
                                                                queryFn: (q) =>
                                                                    q.orGroupOrNull(
                                                                        orFilterGroup([
                                                                  orFilterLeaf(
                                                                      'governorateAr',
                                                                      'eq',
                                                                      _model
                                                                          .governorateValue),
                                                                  orFilterLeaf(
                                                                      'governorateEn',
                                                                      'eq',
                                                                      _model
                                                                          .governorateValue),
                                                                ], isAnd: false)),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          SpinKitFadingCircle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            50.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<BranchesRow>
                                                                    containerBranchesRowList =
                                                                    snapshot
                                                                        .data!;

                                                                final containerBranchesRow =
                                                                    containerBranchesRowList
                                                                            .isNotEmpty
                                                                        ? containerBranchesRowList
                                                                            .first
                                                                        : null;

                                                                return Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 48.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      width:
                                                                          0.4,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      FlutterFlowDropDown<
                                                                          String>(
                                                                    controller: _model
                                                                        .branchesValueController ??= FormFieldController<
                                                                            String>(
                                                                        null),
                                                                    options: FFLocalizations.of(context).languageCode ==
                                                                            'ar'
                                                                        ? containerBranchesRow!
                                                                            .name
                                                                        : containerBranchesRow!
                                                                            .nameEn,
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.branchesValue =
                                                                                val),
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        40.0,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          lineHeight:
                                                                              1.47,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'udmyk8bk' /* اختر مركز التسليم */,
                                                                    ),
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    borderWidth:
                                                                        1.0,
                                                                    borderRadius:
                                                                        16.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    isOverButton:
                                                                        false,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                    labelText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'q0rfp7r6' /* الفئة */,
                                                                    ),
                                                                    labelTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          lineHeight:
                                                                              1.38,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                        ].divide(SizedBox(
                                                            height: 8.0)),
                                                      ),
                                                    ),
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 12.0)),
                                        ),
                                      ]
                                          .divide(SizedBox(height: 12.0))
                                          .around(SizedBox(height: 12.0)),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 0.3,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]
                                    .addToStart(SizedBox(width: 16.0))
                                    .addToEnd(SizedBox(width: 16.0)),
                              ),
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.83,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'zrvy7fh1' /* نعتذر عن شحن أي نوع من الأسلحة... */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 4.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      TermsWidget.routeName);
                                                },
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'y4tm2hkq' /* *يرجى مراجعة الشروط والأحكام */,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
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
                            ]
                                .divide(SizedBox(height: 12.0))
                                .addToStart(SizedBox(height: 12.0))
                                .addToEnd(SizedBox(height: 12.0)),
                          ),
                        ),
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 4.0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 1.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.89,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'tesyg7k2' /* المرسل إليه */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLargeIsCustom,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
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
                                                        _model
                                                            .recipientTextController
                                                            .text,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyLarge
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLargeFamily,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLargeIsCustom,
                                                            ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          _model
                                                              .recipientPhoneTextController
                                                              .text,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmallIsCustom,
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
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ifew1cdx' /* نوع الشحنة */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMediumIsCustom,
                                                      ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                _model.sizeValue,
                                                'شحنة ورقية',
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
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'h5dr2chn' /* من */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMediumIsCustom,
                                                      ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                FFAppState().upAddress,
                                                'دمشق',
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
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '1ts3xs2n' /* إلى */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMediumIsCustom,
                                                      ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                FFAppState().downAddress,
                                                'حمص',
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
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 16.0),
                                        child: StyledDivider(
                                          thickness: 0.0,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          lineStyle:
                                              DividerLineStyle.dashdotted,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '023dlf6p' /* عدد الطرود */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMediumIsCustom,
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    _model.boxesCountValue
                                                        ?.toString(),
                                                    '1',
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                                Text(
                                                  () {
                                                    if (_model.currencyValue ==
                                                        'دولار أمريكي') {
                                                      return FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        arText: '\$',
                                                        enText: '\$',
                                                      );
                                                    } else if (_model
                                                            .currencyValue ==
                                                        'يورو') {
                                                      return FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        arText: 'يورو',
                                                        enText: 'Euro',
                                                      );
                                                    } else {
                                                      return FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        arText: 'ل.س',
                                                        enText: 'S.P',
                                                      );
                                                    }
                                                  }(),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ].divide(SizedBox(width: 4.0)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '582u1mvs' /* تكلفة الشحن */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMediumIsCustom,
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    _model.price?.toString(),
                                                    '00',
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                                Text(
                                                  () {
                                                    if (_model.currencyValue ==
                                                        'دولار أمريكي') {
                                                      return FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        arText: '\$',
                                                        enText: '\$',
                                                      );
                                                    } else if (_model
                                                            .currencyValue ==
                                                        'يورو') {
                                                      return FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        arText: 'يورو',
                                                        enText: 'Euro',
                                                      );
                                                    } else {
                                                      return FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        arText: 'ل.س',
                                                        enText: 'S.P',
                                                      );
                                                    }
                                                  }(),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ].divide(SizedBox(width: 4.0)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '31cni4wo' /* التوصيل من موقعك */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMediumIsCustom,
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    FFAppState()
                                                        .delevery
                                                        .toString(),
                                                    '00',
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                                Text(
                                                  () {
                                                    if (_model.currencyValue ==
                                                        'دولار أمريكي') {
                                                      return FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        arText: '\$',
                                                        enText: '\$',
                                                      );
                                                    } else if (_model
                                                            .currencyValue ==
                                                        'يورو') {
                                                      return FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        arText: 'يورو',
                                                        enText: 'Euro',
                                                      );
                                                    } else {
                                                      return FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        arText: 'ل.س',
                                                        enText: 'S.P',
                                                      );
                                                    }
                                                  }(),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ].divide(SizedBox(width: 4.0)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'iskboi3z' /* التوصيل إلى موقع المرسل إليه */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMediumIsCustom,
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    FFAppState()
                                                        .delevery2
                                                        .toString(),
                                                    '00',
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                                Text(
                                                  () {
                                                    if (_model.currencyValue ==
                                                        'دولار أمريكي') {
                                                      return FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        arText: '\$',
                                                        enText: '\$',
                                                      );
                                                    } else if (_model
                                                            .currencyValue ==
                                                        'يورو') {
                                                      return FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        arText: 'يورو',
                                                        enText: 'Euro',
                                                      );
                                                    } else {
                                                      return FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        arText: 'ل.س',
                                                        enText: 'S.P',
                                                      );
                                                    }
                                                  }(),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ].divide(SizedBox(width: 4.0)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (_model.oppositeValue ?? true)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '1z6a0ro5' /* المبلغ المطلوب تحصيله */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMediumIsCustom,
                                                        ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          _model
                                                              .amountOppositepay
                                                              ?.toString(),
                                                          '00',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                      ),
                                                      Text(
                                                        () {
                                                          if (_model
                                                                  .currencyValue ==
                                                              'دولار أمريكي') {
                                                            return FFLocalizations
                                                                    .of(context)
                                                                .getVariableText(
                                                              arText: '\$',
                                                              enText: '\$',
                                                            );
                                                          } else if (_model
                                                                  .currencyValue ==
                                                              'يورو') {
                                                            return FFLocalizations
                                                                    .of(context)
                                                                .getVariableText(
                                                              arText: 'يورو',
                                                              enText: 'Euro',
                                                            );
                                                          } else {
                                                            return FFLocalizations
                                                                    .of(context)
                                                                .getVariableText(
                                                              arText: 'ل.س',
                                                              enText: 'S.P',
                                                            );
                                                          }
                                                        }(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 4.0)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'm97hxyoo' /* العمولة على المبلغ (ضد الدفع) */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMediumIsCustom,
                                                        ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          _model.commision
                                                              ?.toString(),
                                                          '00',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                      ),
                                                      Text(
                                                        () {
                                                          if (_model
                                                                  .currencyValue ==
                                                              'دولار أمريكي') {
                                                            return FFLocalizations
                                                                    .of(context)
                                                                .getVariableText(
                                                              arText: '\$',
                                                              enText: '\$',
                                                            );
                                                          } else if (_model
                                                                  .currencyValue ==
                                                              'يورو') {
                                                            return FFLocalizations
                                                                    .of(context)
                                                                .getVariableText(
                                                              arText: 'يورو',
                                                              enText: 'Euro',
                                                            );
                                                          } else {
                                                            return FFLocalizations
                                                                    .of(context)
                                                                .getVariableText(
                                                              arText: 'ل.س',
                                                              enText: 'S.P',
                                                            );
                                                          }
                                                        }(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 4.0)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'njgy3al7' /* الإجمالي: */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMediumIsCustom,
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    _model.total?.toString(),
                                                    '00',
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                                Text(
                                                  () {
                                                    if (_model.currencyValue ==
                                                        'دولار أمريكي') {
                                                      return FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        arText: '\$',
                                                        enText: '\$',
                                                      );
                                                    } else if (_model
                                                            .currencyValue ==
                                                        'يورو') {
                                                      return FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        arText: 'يورو',
                                                        enText: 'Euro',
                                                      );
                                                    } else {
                                                      return FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        arText: 'ل.س',
                                                        enText: 'S.P',
                                                      );
                                                    }
                                                  }(),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ].divide(SizedBox(width: 4.0)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 16.0),
                                        child: StyledDivider(
                                          thickness: 0.0,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          lineStyle:
                                              DividerLineStyle.dashdotted,
                                        ),
                                      ),
                                      if (widget.pay ?? true)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 12.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'dpr4belr' /* طريقة الدفع */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLargeIsCustom,
                                                        ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FlutterFlowRadioButton(
                                                  options: [
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'toxpdvja' /* الدفع عند وصول المندوب */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'n91lpj9e' /* الدفع مسبقاً */,
                                                    )
                                                  ].toList(),
                                                  onChanged: (val) =>
                                                      safeSetState(() {}),
                                                  controller: _model
                                                          .radioButtonValueController ??=
                                                      FormFieldController<
                                                          String>(null),
                                                  optionHeight: 32.0,
                                                  textStyle:
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
                                                  selectedTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                  buttonPosition:
                                                      RadioButtonPosition.left,
                                                  direction: Axis.vertical,
                                                  radioButtonColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  inactiveRadioButtonColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  toggleable: false,
                                                  horizontalAlignment:
                                                      WrapAlignment.start,
                                                  verticalAlignment:
                                                      WrapCrossAlignment.start,
                                                ),
                                              ].divide(SizedBox(width: 4.0)),
                                            ),
                                            if (_model.radioButtonValue ==
                                                'الدفع مسبقاً')
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Card(
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Container(
                                                      height: 60.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Row(
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
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: 55.0,
                                                                  height: 55.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSb8QZvNNnSnrZS5XUgzXTxTb6uAALx_hyE1g&s',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'me2641d1' /* شام كاش */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                          ),
                                                                    ),
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'bbyltb8c' /* انقر لنسخ رقم الحساب */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                          ),
                                                                    )),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderRadius: 8.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .content_copy,
                                                              color: Color(
                                                                  0xFF1D4847),
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await Clipboard.setData(
                                                                  ClipboardData(
                                                                      text:
                                                                          'adddce53cea4c5e65b2a377d86cd25b6'));
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Card(
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    elevation: 0.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .paymentTextController,
                                                        focusNode: _model
                                                            .paymentFocusNode,
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .labelMediumIsCustom,
                                                                  ),
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'm5p8iwcs' /* أدخل رمز عملية التحويل */,
                                                          ),
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .labelMediumIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFF1D4847),
                                                              width: 0.3,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              width: 0.3,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 0.3,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 0.3,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                        validator: _model
                                                            .paymentTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 12.0)),
                                              ),
                                          ],
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 16.0),
                                        child: StyledDivider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          lineStyle: DividerLineStyle.dashed,
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '77yvhpy5' /* 📌 ملاحظات: */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLargeFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .labelLargeIsCustom,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            's6ineerg' /* لضمان أفضل جودة للخدمة، قد يتم... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLargeIsCustom,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            if (_model.pricing != true) {
                              if ((_model.recipientTextController.text !=
                                          '') &&
                                  (_model.recipientPhoneTextController
                                              .text !=
                                          '') &&
                                  (_model.payByValue != null &&
                                      _model.payByValue != '') &&
                                  (_model.containsTextController.text !=
                                          '') &&
                                  (_model.sizeValue != null &&
                                      _model.sizeValue != '') &&
                                  (FFAppState().upAddress != '') &&
                                  ((FFAppState().downAddress != '') ||
                                      (_model.branchesValue != null &&
                                          _model.branchesValue != ''))) {
                                if (_model.oppositeValue == true) {
                                  _model.commision = double.parse(
                                          _model.amuontTextController.text) *
                                      0.05;
                                  _model.amountOppositepay = double.tryParse(
                                      _model.amuontTextController.text);
                                  safeSetState(() {});
                                  if ((_model.amuontTextController.text !=
                                              '') &&
                                      (_model.currencyValue != null &&
                                          _model.currencyValue != '')) {
                                    _model.pricing = true;
                                    _model.price = valueOrDefault<int>(
                                      functions.intPrice(valueOrDefault<double>(
                                        valueOrDefault<double>(
                                              functions.getPriceBySize(
                                                  widget.sizes?.toList(),
                                                  () {
                                                    if ((_model.currencyValue ==
                                                            'دولار أمريكي') ||
                                                        (_model.currencyValue ==
                                                            'USD')) {
                                                      return widget.dollar;
                                                    } else if ((_model
                                                                .currencyValue ==
                                                            'يورو') ||
                                                        (_model.currencyValue ==
                                                            'EURO')) {
                                                      return widget.euro;
                                                    } else {
                                                      return widget.prices;
                                                    }
                                                  }()
                                                      ?.toList(),
                                                  _model.sizeValue),
                                              00.0,
                                            ) *
                                            (_model.boxesCountValue!),
                                        00.0,
                                      )),
                                      00,
                                    );
                                    _model.deleveryPrice =
                                        _model.currencyValue == 'ليرة سورية'
                                            ? ((widget.kmPrice!) *
                                                FFAppState().kms)
                                            : (FFAppState().kms * 0.4);
                                    _model.deleveryPrice2 =
                                        _model.branchesValue != null &&
                                                _model.branchesValue != ''
                                            ? (_model.currencyValue ==
                                                    'ليرة سورية'
                                                ? ((widget.kmPrice!) *
                                                    FFAppState().downkms)
                                                : (FFAppState().downkms * 0.4))
                                            : 0.0;
                                    _model.total = valueOrDefault<double>(
                                      ((functions.getPriceBySize(
                                                  widget.sizes?.toList(),
                                                  () {
                                                    if ((_model.currencyValue ==
                                                            'دولار أمريكي') ||
                                                        (_model.currencyValue ==
                                                            'USD')) {
                                                      return widget.dollar;
                                                    } else if ((_model
                                                                .currencyValue ==
                                                            'يورو') ||
                                                        (_model.currencyValue ==
                                                            'EURO')) {
                                                      return widget.euro;
                                                    } else {
                                                      return widget.prices;
                                                    }
                                                  }()
                                                      ?.toList(),
                                                  _model.sizeValue)!) *
                                              (_model.boxesCountValue!)) +
                                          FFAppState().delevery +
                                          FFAppState().delevery2,
                                      500.0,
                                    );
                                    safeSetState(() {});
                                    await Future.delayed(
                                      Duration(
                                        milliseconds: 500,
                                      ),
                                    );
                                    _model.total = valueOrDefault<double>(
                                      ((functions.getPriceBySize(
                                                  widget.sizes?.toList(),
                                                  () {
                                                    if ((_model.currencyValue ==
                                                            'دولار أمريكي') ||
                                                        (_model.currencyValue ==
                                                            'USD')) {
                                                      return widget.dollar;
                                                    } else if ((_model
                                                                .currencyValue ==
                                                            'يورو') ||
                                                        (_model.currencyValue ==
                                                            'EURO')) {
                                                      return widget.euro;
                                                    } else {
                                                      return widget.prices;
                                                    }
                                                  }()
                                                      ?.toList(),
                                                  _model.sizeValue)!) *
                                              (_model.boxesCountValue!)) +
                                          (_model.deleveryPrice!) +
                                          (_model.deleveryPrice2!) +
                                          (_model.amountOppositepay!) +
                                          (_model.commision!),
                                      500.0,
                                    );
                                    safeSetState(() {});
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            excludeFromSemantics: true,
                                            onTap: () {
                                              FocusScope.of(dialogContext)
                                                  .unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.36,
                                              child: DialogWidget(
                                                title:
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                  arText: 'خطأ',
                                                  enText: 'Error',
                                                ),
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                  arText:
                                                      'يرجى إدخال كافة الحقول المطلوبة بشكل صحيح',
                                                  enText:
                                                      'Please enter all required fields correctly.',
                                                ),
                                                confirm:
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
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
                                  _model.pricing = true;
                                  _model.price = valueOrDefault<int>(
                                    functions.intPrice(valueOrDefault<double>(
                                      valueOrDefault<double>(
                                            functions.getPriceBySize(
                                                widget.sizes?.toList(),
                                                () {
                                                  if ((_model.currencyValue ==
                                                          'دولار أمريكي') ||
                                                      (_model.currencyValue ==
                                                          'USD')) {
                                                    return widget.dollar;
                                                  } else if ((_model
                                                              .currencyValue ==
                                                          'يورو') ||
                                                      (_model.currencyValue ==
                                                          'EURO')) {
                                                    return widget.euro;
                                                  } else {
                                                    return widget.prices;
                                                  }
                                                }()
                                                    ?.toList(),
                                                _model.sizeValue),
                                            00.0,
                                          ) *
                                          (_model.boxesCountValue!),
                                      00.0,
                                    )),
                                    00,
                                  );
                                  _model.deleveryPrice = _model.currencyValue ==
                                          'ليرة سورية'
                                      ? ((widget.kmPrice!) * FFAppState().kms)
                                      : (FFAppState().kms * 0.4);
                                  _model.deleveryPrice2 =
                                      _model.branchesValue != null &&
                                              _model.branchesValue != ''
                                          ? (_model.currencyValue ==
                                                  'ليرة سورية'
                                              ? ((widget.kmPrice!) *
                                                  FFAppState().downkms)
                                              : (FFAppState().downkms * 0.4))
                                          : 0.0;
                                  _model.total = valueOrDefault<double>(
                                    ((functions.getPriceBySize(
                                                widget.sizes?.toList(),
                                                () {
                                                  if ((_model.currencyValue ==
                                                          'دولار أمريكي') ||
                                                      (_model.currencyValue ==
                                                          'USD')) {
                                                    return widget.dollar;
                                                  } else if ((_model
                                                              .currencyValue ==
                                                          'يورو') ||
                                                      (_model.currencyValue ==
                                                          'EURO')) {
                                                    return widget.euro;
                                                  } else {
                                                    return widget.prices;
                                                  }
                                                }()
                                                    ?.toList(),
                                                _model.sizeValue)!) *
                                            (_model.boxesCountValue!)) +
                                        FFAppState().delevery +
                                        FFAppState().delevery2,
                                    500.0,
                                  );
                                  safeSetState(() {});
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
                                      child: GestureDetector(
                                        excludeFromSemantics: true,
                                        onTap: () {
                                          FocusScope.of(dialogContext)
                                              .unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.36,
                                          child: DialogWidget(
                                            title: FFLocalizations.of(context)
                                                .getVariableText(
                                              arText: 'خطأ',
                                              enText: 'Error',
                                            ),
                                            text: FFLocalizations.of(context)
                                                .getVariableText(
                                              arText:
                                                  'يرجى إدخال كافة الحقول المطلوبة بشكل صحيح',
                                              enText:
                                                  'Please enter all required fields correctly.',
                                            ),
                                            confirm: FFLocalizations.of(context)
                                                .getVariableText(
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
                              _model.pricing = false;
                              safeSetState(() {});
                              FFAppState().location = null;
                              FFAppState().delevery = 0.0;
                              FFAppState().delevery2 = 0.0;
                              FFAppState().up = null;
                              FFAppState().upAddress = '';
                              FFAppState().down = null;
                              FFAppState().downAddress = '';
                              FFAppState().from = '';
                              FFAppState().to = '';
                              safeSetState(() {});
                            }
                          },
                          text: _model.pricing == true
                              ? FFLocalizations.of(context).getVariableText(
                                  arText: 'تعديل',
                                  enText: 'Edit',
                                )
                              : FFLocalizations.of(context).getVariableText(
                                  arText: 'استعلام',
                                  enText: 'inquiry',
                                ),
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.44,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleSmallIsCustom,
                                ),
                            elevation: 1.0,
                            borderSide: BorderSide(
                              color: Color(0xFF1D4847),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) => FFButtonWidget(
                          onPressed: (_model.pricing != true)
                              ? null
                              : () async {
                                  if (_model.pricing == true) {
                                    if (_model.payByValue == 'المرسل إليه') {
                                      if (_model.oppositeValue == true) {
                                        _model.addShipping =
                                            await ShippingTable().insert({
                                          'recipient_name': _model
                                              .recipientTextController.text,
                                          'contains': _model
                                              .containsTextController.text,
                                          'size': _model.sizeValue,
                                          'fragile': _model.sensValue,
                                          'payment': _model.oppositeValue,
                                          'recipientPhone': _model
                                              .recipientPhoneTextController
                                              .text,
                                          'payAmount': int.tryParse(
                                              _model.amuontTextController.text),
                                          'Immediate': _model.directlyValue,
                                          'senderNotes':
                                              _model.notesTextController.text,
                                          'sender': FFAppState().user.id,
                                          'payBy': 'المرسل إليه',
                                          'senderPhone':
                                              FFAppState().user.phone,
                                          'currency': _model.currencyValue,
                                          'tracking_number':
                                              random_data.randomInteger(10, 10),
                                          'price': valueOrDefault<double>(
                                            ((_model.amountOppositepay!) *
                                                    0.005) +
                                                ((functions.getPriceBySize(
                                                        widget.sizes?.toList(),
                                                        () {
                                                          if ((_model.currencyValue ==
                                                                  'دولار أمريكي') ||
                                                              (_model.currencyValue ==
                                                                  'USD')) {
                                                            return widget
                                                                .dollar;
                                                          } else if ((_model
                                                                      .currencyValue ==
                                                                  'يورو') ||
                                                              (_model.currencyValue ==
                                                                  'EURO')) {
                                                            return widget.euro;
                                                          } else {
                                                            return widget
                                                                .prices;
                                                          }
                                                        }()
                                                            ?.toList(),
                                                        _model.sizeValue)!) *
                                                    (_model.boxesCountValue!)) +
                                                FFAppState().delevery +
                                                FFAppState().delevery2 +
                                                (_model.amountOppositepay!),
                                            500.0,
                                          ),
                                          'commision': functions
                                              .intPrice(
                                                  (_model.amountOppositepay!) *
                                                      0.005)
                                              .toDouble(),
                                          'barcode': random_data.randomString(
                                            10,
                                            10,
                                            false,
                                            false,
                                            true,
                                          ),
                                          'status': 0,
                                          'fromLocation':
                                              FFAppState().upAddress,
                                          'toLocation': _model.recLocaValue ==
                                                  'موقع المرسل إليه'
                                              ? '${_model.governorateValue} - ${_model.branchesValue}'
                                              : FFAppState().downAddress,
                                          'from': FFAppState().from,
                                          'to': FFAppState().to,
                                          'otlob': false,
                                          'payCode': (_model.paymentFocusNode
                                                          ?.hasFocus ??
                                                      false)
                                                  .toString(),
                                        });
                                        _model.updateShippingop =
                                            await UsersTable().queryRows(
                                          queryFn: (q) => q.eqOrNull(
                                            'id',
                                            FFAppState().user.id,
                                          ),
                                        );
                                        await UsersTable().update(
                                          data: {
                                            'shipments': (_model
                                                    .updateShippingop!
                                                    .firstOrNull!
                                                    .shipments!) +
                                                1,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            FFAppState().user.id,
                                          ),
                                        );
                                        _model.notifyrecepopp =
                                            await NotificationsTable().insert({
                                          'user_id': FFAppState().user.id,
                                          'title':
                                              'تم استلام طلب الشحن ضد الدفع',
                                          'body':
                                              'سيتوجه إليك المندوب لاستلام الشحنة',
                                          'service': 'shipping',
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
                                        safeSetState(() {});
                                        _model.commision = functions
                                            .intPrice(
                                                (_model.amountOppositepay!) *
                                                    0.005)
                                            .toDouble();
                                        safeSetState(() {});

                                        context.pushNamed(
                                          ShippingAccWidget.routeName,
                                          queryParameters: {
                                            'shipping': serializeParam(
                                              _model.addShipping,
                                              ParamType.SupabaseRow,
                                            ),
                                            'pay': serializeParam(
                                              widget.pay,
                                              ParamType.bool,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        _model.addShippingrnoop =
                                            await ShippingTable().insert({
                                          'recipient_name': _model
                                              .recipientTextController.text,
                                          'contains': _model
                                              .containsTextController.text,
                                          'size': _model.sizeValue,
                                          'fragile': _model.sensValue,
                                          'payment': false,
                                          'recipientPhone': _model
                                              .recipientPhoneTextController
                                              .text,
                                          'payAmount': 0,
                                          'Immediate': _model.directlyValue,
                                          'senderNotes': _model.notesTextController
                                                          .text !=
                                                      ''
                                              ? _model.notesTextController.text
                                              : 'لا يوجد ملاحظات',
                                          'sender': FFAppState().user.id,
                                          'payBy': 'المرسل إليه',
                                          'senderPhone':
                                              FFAppState().user.phone,
                                          'tracking_number':
                                              random_data.randomInteger(10, 10),
                                          'price': valueOrDefault<double>(
                                            ((_model.boxesCountValue!) *
                                                    (functions.getPriceBySize(
                                                        widget.sizes?.toList(),
                                                        () {
                                                          if ((_model.currencyValue ==
                                                                  'دولار أمريكي') ||
                                                              (_model.currencyValue ==
                                                                  'USD')) {
                                                            return widget
                                                                .dollar;
                                                          } else if ((_model
                                                                      .currencyValue ==
                                                                  'يورو') ||
                                                              (_model.currencyValue ==
                                                                  'EURO')) {
                                                            return widget.euro;
                                                          } else {
                                                            return widget
                                                                .prices;
                                                          }
                                                        }()
                                                            ?.toList(),
                                                        _model.sizeValue)!)) +
                                                FFAppState().delevery +
                                                FFAppState().delevery2,
                                            500.0,
                                          ),
                                          'commision': 0.0,
                                          'barcode': random_data.randomString(
                                            10,
                                            10,
                                            false,
                                            false,
                                            true,
                                          ),
                                          'status': 0,
                                          'fromLocation':
                                              FFAppState().upAddress,
                                          'toLocation': _model.recLocaValue ==
                                                  'موقع المرسل إليه'
                                              ? FFAppState().downAddress
                                              : '${_model.governorateValue} - ${_model.branchesValue}',
                                          'from': FFAppState().from,
                                          'to': FFAppState().to,
                                          'otlob': false,
                                          'payCode': (_model.paymentFocusNode
                                                          ?.hasFocus ??
                                                      false)
                                                  .toString(),
                                        });
                                        _model.updateShippingunop =
                                            await UsersTable().queryRows(
                                          queryFn: (q) => q.eqOrNull(
                                            'id',
                                            FFAppState().user.id,
                                          ),
                                        );
                                        await UsersTable().update(
                                          data: {
                                            'shipments': (_model
                                                    .updateShippingunop!
                                                    .firstOrNull!
                                                    .shipments!) +
                                                1,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            FFAppState().user.id,
                                          ),
                                        );
                                        _model.notifyrecepnoopp =
                                            await NotificationsTable().insert({
                                          'user_id': FFAppState().user.id,
                                          'title': 'تم استلام طلب الشحن',
                                          'body':
                                              'سيتوجه إليك المندوب لاستلام الشحنة',
                                          'service': 'shipping',
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
                                        safeSetState(() {});

                                        context.pushNamed(
                                          ShippingAccWidget.routeName,
                                          queryParameters: {
                                            'shipping': serializeParam(
                                              _model.addShippingrnoop,
                                              ParamType.SupabaseRow,
                                            ),
                                            'pay': serializeParam(
                                              widget.pay,
                                              ParamType.bool,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }
                                    } else {
                                      if (_model.oppositeValue == true) {
                                        _model.addShippingsender =
                                            await ShippingTable().insert({
                                          'recipient_name': _model
                                              .recipientTextController.text,
                                          'contains': _model
                                              .containsTextController.text,
                                          'size': _model.sizeValue,
                                          'fragile': _model.sensValue,
                                          'payment': _model.oppositeValue,
                                          'recipientPhone': _model
                                              .recipientPhoneTextController
                                              .text,
                                          'payAmount': int.tryParse(
                                              _model.amuontTextController.text),
                                          'Immediate': _model.directlyValue,
                                          'senderNotes':
                                              _model.notesTextController.text,
                                          'sender': FFAppState().user.id,
                                          'payBy': 'المرسل (أنا)',
                                          'senderPhone':
                                              FFAppState().user.phone,
                                          'currency': _model.currencyValue,
                                          'tracking_number':
                                              random_data.randomInteger(10, 10),
                                          'price': valueOrDefault<double>(
                                            ((_model.boxesCountValue!) *
                                                    (functions.getPriceBySize(
                                                        widget.sizes?.toList(),
                                                        () {
                                                          if ((_model.currencyValue ==
                                                                  'دولار أمريكي') ||
                                                              (_model.currencyValue ==
                                                                  'USD')) {
                                                            return widget
                                                                .dollar;
                                                          } else if ((_model
                                                                      .currencyValue ==
                                                                  'يورو') ||
                                                              (_model.currencyValue ==
                                                                  'EURO')) {
                                                            return widget.euro;
                                                          } else {
                                                            return widget
                                                                .prices;
                                                          }
                                                        }()
                                                            ?.toList(),
                                                        _model.sizeValue)!)) +
                                                FFAppState().delevery +
                                                FFAppState().delevery2,
                                            500.0,
                                          ),
                                          'commision': functions
                                              .intPrice(
                                                  (_model.amountOppositepay!) *
                                                      0.005)
                                              .toDouble(),
                                          'barcode': random_data.randomString(
                                            10,
                                            10,
                                            false,
                                            false,
                                            true,
                                          ),
                                          'status': 0,
                                          'payCode': _model.radioButtonValue ==
                                                  'الدفع عند وصول المندوب'
                                              ? 'عند المندوب'
                                              : _model
                                                  .paymentTextController.text,
                                          'fromLocation':
                                              FFAppState().upAddress,
                                          'toLocation': _model.recLocaValue ==
                                                  'موقع المرسل إليه'
                                              ? '${_model.governorateValue} - ${_model.branchesValue}'
                                              : FFAppState().downAddress,
                                          'from': FFAppState().from,
                                          'to': FFAppState().to,
                                          'otlob': false,
                                        });
                                        _model.updateShippingsender =
                                            await UsersTable().queryRows(
                                          queryFn: (q) => q.eqOrNull(
                                            'id',
                                            FFAppState().user.id,
                                          ),
                                        );
                                        await UsersTable().update(
                                          data: {
                                            'shipments': (_model
                                                    .updateShippingsender!
                                                    .firstOrNull!
                                                    .shipments!) +
                                                1,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            FFAppState().user.id,
                                          ),
                                        );
                                        _model.notifysender =
                                            await NotificationsTable().insert({
                                          'user_id': FFAppState().user.id,
                                          'title': 'تم استلام طلب الشحن',
                                          'body':
                                              'سيتوجه إليك المندوب لاستلام الشحنة',
                                          'service': 'shipping',
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
                                        safeSetState(() {});
                                        _model.commision = functions
                                            .intPrice(
                                                (_model.amountOppositepay!) *
                                                    0.005)
                                            .toDouble();
                                        safeSetState(() {});

                                        context.pushNamed(
                                          ShippingAccWidget.routeName,
                                          queryParameters: {
                                            'shipping': serializeParam(
                                              _model.addShippingsender,
                                              ParamType.SupabaseRow,
                                            ),
                                            'pay': serializeParam(
                                              widget.pay,
                                              ParamType.bool,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        _model.addShippingsender1 =
                                            await ShippingTable().insert({
                                          'recipient_name': _model
                                              .recipientTextController.text,
                                          'contains': _model
                                              .containsTextController.text,
                                          'size': _model.sizeValue,
                                          'fragile': _model.sensValue,
                                          'payment': false,
                                          'recipientPhone': _model
                                              .recipientPhoneTextController
                                              .text,
                                          'payAmount': 0,
                                          'Immediate': _model.directlyValue,
                                          'senderNotes':
                                              _model.notesTextController.text,
                                          'sender': FFAppState().user.id,
                                          'payBy': 'المرسل (أنا)',
                                          'senderPhone':
                                              FFAppState().user.phone,
                                          'tracking_number':
                                              random_data.randomInteger(10, 10),
                                          'price': valueOrDefault<double>(
                                            ((_model.boxesCountValue!) *
                                                    (functions.getPriceBySize(
                                                        widget.sizes?.toList(),
                                                        () {
                                                          if ((_model.currencyValue ==
                                                                  'دولار أمريكي') ||
                                                              (_model.currencyValue ==
                                                                  'USD')) {
                                                            return widget
                                                                .dollar;
                                                          } else if ((_model
                                                                      .currencyValue ==
                                                                  'يورو') ||
                                                              (_model.currencyValue ==
                                                                  'EURO')) {
                                                            return widget.euro;
                                                          } else {
                                                            return widget
                                                                .prices;
                                                          }
                                                        }()
                                                            ?.toList(),
                                                        _model.sizeValue)!)) +
                                                FFAppState().delevery +
                                                FFAppState().delevery2,
                                            500.0,
                                          ),
                                          'commision': 0.0,
                                          'barcode': random_data.randomString(
                                            10,
                                            10,
                                            false,
                                            false,
                                            true,
                                          ),
                                          'status': 0,
                                          'payCode': _model.radioButtonValue ==
                                                  'الدفع عند وصول المندوب'
                                              ? 'عند المندوب'
                                              : _model
                                                  .paymentTextController.text,
                                          'fromLocation':
                                              FFAppState().upAddress,
                                          'toLocation': _model.recLocaValue ==
                                                  'موقع المرسل إليه'
                                              ? '${_model.governorateValue} - ${_model.branchesValue}'
                                              : FFAppState().downAddress,
                                          'from': FFAppState().from,
                                          'to': FFAppState().to,
                                          'otlob': false,
                                        });
                                        _model.updateShippingsender1 =
                                            await UsersTable().queryRows(
                                          queryFn: (q) => q.eqOrNull(
                                            'id',
                                            FFAppState().user.id,
                                          ),
                                        );
                                        await UsersTable().update(
                                          data: {
                                            'shipments': (_model
                                                    .updateShippingsender1!
                                                    .firstOrNull!
                                                    .shipments!) +
                                                1,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            FFAppState().user.id,
                                          ),
                                        );
                                        _model.notifysender1 =
                                            await NotificationsTable().insert({
                                          'user_id': FFAppState().user.id,
                                          'title': 'تم استلام طلب الشحن',
                                          'body':
                                              'سيتوجه إليك المندوب لاستلام الشحنة',
                                          'service': 'shipping',
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
                                        safeSetState(() {});

                                        context.pushNamed(
                                          ShippingAccWidget.routeName,
                                          queryParameters: {
                                            'shipping': serializeParam(
                                              _model.addShippingsender1,
                                              ParamType.SupabaseRow,
                                            ),
                                            'pay': serializeParam(
                                              widget.pay,
                                              ParamType.bool,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }
                                    }
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            excludeFromSemantics: true,
                                            onTap: () {
                                              FocusScope.of(dialogContext)
                                                  .unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Container(
                                              height: 36.0,
                                              child: DialogWidget(
                                                title:
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                  arText: 'خطأ',
                                                  enText: 'Error',
                                                ),
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                  arText:
                                                      'يرجى النقر على زر استعلام لاستعراض تكلفة الخدمة',
                                                  enText:
                                                      'Please click the inquiry button to view the service cost.',
                                                ),
                                                confirm:
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
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
                            'koztqkbh' /* إرسال */,
                          ),
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.44,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleSmallIsCustom,
                                ),
                            elevation: 1.0,
                            borderSide: BorderSide(
                              color: Color(0xFF1D4847),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                            disabledColor:
                                FlutterFlowTheme.of(context).alternate,
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
      ),
    );
  }
}
