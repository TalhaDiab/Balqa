import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/tlop/summary_row/summary_row_widget.dart';
import '/travel/mapy/mapy_widget.dart';
import '/zcomponents/dialog/dialog_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_model.dart';
export 'order_model.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({
    super.key,
    required this.sizes,
    required this.prices,
    required this.kmPrice,
    required this.ltlng,
    required this.branches,
    required this.dollar,
    required this.euro,
    this.gover,
    required this.pay,
    required this.category,
    required this.currency,
    required this.cityList,
  });

  final List<String>? sizes;
  final List<double>? prices;
  final int? kmPrice;
  final List<String>? ltlng;
  final List<String>? branches;
  final List<double>? dollar;
  final List<double>? euro;
  final List<String>? gover;
  final bool? pay;
  final List<String>? category;
  final List<String>? currency;
  final List<String>? cityList;

  static String routeName = 'order';
  static String routePath = 'order';

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget>
    with TickerProviderStateMixin {
  late OrderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderModel());

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.priceTextController ??= TextEditingController();
    _model.priceFocusNode ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.storeTextController ??= TextEditingController();
    _model.storeFocusNode ??= FocusNode();

    _model.storePhoneTextController ??= TextEditingController();
    _model.storePhoneFocusNode ??= FocusNode();

    _model.reelsTextController ??= TextEditingController();
    _model.reelsFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
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
      'containerOnActionTriggerAnimation2': AnimationInfo(
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
            iconTheme:
                IconThemeData(color: FlutterFlowTheme.of(context).secondary),
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
                  'ywd6oswc' /* اطلبلي */,
                ),
                textAlign: TextAlign.center,
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
                alignment: AlignmentDirectional(0.0, 0.0),
              ),
            ),
            centerTitle: true,
            elevation: 1.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Builder(
                                    builder: (context) {
                                      if (_model.creating != true) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 1.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            16.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  'https://i.ibb.co/RLdVYPx/5fa34dfd-3575-447b-8120-fa5096342161.png',
                                                                  width: 150.0,
                                                                  height: 120.0,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    AutoSizeText(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'qt782gx4' /* اطلب أي منتج من أي محافظة */,
                                                                      ),
                                                                      maxLines:
                                                                          2,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'qf0cujo4' /* سنشتري المنتج ثم نشحنه إليك. */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            lineHeight:
                                                                                1.47,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          8.0)),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              elevation: 1.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(24.0),
                                                  child: Container(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .shopping_bag_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'idrq5j5f' /* معلومات المنتج */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    lineHeight:
                                                                        1.35,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .titleMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      AutoSizeText(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '5x823g2o' /* فئة المنتج */,
                                                                        ),
                                                                        minFontSize:
                                                                            12.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                        overflow:
                                                                            TextOverflow.clip,
                                                                      ),
                                                                      FlutterFlowDropDown<
                                                                          String>(
                                                                        controller:
                                                                            _model.categoryValueController ??=
                                                                                FormFieldController<String>(
                                                                          _model.categoryValue ??=
                                                                              FFLocalizations.of(context).getText(
                                                                            '1bdb18uj' /* إلكترونيات */,
                                                                          ),
                                                                        ),
                                                                        options:
                                                                            widget.category!,
                                                                        onChanged:
                                                                            (val) =>
                                                                                safeSetState(() => _model.categoryValue = val),
                                                                        width:
                                                                            200.0,
                                                                        height:
                                                                            40.0,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              lineHeight: 1.47,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                        hintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'yi5t64lz' /* إلكترونيات */,
                                                                        ),
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        borderWidth:
                                                                            0.3,
                                                                        borderRadius:
                                                                            16.0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
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
                                                                            FFLocalizations.of(context).getText(
                                                                          'btt7qnw9' /* الفئة */,
                                                                        ),
                                                                        labelTextStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              lineHeight: 1.38,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            4.0)),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'ckp5111d' /* الكمية */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              120.0,
                                                                          height:
                                                                              40.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 0.3,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              FlutterFlowCountController(
                                                                            decrementIconBuilder: (enabled) =>
                                                                                Icon(
                                                                              Icons.remove_rounded,
                                                                              color: enabled ? FlutterFlowTheme.of(context).secondaryText : FlutterFlowTheme.of(context).alternate,
                                                                              size: 24.0,
                                                                            ),
                                                                            incrementIconBuilder: (enabled) =>
                                                                                Icon(
                                                                              Icons.add_rounded,
                                                                              color: enabled ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).alternate,
                                                                              size: 24.0,
                                                                            ),
                                                                            countBuilder: (count) =>
                                                                                Text(
                                                                              count.toString(),
                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).titleLargeIsCustom,
                                                                                  ),
                                                                            ),
                                                                            count: _model.countControllerValue ??=
                                                                                1,
                                                                            updateCount: (count) =>
                                                                                safeSetState(() => _model.countControllerValue = count),
                                                                            stepSize:
                                                                                1,
                                                                            minimum:
                                                                                1,
                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                12.0,
                                                                                0.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            4.0)),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 16.0)),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              200.0,
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                _model.nameTextController,
                                                                            focusNode:
                                                                                _model.nameFocusNode,
                                                                            autofocus:
                                                                                false,
                                                                            enabled:
                                                                                true,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              isDense: true,
                                                                              labelText: FFLocalizations.of(context).getText(
                                                                                '9h8ffgb8' /* اسم المنتج */,
                                                                              ),
                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                  ),
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                'l42jgdyj' /* مكنسة كهربائية */,
                                                                              ),
                                                                              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                  ),
                                                                              enabledBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  width: 0.3,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 0.3,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                              ),
                                                                              errorBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  width: 0.3,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                              ),
                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  width: 0.3,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                              ),
                                                                              filled: true,
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                            cursorColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            enableInteractiveSelection:
                                                                                true,
                                                                            validator:
                                                                                _model.nameTextControllerValidator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            4.0)),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              200.0,
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                _model.priceTextController,
                                                                            focusNode:
                                                                                _model.priceFocusNode,
                                                                            autofocus:
                                                                                false,
                                                                            enabled:
                                                                                true,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              isDense: true,
                                                                              labelText: FFLocalizations.of(context).getText(
                                                                                '9id07p0w' /* السعر الإجمالي */,
                                                                              ),
                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                  ),
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                'nipd5xrp' /* أدخل السعر المتوقع */,
                                                                              ),
                                                                              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                  ),
                                                                              enabledBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  width: 0.3,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 0.3,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                              ),
                                                                              errorBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  width: 0.3,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                              ),
                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  width: 0.3,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                              ),
                                                                              filled: true,
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                            keyboardType:
                                                                                const TextInputType.numberWithOptions(decimal: true),
                                                                            cursorColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            enableInteractiveSelection:
                                                                                true,
                                                                            validator:
                                                                                _model.priceTextControllerValidator.asValidator(context),
                                                                            inputFormatters: [
                                                                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            4.0)),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 16.0)),
                                                            ),
                                                            Column(
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
                                                                    'oomd26it' /* العملة */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                                ClipRRect(
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        FlutterFlowChoiceChips(
                                                                      options: [
                                                                        ChipData(
                                                                            FFLocalizations.of(context).getText(
                                                                          'zvdxb7vj' /* ليرة سورية */,
                                                                        )),
                                                                        ChipData(
                                                                            FFLocalizations.of(context).getText(
                                                                          'smnff1x6' /* دولار أمريكي */,
                                                                        )),
                                                                        ChipData(
                                                                            FFLocalizations.of(context).getText(
                                                                          '7m8s2gtv' /* يورو */,
                                                                        ))
                                                                      ],
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.currencyValue = val?.firstOrNull),
                                                                      selectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                        iconColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        iconSize:
                                                                            0.0,
                                                                        elevation:
                                                                            0.0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(14.0),
                                                                      ),
                                                                      unselectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                        iconColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        iconSize:
                                                                            16.0,
                                                                        elevation:
                                                                            0.0,
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        borderWidth:
                                                                            0.3,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                      chipSpacing:
                                                                          12.0,
                                                                      rowSpacing:
                                                                          8.0,
                                                                      multiselect:
                                                                          false,
                                                                      initialized:
                                                                          _model.currencyValue !=
                                                                              null,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      controller: _model
                                                                              .currencyValueController ??=
                                                                          FormFieldController<
                                                                              List<String>>(
                                                                        [
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '3cymirx0' /* ليرة سورية */,
                                                                          )
                                                                        ],
                                                                      ),
                                                                      wrapped:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 4.0)),
                                                            ),
                                                            Column(
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
                                                                    'afcsxzk8' /* حجم المنتج */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                                ClipRRect(
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        FlutterFlowChoiceChips(
                                                                      options: widget
                                                                          .sizes!
                                                                          .map((label) =>
                                                                              ChipData(label))
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.sizeValue = val?.firstOrNull),
                                                                      selectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                        iconColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        iconSize:
                                                                            0.0,
                                                                        elevation:
                                                                            0.0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(14.0),
                                                                      ),
                                                                      unselectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                        iconColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        iconSize:
                                                                            16.0,
                                                                        elevation:
                                                                            0.0,
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        borderWidth:
                                                                            0.3,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                      chipSpacing:
                                                                          12.0,
                                                                      rowSpacing:
                                                                          8.0,
                                                                      multiselect:
                                                                          false,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      controller: _model
                                                                              .sizeValueController ??=
                                                                          FormFieldController<
                                                                              List<String>>(
                                                                        [],
                                                                      ),
                                                                      wrapped:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 4.0)),
                                                            ),
                                                            Container(
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 0.4,
                                                                ),
                                                              ),
                                                              child: Container(
                                                                width: 200.0,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textController3,
                                                                  focusNode: _model
                                                                      .textFieldFocusNode,
                                                                  autofocus:
                                                                      false,
                                                                  enabled: true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'mol6p882' /* وصف المنتج */,
                                                                    ),
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                        ),
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '12a710pv' /* اكتب وصفًا تفصيليًا للمنتج (ال... */,
                                                                    ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                        ),
                                                                    enabledBorder:
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
                                                                        color: FlutterFlowTheme.of(context)
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    suffixIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .edit_document,
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                  cursorColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  enableInteractiveSelection:
                                                                      true,
                                                                  validator: _model
                                                                      .textController3Validator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 16.0)),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 16.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 1.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(24.0),
                                                  child: Container(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .store_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '8uv2xvrs' /* تواجد المنتج */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    lineHeight:
                                                                        1.35,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .titleMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            Container(
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 0.4,
                                                                ),
                                                              ),
                                                              child: Container(
                                                                width: 250.0,
                                                                height: 80.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF1F4F8),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFFE0E3E7),
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
                                                                            _model.store =
                                                                                true;
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                115.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: _model.store == true ? Colors.white : Color(0xFFF1F4F8),
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                              border: Border.all(
                                                                                color: valueOrDefault<Color>(
                                                                                  _model.store == true ? Color(0xFFE0E3E7) : Color(0xFFF1F4F8),
                                                                                  Color(0xFFE0E3E7),
                                                                                ),
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.store_rounded,
                                                                                  color: _model.store == true ? Color(0xFF14181B) : Color(0xFF57636C),
                                                                                  size: 18.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'd5ys8lu4' /* متجر فعلي */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.notoKufiArabic(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: _model.store == true ? Color(0xFF14181B) : Color(0xFF57636C),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
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
                                                                            _model.store =
                                                                                false;
                                                                            safeSetState(() {});
                                                                            FFAppState().upAddress =
                                                                                '';
                                                                            FFAppState().delevery =
                                                                                0.0;
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                115.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: _model.store == false ? Colors.white : Color(0xFFF1F4F8),
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                              border: Border.all(
                                                                                color: valueOrDefault<Color>(
                                                                                  _model.store == false ? Color(0xFFE0E3E7) : Color(0xFFF1F4F8),
                                                                                  Color(0xFFF1F4F8),
                                                                                ),
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                FaIcon(
                                                                                  FontAwesomeIcons.link,
                                                                                  color: _model.store == false ? Color(0xFF14181B) : Color(0xFF57636C),
                                                                                  size: 17.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'mggaqjw9' /* رابط إلكتروني */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.notoKufiArabic(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: _model.store == false ? Color(0xFF14181B) : Color(0xFF57636C),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ).animateOnActionTrigger(
                                                                          animationsMap[
                                                                              'containerOnActionTriggerAnimation1']!,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            if (_model.store ==
                                                                true)
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '8ybzg4g7' /* اسم المتجر */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                                Container(
                                                                                  height: 48.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Container(
                                                                                    width: 200.0,
                                                                                    child: TextFormField(
                                                                                      controller: _model.storeTextController,
                                                                                      focusNode: _model.storeFocusNode,
                                                                                      autofocus: false,
                                                                                      enabled: true,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          '9plfr32x' /* وكالة ...... */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 0.3,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 0.3,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 0.3,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 0.3,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                      enableInteractiveSelection: true,
                                                                                      validator: _model.storeTextControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(height: 4.0)),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'kbqkf75x' /* رقم الهاتف */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                                Container(
                                                                                  height: 48.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Container(
                                                                                    width: 200.0,
                                                                                    child: TextFormField(
                                                                                      controller: _model.storePhoneTextController,
                                                                                      focusNode: _model.storePhoneFocusNode,
                                                                                      autofocus: false,
                                                                                      enabled: true,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                            ),
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          '164im818' /* 0900000000 */,
                                                                                        ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 0.3,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 0.3,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 0.3,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 0.3,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                      keyboardType: TextInputType.phone,
                                                                                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                      enableInteractiveSelection: true,
                                                                                      validator: _model.storePhoneTextControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(height: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 16.0)),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            48.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                0.4,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
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
                                                                                      child: MapyWidget(
                                                                                        price: _model.currencyValue == 'ليرة سورية' ? widget.kmPrice!.toDouble() : 0.4,
                                                                                        citylist: widget.cityList!,
                                                                                        ltlng: widget.ltlng!,
                                                                                        title: 'up',
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                          text: FFAppState().upAddress != ''
                                                                              ? FFAppState().upAddress
                                                                              : 'حدد موقعاً',
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  color: Colors.white,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          16.0)),
                                                                ),
                                                              ),
                                                            if (_model.store ==
                                                                false)
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'xva6l9fi' /* المحافظة */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                                Container(
                                                                                  height: 48.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: FlutterFlowDropDown<String>(
                                                                                    controller: _model.prodGovernoratesValueController ??= FormFieldController<String>(null),
                                                                                    options: widget.gover!,
                                                                                    onChanged: (val) => safeSetState(() => _model.prodGovernoratesValue = val),
                                                                                    width: double.infinity,
                                                                                    height: 40.0,
                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          lineHeight: 1.47,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                    hintText: FFLocalizations.of(context).getText(
                                                                                      'bmcf3y7n' /* اختر المحافظة */,
                                                                                    ),
                                                                                    icon: Icon(
                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    elevation: 2.0,
                                                                                    borderColor: FlutterFlowTheme.of(context).primary,
                                                                                    borderWidth: 0.3,
                                                                                    borderRadius: 16.0,
                                                                                    margin: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                    hidesUnderline: true,
                                                                                    isOverButton: false,
                                                                                    isSearchable: false,
                                                                                    isMultiSelect: false,
                                                                                    labelText: FFLocalizations.of(context).getText(
                                                                                      '37t3mkbd' /* الفئة */,
                                                                                    ),
                                                                                    labelTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          lineHeight: 1.38,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(height: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 16.0)),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                0.4,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              200.0,
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                _model.reelsTextController,
                                                                            focusNode:
                                                                                _model.reelsFocusNode,
                                                                            autofocus:
                                                                                false,
                                                                            enabled:
                                                                                true,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              isDense: true,
                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                  ),
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                '1hc2remm' /* رابط متجر أو مقطع ريلز */,
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
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                              ),
                                                                              errorBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                              ),
                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                              ),
                                                                              filled: true,
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                            cursorColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            enableInteractiveSelection:
                                                                                true,
                                                                            validator:
                                                                                _model.reelsTextControllerValidator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          16.0)),
                                                                ),
                                                              ),
                                                          ].divide(SizedBox(
                                                              height: 16.0)),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 16.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 1.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(24.0),
                                                  child: Container(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .local_shipping_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '8it9pqil' /* معلومات التوصيل */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    lineHeight:
                                                                        1.35,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .titleMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            Container(
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 0.4,
                                                                ),
                                                              ),
                                                              child: Container(
                                                                width: 250.0,
                                                                height: 80.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF1F4F8),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFFE0E3E7),
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
                                                                            _model.location =
                                                                                false;
                                                                            safeSetState(() {});
                                                                            FFAppState().downAddress =
                                                                                '';
                                                                            FFAppState().delevery2 =
                                                                                0.0;
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                115.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: _model.location == false ? Colors.white : Color(0xFFF1F4F8),
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                              border: Border.all(
                                                                                color: valueOrDefault<Color>(
                                                                                  _model.location == false ? Color(0xFFE0E3E7) : Color(0xFFF1F4F8),
                                                                                  Color(0xFFE0E3E7),
                                                                                ),
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.store_rounded,
                                                                                  color: Theme.of(context).brightness == Brightness.light ? Color(0xFF14181B) : Color(0xFF57636C),
                                                                                  size: 18.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'q2l68hgv' /* فروعنا */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.notoKufiArabic(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: Theme.of(context).brightness == Brightness.light ? Color(0xFF14181B) : Color(0xFF57636C),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
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
                                                                            _model.location =
                                                                                true;
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                115.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: _model.location == true ? Colors.white : Color(0xFFF1F4F8),
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                              border: Border.all(
                                                                                color: valueOrDefault<Color>(
                                                                                  _model.location == true ? Color(0xFFE0E3E7) : Color(0xFFF1F4F8),
                                                                                  Color(0xFFF1F4F8),
                                                                                ),
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.location_on,
                                                                                  color: _model.location == true ? Color(0xFF14181B) : Color(0xFF57636C),
                                                                                  size: 17.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '72blmyvy' /* موقع مخصص */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.notoKufiArabic(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: _model.location == true ? Color(0xFF14181B) : Color(0xFF57636C),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ).animateOnActionTrigger(
                                                                          animationsMap[
                                                                              'containerOnActionTriggerAnimation2']!,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            if (_model
                                                                    .location ==
                                                                true)
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'ss7jxcwd' /* المحافظة */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                          Container(
                                                                            height:
                                                                                48.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                FlutterFlowDropDown<String>(
                                                                              controller: _model.deleveryGovernoratesValueController ??= FormFieldController<String>(null),
                                                                              options: widget.gover!,
                                                                              onChanged: (val) => safeSetState(() => _model.deleveryGovernoratesValue = val),
                                                                              width: double.infinity,
                                                                              height: 40.0,
                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    lineHeight: 1.47,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                'mc5x8jde' /* اختر المحافظة */,
                                                                              ),
                                                                              icon: Icon(
                                                                                Icons.keyboard_arrow_down_rounded,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              elevation: 2.0,
                                                                              borderColor: Colors.transparent,
                                                                              borderWidth: 0.0,
                                                                              borderRadius: 16.0,
                                                                              margin: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              hidesUnderline: true,
                                                                              isOverButton: false,
                                                                              isSearchable: false,
                                                                              isMultiSelect: false,
                                                                              labelText: FFLocalizations.of(context).getText(
                                                                                '0mhnj4g5' /* الفئة */,
                                                                              ),
                                                                              labelTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    lineHeight: 1.38,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 4.0)),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            48.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                0.4,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
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
                                                                                      child: MapyWidget(
                                                                                        price: _model.currencyValue == 'ليرة سورية' ? widget.kmPrice!.toDouble() : 0.4,
                                                                                        citylist: widget.cityList!,
                                                                                        ltlng: widget.ltlng!,
                                                                                        title: 'down',
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                          text: FFAppState().downAddress != ''
                                                                              ? FFAppState().downAddress
                                                                              : 'حدد موقعاً',
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  color: Colors.white,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          16.0)),
                                                                ),
                                                              ),
                                                            if (_model
                                                                    .location ==
                                                                false)
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'bcv80p16' /* المحافظة */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                                Container(
                                                                                  height: 48.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: FlutterFlowDropDown<String>(
                                                                                    controller: _model.branchGovernoratesValueController ??= FormFieldController<String>(null),
                                                                                    options: widget.gover!,
                                                                                    onChanged: (val) => safeSetState(() => _model.branchGovernoratesValue = val),
                                                                                    width: double.infinity,
                                                                                    height: 40.0,
                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          lineHeight: 1.47,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                    hintText: FFLocalizations.of(context).getText(
                                                                                      'z1miecqq' /* اختر المحافظة */,
                                                                                    ),
                                                                                    icon: Icon(
                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    elevation: 2.0,
                                                                                    borderColor: FlutterFlowTheme.of(context).primary,
                                                                                    borderWidth: 0.4,
                                                                                    borderRadius: 16.0,
                                                                                    margin: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                    hidesUnderline: true,
                                                                                    isOverButton: false,
                                                                                    isSearchable: false,
                                                                                    isMultiSelect: false,
                                                                                    labelText: FFLocalizations.of(context).getText(
                                                                                      'hm5onjmi' /* الفئة */,
                                                                                    ),
                                                                                    labelTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          lineHeight: 1.38,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(height: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 16.0)),
                                                                      ),
                                                                    ),
                                                                    if (_model.branchGovernoratesValue !=
                                                                            null &&
                                                                        _model.branchGovernoratesValue !=
                                                                            '')
                                                                      Expanded(
                                                                        child: FutureBuilder<
                                                                            List<BranchesRow>>(
                                                                          future:
                                                                              BranchesTable().querySingleRow(
                                                                            queryFn: (q) =>
                                                                                q.orGroupOrNull(orFilterGroup([
                                                                              orFilterLeaf('governorateAr', 'eq', _model.branchGovernoratesValue),
                                                                              orFilterLeaf('governorateEn', 'eq', _model.branchGovernoratesValue),
                                                                            ], isAnd: false)),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
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
                                                                            List<BranchesRow>
                                                                                containerBranchesRowList =
                                                                                snapshot.data!;

                                                                            final containerBranchesRow = containerBranchesRowList.isNotEmpty
                                                                                ? containerBranchesRowList.first
                                                                                : null;

                                                                            return Container(
                                                                              width: double.infinity,
                                                                              height: 48.0,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  width: 0.4,
                                                                                ),
                                                                              ),
                                                                              child: FlutterFlowDropDown<String>(
                                                                                controller: _model.branchesValueController ??= FormFieldController<String>(null),
                                                                                options: FFLocalizations.of(context).languageCode == 'ar' ? containerBranchesRow!.name : containerBranchesRow!.nameEn,
                                                                                onChanged: (val) => safeSetState(() => _model.branchesValue = val),
                                                                                width: 200.0,
                                                                                height: 40.0,
                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  '7v6ocs2q' /* اختر مركز التسليم */,
                                                                                ),
                                                                                icon: Icon(
                                                                                  Icons.keyboard_arrow_down_rounded,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 24.0,
                                                                                ),
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                elevation: 2.0,
                                                                                borderColor: Colors.transparent,
                                                                                borderWidth: 0.0,
                                                                                borderRadius: 16.0,
                                                                                margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                hidesUnderline: true,
                                                                                isOverButton: false,
                                                                                isSearchable: false,
                                                                                isMultiSelect: false,
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          16.0)),
                                                                ),
                                                              ),
                                                          ].divide(SizedBox(
                                                              height: 16.0)),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 16.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 1.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.83,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          AutoSizeText(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'rznfao65' /* نعتذر عن شحن أي نوع من الأسلحة... */,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: InkWell(
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
                                                                    TermsWidget
                                                                        .routeName);
                                                              },
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'a042lkcj' /* *يرجى مراجعة الشروط والأحكام */,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
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
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 16.0)),
                                        );
                                      } else {
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 3.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.89,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                  border: Border.all(
                                                    color: Color(0x331D4847),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 16.0,
                                                          16.0, 16.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '6erp5eax' /* المصدر */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLargeIsCustom,
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
                                                                    12.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 0.5,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    12.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
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
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        _model.store ==
                                                                                true
                                                                            ? _model.storeTextController.text
                                                                            : 'متجر الكتروني/ريلز',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          _model.store == true
                                                                              ? _model.storePhoneTextController.text
                                                                              : _model.reelsTextController.text,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
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
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
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
                                                                '1tl6fj5o' /* اسم المنتج */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                            ),
                                                            Text(
                                                              _model
                                                                  .nameTextController
                                                                  .text,
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
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
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
                                                                'aur9srj8' /* عدد الطرود */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .labelMediumIsCustom,
                                                                  ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                _model
                                                                    .countControllerValue
                                                                    ?.toString(),
                                                                '1',
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
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
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
                                                                'uzm6re7g' /* نوع الشحنة */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                _model
                                                                    .sizeValue,
                                                                'طرد صغير',
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
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'cxa4ngt0' /* من */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
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
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  FFAppState().upAddress !=
                                                                              ''
                                                                      ? FFAppState()
                                                                          .upAddress
                                                                      : _model
                                                                          .prodGovernoratesValue,
                                                                  'دمشق',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
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
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
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
                                                                'oxt38k9v' /* إلى */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                FFAppState().downAddress !=
                                                                            ''
                                                                    ? FFAppState()
                                                                        .downAddress
                                                                    : '${_model.branchGovernoratesValue} - ${_model.branchesValue}',
                                                                'حمص',
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
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: StyledDivider(
                                                          height: 7.0,
                                                          thickness: 0.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          lineStyle:
                                                              DividerLineStyle
                                                                  .dashdotted,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            wrapWithModel(
                                                              model: _model
                                                                  .summaryRowModel1,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  SummaryRowWidget(
                                                                label:
                                                                    'سعر المنتج المتوقع',
                                                                isTotal: false,
                                                                value: _model
                                                                    .priceTextController
                                                                    .text,
                                                                currency: () {
                                                                  if (_model
                                                                          .currencyValue ==
                                                                      'يورو') {
                                                                    return '€';
                                                                  } else if (_model
                                                                          .currencyValue ==
                                                                      'دولار أمريكي') {
                                                                    return '\$';
                                                                  } else {
                                                                    return FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                      arText:
                                                                          'ل.س',
                                                                      enText:
                                                                          'S.P',
                                                                    );
                                                                  }
                                                                }(),
                                                              ),
                                                            ),
                                                            wrapWithModel(
                                                              model: _model
                                                                  .summaryRowModel2,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  SummaryRowWidget(
                                                                label:
                                                                    ' التوصيل من موقع الشراء',
                                                                isTotal: false,
                                                                value: FFAppState()
                                                                    .delevery
                                                                    .toString(),
                                                                currency: () {
                                                                  if (_model
                                                                          .currencyValue ==
                                                                      'يورو') {
                                                                    return '€';
                                                                  } else if (_model
                                                                          .currencyValue ==
                                                                      'دولار أمريكي') {
                                                                    return '\$';
                                                                  } else {
                                                                    return FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                      arText:
                                                                          'ل.س',
                                                                      enText:
                                                                          'S.P',
                                                                    );
                                                                  }
                                                                }(),
                                                              ),
                                                            ),
                                                            wrapWithModel(
                                                              model: _model
                                                                  .summaryRowModel3,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  SummaryRowWidget(
                                                                label:
                                                                    'رسوم الشحن',
                                                                isTotal: false,
                                                                value: _model
                                                                    .price
                                                                    ?.toString(),
                                                                currency: () {
                                                                  if (_model
                                                                          .currencyValue ==
                                                                      'يورو') {
                                                                    return '€';
                                                                  } else if (_model
                                                                          .currencyValue ==
                                                                      'دولار أمريكي') {
                                                                    return '\$';
                                                                  } else {
                                                                    return FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                      arText:
                                                                          'ل.س',
                                                                      enText:
                                                                          'S.P',
                                                                    );
                                                                  }
                                                                }(),
                                                              ),
                                                            ),
                                                            wrapWithModel(
                                                              model: _model
                                                                  .summaryRowModel4,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  SummaryRowWidget(
                                                                label:
                                                                    'التوصيل إلى موقعك',
                                                                isTotal: false,
                                                                value: FFAppState()
                                                                    .delevery2
                                                                    .toString(),
                                                                currency: () {
                                                                  if (_model
                                                                          .currencyValue ==
                                                                      'يورو') {
                                                                    return '€';
                                                                  } else if (_model
                                                                          .currencyValue ==
                                                                      'دولار أمريكي') {
                                                                    return '\$';
                                                                  } else {
                                                                    return FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                      arText:
                                                                          'ل.س',
                                                                      enText:
                                                                          'S.P',
                                                                    );
                                                                  }
                                                                }(),
                                                              ),
                                                            ),
                                                            StyledDivider(
                                                              height: 16.0,
                                                              thickness: 0.0,
                                                              indent: 0.0,
                                                              endIndent: 0.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              lineStyle:
                                                                  DividerLineStyle
                                                                      .dashdotted,
                                                            ),
                                                            wrapWithModel(
                                                              model: _model
                                                                  .summaryRowModel5,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  SummaryRowWidget(
                                                                label:
                                                                    'الإجمالي التقريبي',
                                                                isTotal: true,
                                                                value:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  _model.total
                                                                      ?.toString(),
                                                                  '000',
                                                                ),
                                                                currency: () {
                                                                  if (_model
                                                                          .currencyValue ==
                                                                      'يورو') {
                                                                    return '€';
                                                                  } else if (_model
                                                                          .currencyValue ==
                                                                      'دولار أمريكي') {
                                                                    return '\$';
                                                                  } else {
                                                                    return FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                      arText:
                                                                          'ل.س',
                                                                      enText:
                                                                          'S.P',
                                                                    );
                                                                  }
                                                                }(),
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                ),
                                                                child:
                                                                    Container(),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 8.0)),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .info_outline,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .warning,
                                                              size: 14.0,
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'oqt2lobh' /* سيتم تأكيد السعر النهائي قبل ع... */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelSmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          lineHeight:
                                                                              1.27,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 4.0)),
                                                        ),
                                                      ),
                                                      StyledDivider(
                                                        height: 30.0,
                                                        thickness: 1.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        lineStyle:
                                                            DividerLineStyle
                                                                .dashed,
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'u83ks0c9' /* 📌 ملاحظة: */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLargeIsCustom,
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '5std6kys' /* لضمان أفضل جودة للخدمة، قد يتم... */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
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
                                          ],
                                        );
                                      }
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 4.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                if (_model.creating != true) {
                                                  if ((_model.categoryValue != null && _model.categoryValue != '') &&
                                                      (_model.nameTextController
                                                                  .text !=
                                                              '') &&
                                                      (_model.priceTextController
                                                                  .text !=
                                                              '') &&
                                                      (_model.currencyValue !=
                                                              null &&
                                                          _model.currencyValue !=
                                                              '') &&
                                                      (_model.textController3
                                                                  .text !=
                                                              '') &&
                                                      (_model.sizeValue !=
                                                              null &&
                                                          _model.sizeValue !=
                                                              '')) {
                                                    if (_model.store == true) {
                                                      if ((_model.storeTextController.text != '') &&
                                                          (_model.storePhoneTextController
                                                                      .text !=
                                                                  '') &&
                                                          (FFAppState()
                                                                      .upAddress !=
                                                                  '')) {
                                                        if (_model.location ==
                                                            true) {
                                                          if ((_model.deleveryGovernoratesValue !=
                                                                      null &&
                                                                  _model.deleveryGovernoratesValue !=
                                                                      '') &&
                                                              (FFAppState()
                                                                          .downAddress !=
                                                                      '')) {
                                                            _model.price =
                                                                valueOrDefault<
                                                                    double>(
                                                              (_model.countControllerValue!) *
                                                                  (functions.getPriceBySize(
                                                                      widget.sizes?.toList(),
                                                                      () {
                                                                        if ((_model.currencyValue ==
                                                                                'دولار أمريكي') ||
                                                                            (_model.currencyValue ==
                                                                                'USD')) {
                                                                          return widget
                                                                              .dollar;
                                                                        } else if ((_model.currencyValue ==
                                                                                'يورو') ||
                                                                            (_model.currencyValue ==
                                                                                'EURO')) {
                                                                          return widget
                                                                              .euro;
                                                                        } else {
                                                                          return widget
                                                                              .prices;
                                                                        }
                                                                      }()
                                                                          ?.toList(),
                                                                      _model.sizeValue)!),
                                                              500.0,
                                                            );
                                                            _model.total =
                                                                valueOrDefault<
                                                                    double>(
                                                              ((_model
                                                                          .countControllerValue!) *
                                                                      (functions
                                                                          .getPriceBySize(
                                                                              widget.sizes
                                                                                  ?.toList(),
                                                                              () {
                                                                                if ((_model.currencyValue == 'دولار أمريكي') || (_model.currencyValue == 'USD')) {
                                                                                  return widget.dollar;
                                                                                } else if ((_model.currencyValue == 'يورو') || (_model.currencyValue == 'EURO')) {
                                                                                  return widget.euro;
                                                                                } else {
                                                                                  return widget.prices;
                                                                                }
                                                                              }()
                                                                                  ?.toList(),
                                                                              _model
                                                                                  .sizeValue)!)) +
                                                                  double.parse(_model
                                                                      .priceTextController
                                                                      .text) +
                                                                  FFAppState()
                                                                      .delevery +
                                                                  FFAppState()
                                                                      .delevery2,
                                                              500.0,
                                                            );
                                                            _model.creating =
                                                                true;
                                                            safeSetState(() {});
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
                                                                        title: FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          arText:
                                                                              'خطأ',
                                                                          enText:
                                                                              'Error',
                                                                        ),
                                                                        text: FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          arText:
                                                                              'يرجى إكمال بيانات مركز الاستلام',
                                                                          enText:
                                                                              'Please complete the branch details.',
                                                                        ),
                                                                        confirm:
                                                                            FFLocalizations.of(context).getVariableText(
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
                                                          if ((_model.branchGovernoratesValue !=
                                                                      null &&
                                                                  _model.branchGovernoratesValue !=
                                                                      '') &&
                                                              (_model.branchesValue !=
                                                                      null &&
                                                                  _model.branchesValue !=
                                                                      '')) {
                                                            _model.price =
                                                                valueOrDefault<
                                                                    double>(
                                                              (_model.countControllerValue!) *
                                                                  (functions.getPriceBySize(
                                                                      widget.sizes?.toList(),
                                                                      () {
                                                                        if ((_model.currencyValue ==
                                                                                'دولار أمريكي') ||
                                                                            (_model.currencyValue ==
                                                                                'USD')) {
                                                                          return widget
                                                                              .dollar;
                                                                        } else if ((_model.currencyValue ==
                                                                                'يورو') ||
                                                                            (_model.currencyValue ==
                                                                                'EURO')) {
                                                                          return widget
                                                                              .euro;
                                                                        } else {
                                                                          return widget
                                                                              .prices;
                                                                        }
                                                                      }()
                                                                          ?.toList(),
                                                                      _model.sizeValue)!),
                                                              500.0,
                                                            );
                                                            _model.total =
                                                                valueOrDefault<
                                                                    double>(
                                                              ((_model.countControllerValue!) *
                                                                      (functions.getPriceBySize(
                                                                          widget
                                                                              .sizes
                                                                              ?.toList(),
                                                                          widget
                                                                              .prices
                                                                              ?.toList(),
                                                                          _model
                                                                              .sizeValue)!)) +
                                                                  double.parse(_model
                                                                      .priceTextController
                                                                      .text) +
                                                                  FFAppState()
                                                                      .delevery,
                                                              500.0,
                                                            );
                                                            _model.creating =
                                                                true;
                                                            safeSetState(() {});
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
                                                                        title: FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          arText:
                                                                              'خطأ',
                                                                          enText:
                                                                              'Error',
                                                                        ),
                                                                        text: FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          arText:
                                                                              'يرجى إكمال بيانات مركز الاستلام',
                                                                          enText:
                                                                              'Please complete the branch details.',
                                                                        ),
                                                                        confirm:
                                                                            FFLocalizations.of(context).getVariableText(
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
                                                                      0.0, 0.0)
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
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.32,
                                                                  child:
                                                                      DialogWidget(
                                                                    title: FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                      arText:
                                                                          'خطأ',
                                                                      enText:
                                                                          'Error',
                                                                    ),
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                      arText:
                                                                          'يرجى إكمال بيانات المتجر',
                                                                      enText:
                                                                          'Please complete the store details.',
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
                                                      if ((_model.prodGovernoratesValue !=
                                                                  null &&
                                                              _model.prodGovernoratesValue !=
                                                                  '') &&
                                                          (_model.reelsTextController
                                                                      .text !=
                                                                  '')) {
                                                        if (_model.location ==
                                                            true) {
                                                          if ((_model.deleveryGovernoratesValue !=
                                                                      null &&
                                                                  _model.deleveryGovernoratesValue !=
                                                                      '') &&
                                                              (FFAppState()
                                                                          .downAddress !=
                                                                      '')) {
                                                            _model.price =
                                                                valueOrDefault<
                                                                    double>(
                                                              (_model.countControllerValue!) *
                                                                  (functions.getPriceBySize(
                                                                      widget.sizes?.toList(),
                                                                      () {
                                                                        if ((_model.currencyValue ==
                                                                                'دولار أمريكي') ||
                                                                            (_model.currencyValue ==
                                                                                'USD')) {
                                                                          return widget
                                                                              .dollar;
                                                                        } else if ((_model.currencyValue ==
                                                                                'يورو') ||
                                                                            (_model.currencyValue ==
                                                                                'EURO')) {
                                                                          return widget
                                                                              .euro;
                                                                        } else {
                                                                          return widget
                                                                              .prices;
                                                                        }
                                                                      }()
                                                                          ?.toList(),
                                                                      _model.sizeValue)!),
                                                              500.0,
                                                            );
                                                            _model.total =
                                                                valueOrDefault<
                                                                    double>(
                                                              ((_model
                                                                          .countControllerValue!) *
                                                                      (functions
                                                                          .getPriceBySize(
                                                                              widget.sizes
                                                                                  ?.toList(),
                                                                              () {
                                                                                if ((_model.currencyValue == 'دولار أمريكي') || (_model.currencyValue == 'USD')) {
                                                                                  return widget.dollar;
                                                                                } else if ((_model.currencyValue == 'يورو') || (_model.currencyValue == 'EURO')) {
                                                                                  return widget.euro;
                                                                                } else {
                                                                                  return widget.prices;
                                                                                }
                                                                              }()
                                                                                  ?.toList(),
                                                                              _model
                                                                                  .sizeValue)!)) +
                                                                  double.parse(_model
                                                                      .priceTextController
                                                                      .text) +
                                                                  FFAppState()
                                                                      .delevery2,
                                                              500.0,
                                                            );
                                                            _model.creating =
                                                                true;
                                                            safeSetState(() {});
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
                                                                        title: FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          arText:
                                                                              'خطأ',
                                                                          enText:
                                                                              'Error',
                                                                        ),
                                                                        text: FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          arText:
                                                                              'يرجى إكمال بيانات مركز الاستلام',
                                                                          enText:
                                                                              'Please complete the branch details.',
                                                                        ),
                                                                        confirm:
                                                                            FFLocalizations.of(context).getVariableText(
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
                                                          if ((_model.branchGovernoratesValue !=
                                                                      null &&
                                                                  _model.branchGovernoratesValue !=
                                                                      '') &&
                                                              (_model.branchesValue !=
                                                                      null &&
                                                                  _model.branchesValue !=
                                                                      '')) {
                                                            _model.price =
                                                                valueOrDefault<
                                                                    double>(
                                                              (_model.countControllerValue!) *
                                                                  (functions.getPriceBySize(
                                                                      widget.sizes?.toList(),
                                                                      () {
                                                                        if ((_model.currencyValue ==
                                                                                'دولار أمريكي') ||
                                                                            (_model.currencyValue ==
                                                                                'USD')) {
                                                                          return widget
                                                                              .dollar;
                                                                        } else if ((_model.currencyValue ==
                                                                                'يورو') ||
                                                                            (_model.currencyValue ==
                                                                                'EURO')) {
                                                                          return widget
                                                                              .euro;
                                                                        } else {
                                                                          return widget
                                                                              .prices;
                                                                        }
                                                                      }()
                                                                          ?.toList(),
                                                                      _model.sizeValue)!),
                                                              500.0,
                                                            );
                                                            _model.total =
                                                                valueOrDefault<
                                                                    double>(
                                                              ((_model.countControllerValue!) *
                                                                      (functions.getPriceBySize(
                                                                          widget.sizes?.toList(),
                                                                          () {
                                                                            if ((_model.currencyValue == 'دولار أمريكي') ||
                                                                                (_model.currencyValue == 'USD')) {
                                                                              return widget.dollar;
                                                                            } else if ((_model.currencyValue == 'يورو') || (_model.currencyValue == 'EURO')) {
                                                                              return widget.euro;
                                                                            } else {
                                                                              return widget.prices;
                                                                            }
                                                                          }()
                                                                              ?.toList(),
                                                                          _model.sizeValue)!)) +
                                                                  double.parse(_model.priceTextController.text),
                                                              500.0,
                                                            );
                                                            _model.creating =
                                                                true;
                                                            safeSetState(() {});
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
                                                                        title: FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          arText:
                                                                              'خطأ',
                                                                          enText:
                                                                              'Error',
                                                                        ),
                                                                        text: FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          arText:
                                                                              'يرجى إكمال بيانات مركز الاستلام',
                                                                          enText:
                                                                              'Please complete the branch details.',
                                                                        ),
                                                                        confirm:
                                                                            FFLocalizations.of(context).getVariableText(
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
                                                                      0.0, 0.0)
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
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.32,
                                                                  child:
                                                                      DialogWidget(
                                                                    title: FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                      arText:
                                                                          'خطأ',
                                                                      enText:
                                                                          'Error',
                                                                    ),
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                      arText:
                                                                          'يرجى إكمال بيانات الرابط الإلكتروني',
                                                                      enText:
                                                                          'Please complete the link details.',
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
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
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
                                                            child: Container(
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.32,
                                                              child:
                                                                  DialogWidget(
                                                                title: FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                  arText: 'خطأ',
                                                                  enText:
                                                                      'Error',
                                                                ),
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                  arText:
                                                                      'يرجى إكمال بيانات المنتج',
                                                                  enText:
                                                                      'Please complete the product details.',
                                                                ),
                                                                confirm: FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                  arText:
                                                                      'حسناً',
                                                                  enText: 'OK',
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
                                                  _model.creating = false;
                                                  safeSetState(() {});
                                                }
                                              },
                                              text: _model.creating != true
                                                  ? FFLocalizations.of(context)
                                                      .getVariableText(
                                                      arText: 'استعلام',
                                                      enText: 'inquiry',
                                                    )
                                                  : FFLocalizations.of(context)
                                                      .getVariableText(
                                                      arText: 'تعديل',
                                                      enText: 'Edit',
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
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmallIsCustom,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 4.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed:
                                                  (_model.creating != true)
                                                      ? null
                                                      : () async {
                                                          if ((_model.categoryValue != null && _model.categoryValue != '') &&
                                                              (_model.nameTextController
                                                                          .text !=
                                                                      '') &&
                                                              (_model
                                                                          .priceTextController
                                                                          .text !=
                                                                      '') &&
                                                              (_model.currencyValue !=
                                                                      null &&
                                                                  _model.currencyValue !=
                                                                      '') &&
                                                              (_model.textController3
                                                                          .text !=
                                                                      '') &&
                                                              (_model.sizeValue !=
                                                                      null &&
                                                                  _model.sizeValue !=
                                                                      '')) {
                                                            _model.otlop =
                                                                await ShippingTable()
                                                                    .insert({
                                                              'contains': _model
                                                                  .textController3
                                                                  .text,
                                                              'payAmount': int
                                                                  .tryParse(_model
                                                                      .priceTextController
                                                                      .text),
                                                              'currency': _model
                                                                  .currencyValue,
                                                              'sender':
                                                                  FFAppState()
                                                                      .user
                                                                      .id,
                                                              'notes': _model
                                                                  .categoryValue,
                                                              'category': _model
                                                                  .categoryValue,
                                                              'qty': _model
                                                                  .countControllerValue,
                                                              'otlob': true,
                                                              'size': _model
                                                                  .sizeValue,
                                                              'recipient_name':
                                                                  _model
                                                                      .nameTextController
                                                                      .text,
                                                              'payment': false,
                                                              'barcode': random_data
                                                                  .randomString(
                                                                10,
                                                                10,
                                                                false,
                                                                false,
                                                                true,
                                                              ),
                                                              'status': 0,
                                                              'commision': 0.0,
                                                            });
                                                            if (_model.store ==
                                                                true) {
                                                              if ((_model.storeTextController.text != '') &&
                                                                  (_model.storePhoneTextController
                                                                              .text !=
                                                                          '') &&
                                                                  (FFAppState()
                                                                              .upAddress !=
                                                                          '')) {
                                                                await ShippingTable()
                                                                    .update(
                                                                  data: {
                                                                    'senderPhone':
                                                                        _model
                                                                            .storePhoneTextController
                                                                            .text,
                                                                    'fromLocation':
                                                                        FFAppState()
                                                                            .upAddress,
                                                                    'from':
                                                                        FFAppState()
                                                                            .from,
                                                                    'recipientPhone':
                                                                        FFAppState()
                                                                            .user
                                                                            .phone,
                                                                  },
                                                                  matchingRows:
                                                                      (rows) =>
                                                                          rows.eqOrNull(
                                                                    'id',
                                                                    _model.otlop
                                                                        ?.id,
                                                                  ),
                                                                );
                                                                if (_model
                                                                        .location ==
                                                                    true) {
                                                                  if ((_model.deleveryGovernoratesValue !=
                                                                              null &&
                                                                          _model.deleveryGovernoratesValue !=
                                                                              '') &&
                                                                      (FFAppState().downAddress !=
                                                                              '')) {
                                                                    await ShippingTable()
                                                                        .update(
                                                                      data: {
                                                                        'to': _model
                                                                            .branchGovernoratesValue,
                                                                        'toLocation':
                                                                            FFAppState().downAddress,
                                                                        'price':
                                                                            valueOrDefault<double>(
                                                                          ((_model.countControllerValue!) * (functions.getPriceBySize(widget.sizes?.toList(), widget.prices?.toList(), _model.sizeValue)!)) +
                                                                              double.parse(_model.priceTextController.text) +
                                                                              FFAppState().delevery +
                                                                              FFAppState().delevery2,
                                                                          500.0,
                                                                        ),
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eqOrNull(
                                                                        'id',
                                                                        _model
                                                                            .otlop
                                                                            ?.id,
                                                                      ),
                                                                    );
                                                                    _model.notifysl =
                                                                        await NotificationsTable()
                                                                            .insert({
                                                                      'user_id':
                                                                          FFAppState()
                                                                              .user
                                                                              .id,
                                                                      'title':
                                                                          'خدمة اطلبلي',
                                                                      'body':
                                                                          'شكراً لثقتكم بخدمة اطلبلي من بلقاءسنقوم بمعالجة طلبكم والتواصل معكم',
                                                                      'id': '',
                                                                      'service':
                                                                          'shipping',
                                                                    });
                                                                    _model.price = functions.getPriceBySize(
                                                                        widget.sizes?.toList(),
                                                                        () {
                                                                          if ((_model.currencyValue == 'دولار أمريكي') ||
                                                                              (_model.currencyValue ==
                                                                                  'USD')) {
                                                                            return widget.dollar;
                                                                          } else if ((_model.currencyValue == 'يورو') ||
                                                                              (_model.currencyValue == 'EURO')) {
                                                                            return widget.euro;
                                                                          } else {
                                                                            return widget.prices;
                                                                          }
                                                                        }()
                                                                            ?.toList(),
                                                                        _model.sizeValue);
                                                                    _model.total =
                                                                        valueOrDefault<
                                                                            double>(
                                                                      ((_model.countControllerValue!) * (functions.getPriceBySize(widget.sizes?.toList(), widget.prices?.toList(), _model.sizeValue)!)) +
                                                                          double.parse(_model
                                                                              .priceTextController
                                                                              .text),
                                                                      500.0,
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                    FFAppState()
                                                                            .location =
                                                                        null;
                                                                    FFAppState()
                                                                            .up =
                                                                        null;
                                                                    FFAppState()
                                                                        .upAddress = '';
                                                                    FFAppState()
                                                                            .delevery =
                                                                        0.0;
                                                                    FFAppState()
                                                                            .delevery2 =
                                                                        0.0;
                                                                    FFAppState()
                                                                        .distance = '';
                                                                    FFAppState()
                                                                            .distination =
                                                                        null;
                                                                    FFAppState()
                                                                        .duration = '';
                                                                    FFAppState()
                                                                        .from = '';
                                                                    FFAppState()
                                                                        .to = '';
                                                                    FFAppState()
                                                                            .down =
                                                                        null;
                                                                    FFAppState()
                                                                        .downAddress = '';
                                                                    safeSetState(
                                                                        () {});

                                                                    context.pushNamed(
                                                                        HomePageWidget
                                                                            .routeName);
                                                                  } else {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: MediaQuery.sizeOf(context).height * 0.32,
                                                                              child: DialogWidget(
                                                                                title: FFLocalizations.of(context).getVariableText(
                                                                                  arText: 'خطأ',
                                                                                  enText: 'Error',
                                                                                ),
                                                                                text: FFLocalizations.of(context).getVariableText(
                                                                                  arText: 'يرجى إكمال بيانات موقع الاستلام',
                                                                                  enText: 'Please complete the pickup location details.',
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
                                                                  if ((_model.branchGovernoratesValue !=
                                                                              null &&
                                                                          _model.branchGovernoratesValue !=
                                                                              '') &&
                                                                      (_model.branchesValue !=
                                                                              null &&
                                                                          _model.branchesValue !=
                                                                              '')) {
                                                                    await ShippingTable()
                                                                        .update(
                                                                      data: {
                                                                        'to': _model
                                                                            .branchGovernoratesValue,
                                                                        'toLocation':
                                                                            _model.branchesValue,
                                                                        'price':
                                                                            valueOrDefault<double>(
                                                                          ((_model.countControllerValue!) *
                                                                                  (functions.getPriceBySize(
                                                                                      widget.sizes?.toList(),
                                                                                      () {
                                                                                        if ((_model.currencyValue == 'دولار أمريكي') || (_model.currencyValue == 'USD')) {
                                                                                          return widget.dollar;
                                                                                        } else if ((_model.currencyValue == 'يورو') || (_model.currencyValue == 'EURO')) {
                                                                                          return widget.euro;
                                                                                        } else {
                                                                                          return widget.prices;
                                                                                        }
                                                                                      }()
                                                                                          ?.toList(),
                                                                                      _model.sizeValue)!)) +
                                                                              double.parse(_model.priceTextController.text) +
                                                                              FFAppState().delevery2,
                                                                          500.0,
                                                                        ),
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eqOrNull(
                                                                        'id',
                                                                        _model
                                                                            .otlop
                                                                            ?.id,
                                                                      ),
                                                                    );
                                                                    _model.notifysb =
                                                                        await NotificationsTable()
                                                                            .insert({
                                                                      'user_id':
                                                                          FFAppState()
                                                                              .user
                                                                              .id,
                                                                      'title':
                                                                          'خدمة اطلبلي',
                                                                      'body':
                                                                          'شكراً لثقتكم بخدمة اطلبلي من بلقاءسنقوم بمعالجة طلبكم والتواصل معكم',
                                                                      'service':
                                                                          'shipping',
                                                                    });
                                                                    _model.price = functions.getPriceBySize(
                                                                        widget.sizes?.toList(),
                                                                        () {
                                                                          if ((_model.currencyValue == 'دولار أمريكي') ||
                                                                              (_model.currencyValue ==
                                                                                  'USD')) {
                                                                            return widget.dollar;
                                                                          } else if ((_model.currencyValue == 'يورو') ||
                                                                              (_model.currencyValue == 'EURO')) {
                                                                            return widget.euro;
                                                                          } else {
                                                                            return widget.prices;
                                                                          }
                                                                        }()
                                                                            ?.toList(),
                                                                        _model.sizeValue);
                                                                    _model.total =
                                                                        valueOrDefault<
                                                                            double>(
                                                                      ((_model.countControllerValue!) *
                                                                              (functions.getPriceBySize(
                                                                                  widget.sizes?.toList(),
                                                                                  () {
                                                                                    if ((_model.currencyValue == 'دولار أمريكي') || (_model.currencyValue == 'USD')) {
                                                                                      return widget.dollar;
                                                                                    } else if ((_model.currencyValue == 'يورو') || (_model.currencyValue == 'EURO')) {
                                                                                      return widget.euro;
                                                                                    } else {
                                                                                      return widget.prices;
                                                                                    }
                                                                                  }()
                                                                                      ?.toList(),
                                                                                  _model.sizeValue)!)) +
                                                                          double.parse(_model.priceTextController.text) +
                                                                          FFAppState().delevery2,
                                                                      500.0,
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                    FFAppState()
                                                                            .location =
                                                                        null;
                                                                    FFAppState()
                                                                            .up =
                                                                        null;
                                                                    FFAppState()
                                                                        .upAddress = '';
                                                                    FFAppState()
                                                                            .delevery =
                                                                        0.0;
                                                                    FFAppState()
                                                                            .delevery2 =
                                                                        0.0;
                                                                    FFAppState()
                                                                        .distance = '';
                                                                    FFAppState()
                                                                            .distination =
                                                                        null;
                                                                    FFAppState()
                                                                        .duration = '';
                                                                    FFAppState()
                                                                        .from = '';
                                                                    FFAppState()
                                                                        .to = '';
                                                                    FFAppState()
                                                                            .down =
                                                                        null;
                                                                    FFAppState()
                                                                        .downAddress = '';
                                                                    safeSetState(
                                                                        () {});

                                                                    context.pushNamed(
                                                                        HomePageWidget
                                                                            .routeName);
                                                                  } else {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: MediaQuery.sizeOf(context).height * 0.32,
                                                                              child: DialogWidget(
                                                                                title: FFLocalizations.of(context).getVariableText(
                                                                                  arText: 'خطأ',
                                                                                  enText: 'Error',
                                                                                ),
                                                                                text: FFLocalizations.of(context).getVariableText(
                                                                                  arText: 'يرجى إكمال بيانات موقع الاستلام',
                                                                                  enText: 'Please complete the pickup location details.',
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
                                                                }
                                                              } else {
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
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.32,
                                                                          child:
                                                                              DialogWidget(
                                                                            title:
                                                                                FFLocalizations.of(context).getVariableText(
                                                                              arText: 'خطأ',
                                                                              enText: 'Error',
                                                                            ),
                                                                            text:
                                                                                FFLocalizations.of(context).getVariableText(
                                                                              arText: 'يرجى إكمال بيانات المتجر',
                                                                              enText: 'Please complete the store details.',
                                                                            ),
                                                                            confirm:
                                                                                FFLocalizations.of(context).getVariableText(
                                                                              arText: 'حسناً',
                                                                              enText: 'OK',
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
                                                              if ((_model.prodGovernoratesValue !=
                                                                          null &&
                                                                      _model.prodGovernoratesValue !=
                                                                          '') &&
                                                                  (_model.reelsTextController
                                                                              .text !=
                                                                          '')) {
                                                                await ShippingTable()
                                                                    .update(
                                                                  data: {
                                                                    'otlob_link':
                                                                        _model
                                                                            .reelsTextController
                                                                            .text,
                                                                    'from': _model
                                                                        .prodGovernoratesValue,
                                                                    'fromLocation':
                                                                        _model
                                                                            .prodGovernoratesValue,
                                                                    'recipientPhone':
                                                                        _model
                                                                            .prodGovernoratesValue,
                                                                  },
                                                                  matchingRows:
                                                                      (rows) =>
                                                                          rows.eqOrNull(
                                                                    'id',
                                                                    _model.otlop
                                                                        ?.id,
                                                                  ),
                                                                );
                                                                if (_model
                                                                        .location ==
                                                                    true) {
                                                                  if ((_model.deleveryGovernoratesValue !=
                                                                              null &&
                                                                          _model.deleveryGovernoratesValue !=
                                                                              '') &&
                                                                      (FFAppState().downAddress !=
                                                                              '')) {
                                                                    await ShippingTable()
                                                                        .update(
                                                                      data: {
                                                                        'to': _model
                                                                            .branchGovernoratesValue,
                                                                        'toLocation':
                                                                            FFAppState().downAddress,
                                                                        'price':
                                                                            valueOrDefault<double>(
                                                                          ((_model.countControllerValue!) *
                                                                                  (functions.getPriceBySize(
                                                                                      widget.sizes?.toList(),
                                                                                      () {
                                                                                        if ((_model.currencyValue == 'دولار أمريكي') || (_model.currencyValue == 'USD')) {
                                                                                          return widget.dollar;
                                                                                        } else if ((_model.currencyValue == 'يورو') || (_model.currencyValue == 'EURO')) {
                                                                                          return widget.euro;
                                                                                        } else {
                                                                                          return widget.prices;
                                                                                        }
                                                                                      }()
                                                                                          ?.toList(),
                                                                                      _model.sizeValue)!)) +
                                                                              double.parse(_model.priceTextController.text) +
                                                                              FFAppState().delevery2,
                                                                          500.0,
                                                                        ),
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eqOrNull(
                                                                        'id',
                                                                        _model
                                                                            .otlop
                                                                            ?.id,
                                                                      ),
                                                                    );
                                                                    _model.notifyrel =
                                                                        await NotificationsTable()
                                                                            .insert({
                                                                      'user_id':
                                                                          FFAppState()
                                                                              .user
                                                                              .id,
                                                                      'title':
                                                                          'خدمة اطلبلي',
                                                                      'body':
                                                                          'شكراً لثقتكم بخدمة اطلبلي من بلقاءسنقوم بمعالجة طلبكم والتواصل معكم',
                                                                      'service':
                                                                          'shipping',
                                                                    });
                                                                    _model.price = functions.getPriceBySize(
                                                                        widget.sizes?.toList(),
                                                                        () {
                                                                          if ((_model.currencyValue == 'دولار أمريكي') ||
                                                                              (_model.currencyValue ==
                                                                                  'USD')) {
                                                                            return widget.dollar;
                                                                          } else if ((_model.currencyValue == 'يورو') ||
                                                                              (_model.currencyValue == 'EURO')) {
                                                                            return widget.euro;
                                                                          } else {
                                                                            return widget.prices;
                                                                          }
                                                                        }()
                                                                            ?.toList(),
                                                                        _model.sizeValue);
                                                                    _model.total =
                                                                        valueOrDefault<
                                                                            double>(
                                                                      ((_model.countControllerValue!) *
                                                                              (functions.getPriceBySize(
                                                                                  widget.sizes?.toList(),
                                                                                  () {
                                                                                    if ((_model.currencyValue == 'دولار أمريكي') || (_model.currencyValue == 'USD')) {
                                                                                      return widget.dollar;
                                                                                    } else if ((_model.currencyValue == 'يورو') || (_model.currencyValue == 'EURO')) {
                                                                                      return widget.euro;
                                                                                    } else {
                                                                                      return widget.prices;
                                                                                    }
                                                                                  }()
                                                                                      ?.toList(),
                                                                                  _model.sizeValue)!)) +
                                                                          double.parse(_model.priceTextController.text) +
                                                                          FFAppState().delevery2,
                                                                      500.0,
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                    FFAppState()
                                                                            .location =
                                                                        null;
                                                                    FFAppState()
                                                                            .up =
                                                                        null;
                                                                    FFAppState()
                                                                        .upAddress = '';
                                                                    FFAppState()
                                                                            .delevery =
                                                                        0.0;
                                                                    FFAppState()
                                                                            .delevery2 =
                                                                        0.0;
                                                                    FFAppState()
                                                                        .distance = '';
                                                                    FFAppState()
                                                                            .distination =
                                                                        null;
                                                                    FFAppState()
                                                                        .duration = '';
                                                                    FFAppState()
                                                                        .from = '';
                                                                    FFAppState()
                                                                        .to = '';
                                                                    FFAppState()
                                                                            .down =
                                                                        null;
                                                                    FFAppState()
                                                                        .downAddress = '';
                                                                    safeSetState(
                                                                        () {});

                                                                    context.pushNamed(
                                                                        HomePageWidget
                                                                            .routeName);
                                                                  } else {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: MediaQuery.sizeOf(context).height * 0.32,
                                                                              child: DialogWidget(
                                                                                title: FFLocalizations.of(context).getVariableText(
                                                                                  arText: 'خطأ',
                                                                                  enText: 'Error',
                                                                                ),
                                                                                text: FFLocalizations.of(context).getVariableText(
                                                                                  arText: 'يرجى إكمال بيانات موقع الاستلام',
                                                                                  enText: 'Please complete the pickup location details.',
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
                                                                  if ((_model.branchGovernoratesValue !=
                                                                              null &&
                                                                          _model.branchGovernoratesValue !=
                                                                              '') &&
                                                                      (_model.branchesValue !=
                                                                              null &&
                                                                          _model.branchesValue !=
                                                                              '')) {
                                                                    await ShippingTable()
                                                                        .update(
                                                                      data: {
                                                                        'to': _model
                                                                            .branchGovernoratesValue,
                                                                        'toLocation':
                                                                            _model.branchesValue,
                                                                        'price':
                                                                            valueOrDefault<double>(
                                                                          ((_model.countControllerValue!) *
                                                                                  (functions.getPriceBySize(
                                                                                      widget.sizes?.toList(),
                                                                                      () {
                                                                                        if ((_model.currencyValue == 'دولار أمريكي') || (_model.currencyValue == 'USD')) {
                                                                                          return widget.dollar;
                                                                                        } else if ((_model.currencyValue == 'يورو') || (_model.currencyValue == 'EURO')) {
                                                                                          return widget.euro;
                                                                                        } else {
                                                                                          return widget.prices;
                                                                                        }
                                                                                      }()
                                                                                          ?.toList(),
                                                                                      _model.sizeValue)!)) +
                                                                              double.parse(_model.priceTextController.text),
                                                                          500.0,
                                                                        ),
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eqOrNull(
                                                                        'id',
                                                                        _model
                                                                            .otlop
                                                                            ?.id,
                                                                      ),
                                                                    );
                                                                    _model.notifyreb =
                                                                        await NotificationsTable()
                                                                            .insert({
                                                                      'user_id':
                                                                          FFAppState()
                                                                              .user
                                                                              .id,
                                                                      'title':
                                                                          'خدمة اطلبلي',
                                                                      'body':
                                                                          'شكراً لثقتكم بخدمة اطلبلي من بلقاءسنقوم بمعالجة طلبكم والتواصل معكم',
                                                                      'service':
                                                                          'shipping',
                                                                    });
                                                                    _model.price = functions.getPriceBySize(
                                                                        widget.sizes?.toList(),
                                                                        () {
                                                                          if ((_model.currencyValue == 'دولار أمريكي') ||
                                                                              (_model.currencyValue ==
                                                                                  'USD')) {
                                                                            return widget.dollar;
                                                                          } else if ((_model.currencyValue == 'يورو') ||
                                                                              (_model.currencyValue == 'EURO')) {
                                                                            return widget.euro;
                                                                          } else {
                                                                            return widget.prices;
                                                                          }
                                                                        }()
                                                                            ?.toList(),
                                                                        _model.sizeValue);
                                                                    _model.total =
                                                                        valueOrDefault<
                                                                            double>(
                                                                      ((_model.countControllerValue!) *
                                                                              (functions.getPriceBySize(
                                                                                  widget.sizes?.toList(),
                                                                                  () {
                                                                                    if ((_model.currencyValue == 'دولار أمريكي') || (_model.currencyValue == 'USD')) {
                                                                                      return widget.dollar;
                                                                                    } else if ((_model.currencyValue == 'يورو') || (_model.currencyValue == 'EURO')) {
                                                                                      return widget.euro;
                                                                                    } else {
                                                                                      return widget.prices;
                                                                                    }
                                                                                  }()
                                                                                      ?.toList(),
                                                                                  _model.sizeValue)!)) +
                                                                          double.parse(_model.priceTextController.text),
                                                                      500.0,
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                    FFAppState()
                                                                            .location =
                                                                        null;
                                                                    FFAppState()
                                                                            .up =
                                                                        null;
                                                                    FFAppState()
                                                                        .upAddress = '';
                                                                    FFAppState()
                                                                            .delevery =
                                                                        0.0;
                                                                    FFAppState()
                                                                            .delevery2 =
                                                                        0.0;
                                                                    FFAppState()
                                                                        .distance = '';
                                                                    FFAppState()
                                                                            .distination =
                                                                        null;
                                                                    FFAppState()
                                                                        .duration = '';
                                                                    FFAppState()
                                                                        .from = '';
                                                                    FFAppState()
                                                                        .to = '';
                                                                    FFAppState()
                                                                            .down =
                                                                        null;
                                                                    FFAppState()
                                                                        .downAddress = '';
                                                                    safeSetState(
                                                                        () {});

                                                                    context.pushNamed(
                                                                        HomePageWidget
                                                                            .routeName);
                                                                  } else {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: MediaQuery.sizeOf(context).height * 0.32,
                                                                              child: DialogWidget(
                                                                                title: FFLocalizations.of(context).getVariableText(
                                                                                  arText: 'خطأ',
                                                                                  enText: 'Error',
                                                                                ),
                                                                                text: FFLocalizations.of(context).getVariableText(
                                                                                  arText: 'يرجى إكمال بيانات موقع الاستلام',
                                                                                  enText: 'Please complete the pickup location details.',
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
                                                                }
                                                              } else {
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
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.32,
                                                                          child:
                                                                              DialogWidget(
                                                                            title:
                                                                                FFLocalizations.of(context).getVariableText(
                                                                              arText: 'خطأ',
                                                                              enText: 'Error',
                                                                            ),
                                                                            text:
                                                                                FFLocalizations.of(context).getVariableText(
                                                                              arText: 'يرجى إكمال بيانات الرابط الإلكتروني',
                                                                              enText: 'Please complete the link details.',
                                                                            ),
                                                                            confirm:
                                                                                FFLocalizations.of(context).getVariableText(
                                                                              arText: 'حسناً',
                                                                              enText: 'OK',
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
                                                                        title: FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          arText:
                                                                              'خطأ',
                                                                          enText:
                                                                              'Error',
                                                                        ),
                                                                        text: FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          arText:
                                                                              'يرجى إكمال بيانات المنتج',
                                                                          enText:
                                                                              'Please complete the product details.',
                                                                        ),
                                                                        confirm:
                                                                            FFLocalizations.of(context).getVariableText(
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

                                                          safeSetState(() {});
                                                        },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'x4flrcjl' /* اطلبلي */,
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
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmallIsCustom,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                disabledColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                disabledTextColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
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
                        ]
                            .addToStart(SizedBox(height: 16.0))
                            .addToEnd(SizedBox(height: 24.0)),
                      ),
                    ),
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
