import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/zcomponents/dialog/dialog_widget.dart';
import '/zcomponents/shipping_card/shipping_card_widget.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'shipping_acc_model.dart';
export 'shipping_acc_model.dart';

class ShippingAccWidget extends StatefulWidget {
  const ShippingAccWidget({
    super.key,
    this.shipping,
    this.pay,
  });

  final ShippingRow? shipping;
  final bool? pay;

  static String routeName = 'shippingAcc';
  static String routePath = 'shippingDetails';

  @override
  State<ShippingAccWidget> createState() => _ShippingAccWidgetState();
}

class _ShippingAccWidgetState extends State<ShippingAccWidget> {
  late ShippingAccModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShippingAccModel());

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false)
          ..addListener(() => safeSetState(() {}));
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.payFieldTextController ??= TextEditingController();
    _model.payFieldFocusNode ??= FocusNode();

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
                () {
                  if (widget.shipping?.status == 0) {
                    return FFLocalizations.of(context).getVariableText(
                      arText: 'قيد المعالجة',
                      enText: 'In processing',
                    );
                  } else if (widget.shipping?.status == 1) {
                    return FFLocalizations.of(context).getVariableText(
                      arText: 'تم التسليم',
                      enText: 'Delivered',
                    );
                  } else if (widget.shipping?.status == 3) {
                    return FFLocalizations.of(context).getVariableText(
                      arText: 'مرفوضة',
                      enText: 'Rejected',
                    );
                  } else {
                    return FFLocalizations.of(context).getVariableText(
                      arText: 'مرتجع',
                      enText: 'Return',
                    );
                  }
                }(),
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
          child: Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.96,
                        height: MediaQuery.sizeOf(context).height * 0.66,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: wrapWithModel(
                          model: _model.shippingCardModel,
                          updateCallback: () => safeSetState(() {}),
                          child: ShippingCardWidget(
                            from: widget.shipping!.from!,
                            to: widget.shipping!.to!,
                            up: widget.shipping!.fromLocation!,
                            down: widget.shipping!.toLocation!,
                            ticketID: widget.shipping!.id,
                            barcode: widget.shipping!.barcode!,
                            state: widget.shipping!.status!,
                            phone: widget.shipping!.recipientPhone!,
                            size: widget.shipping!.size!,
                            price: widget.shipping!.price!,
                            commision: widget.shipping?.commision,
                            oppositePay: widget.shipping!.payment!,
                            recipent: widget.shipping!.recipientName!,
                            contents: widget.shipping!.contains,
                            date: widget.shipping!.deliveryDate!,
                            amount: widget.shipping?.payAmount?.toDouble(),
                            otlob: widget.shipping!.otlob,
                          ),
                        ),
                      ),
                    ),
                    if (widget.pay ?? true)
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 4.0),
                          child: Container(
                            child: Container(
                              width: double.infinity,
                              color: Color(0x00000000),
                              child: ExpandableNotifier(
                                controller:
                                    _model.expandableExpandableController,
                                child: ExpandablePanel(
                                  header: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.credit_score_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'ntu1rad3' /* معلومات الدفع */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleLargeIsCustom,
                                            ),
                                      ),
                                    ]
                                        .divide(SizedBox(width: 16.0))
                                        .addToStart(SizedBox(width: 16.0)),
                                  ),
                                  collapsed: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 100.0,
                                        height: 0.1,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                    ],
                                  ),
                                  expanded: Container(
                                    height: 310.0,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: double.infinity,
                                            height: 92.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          14.0, 0.0, 12.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'j184wu51' /* طريقة الدفع */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Color(
                                                                      0xFF1D4847),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                        ]
                                                            .divide(SizedBox(
                                                                width: 16.0))
                                                            .addToStart(
                                                                SizedBox(
                                                                    width: 4.0))
                                                            .addToEnd(SizedBox(
                                                                width: 4.0)),
                                                      ),
                                                      Card(
                                                        clipBehavior: Clip
                                                            .antiAliasWithSaveLayer,
                                                        elevation: 0.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Container(
                                                          height: 60.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
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
                                                                child: Image
                                                                    .network(
                                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSb8QZvNNnSnrZS5XUgzXTxTb6uAALx_hyE1g&s',
                                                                  width: 55.0,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .cover,
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
                                                                        '3ob4cfsb' /* شام كاش */,
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
                                                                                FontWeight.w600,
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
                                                                        'kjbr1o67' /* انقر على الأيقونة لنسخ رقم الح... */,
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
                                                                                FontWeight.w500,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                          ),
                                                                    )),
                                                                  ],
                                                                ),
                                                              ),
                                                              FlutterFlowIconButton(
                                                                borderRadius:
                                                                    8.0,
                                                                buttonSize:
                                                                    40.0,
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
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          arText:
                                                                              'تم نسخ معرف الحساب',
                                                                          enText:
                                                                              'Account ID copied',
                                                                        ),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 4.0)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'gd8tzzo6' /* الكوبونات */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            Color(0xFF1D4847),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                                ),
                                              ]
                                                  .divide(SizedBox(width: 16.0))
                                                  .addToStart(
                                                      SizedBox(width: 16.0)),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 0.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Container(
                                                  height: 60.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      BookingsRow>>(
                                                                future: BookingsTable()
                                                                    .querySingleRow(
                                                                  queryFn: (q) =>
                                                                      q.eqOrNull(
                                                                    'discount_code',
                                                                    _model
                                                                        .textController1
                                                                        .text,
                                                                  ),
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<BookingsRow>
                                                                      textFieldBookingsRowList =
                                                                      snapshot
                                                                          .data!;

                                                                  final textFieldBookingsRow = textFieldBookingsRowList
                                                                          .isNotEmpty
                                                                      ? textFieldBookingsRowList
                                                                          .first
                                                                      : null;

                                                                  return Container(
                                                                    width: double
                                                                        .infinity,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .textController1,
                                                                      focusNode:
                                                                          _model
                                                                              .textFieldFocusNode,
                                                                      autofocus:
                                                                          false,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        isDense:
                                                                            true,
                                                                        labelStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                            ),
                                                                        hintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          '543qcyac' /* أدخل كود الخصم */,
                                                                        ),
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                            ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(14.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(14.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(14.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(14.0),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                        contentPadding:
                                                                            EdgeInsets.all(16.0),
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
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      cursorColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      validator: _model
                                                                          .textController1Validator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          Builder(
                                                            builder:
                                                                (context) =>
                                                                    Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderRadius:
                                                                    12.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor: Color(
                                                                    0xFF2D5050),
                                                                icon: Icon(
                                                                  Icons
                                                                      .check_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  _model.discountCode =
                                                                      await DiscountCodesTable()
                                                                          .queryRows(
                                                                    queryFn:
                                                                        (q) =>
                                                                            q,
                                                                  );
                                                                  _model.usage =
                                                                      await DiscountUsageTable()
                                                                          .queryRows(
                                                                    queryFn: (q) => q
                                                                        .eqOrNull(
                                                                          'user_id',
                                                                          FFAppState()
                                                                              .user
                                                                              .id,
                                                                        )
                                                                        .eqOrNull(
                                                                          'discount_code_id',
                                                                          _model
                                                                              .discountCode
                                                                              ?.where((e) => e.code == _model.payFieldTextController.text)
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.id,
                                                                        ),
                                                                  );
                                                                  if ((_model.discountCode?.where((e) => e.code == _model.textController1.text).toList().firstOrNull?.code == _model.textController1.text) &&
                                                                      (_model.discountCode!.where((e) => e.code == _model.textController1.text).toList().firstOrNull!.usedCount! <
                                                                          _model
                                                                              .discountCode!
                                                                              .where((e) =>
                                                                                  e.code ==
                                                                                  _model
                                                                                      .textController1.text)
                                                                              .toList()
                                                                              .firstOrNull!
                                                                              .usageLimit!) &&
                                                                      (_model.discountCode!.where((e) => e.code == _model.textController1.text).toList().firstOrNull!.limitPerUser! >
                                                                          _model
                                                                              .usage!
                                                                              .length) &&
                                                                      (_model.discountCode
                                                                              ?.where((e) => e.code == _model.textController1.text)
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.discountType ==
                                                                          'shipping')) {
                                                                    _model.bookingDiscountQuery =
                                                                        await ShippingTable()
                                                                            .queryRows(
                                                                      queryFn: (q) => q
                                                                          .eqOrNull(
                                                                            'id',
                                                                            widget.shipping?.id,
                                                                          )
                                                                          .eqOrNull(
                                                                            'discount_code',
                                                                            _model.textController1.text,
                                                                          ),
                                                                    );
                                                                    if (_model
                                                                            .bookingDiscountQuery
                                                                            ?.length ==
                                                                        0) {
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
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Container(
                                                                                height: MediaQuery.sizeOf(context).height * 0.32,
                                                                                child: DialogWidget(
                                                                                  title: FFLocalizations.of(context).getVariableText(
                                                                                    arText: 'مبارك',
                                                                                    enText: 'congrats',
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

                                                                      FFAppState()
                                                                          .price = FFAppState()
                                                                              .price +
                                                                          valueOrDefault<
                                                                              int>(
                                                                            -(_model.discountCode!.where((e) => e.code == _model.payFieldTextController.text).toList().firstOrNull!.discountValue!),
                                                                            -1,
                                                                          );
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.discountUsage =
                                                                          await DiscountUsageTable()
                                                                              .insert({
                                                                        'discount_code_id': _model
                                                                            .discountCode
                                                                            ?.where((e) =>
                                                                                e.code ==
                                                                                _model.payFieldTextController.text)
                                                                            .toList()
                                                                            .firstOrNull
                                                                            ?.id,
                                                                        'user_id': FFAppState()
                                                                            .user
                                                                            .id,
                                                                        'booking_id': widget
                                                                            .shipping
                                                                            ?.id,
                                                                        'used_at':
                                                                            supaSerialize<DateTime>(getCurrentTimestamp),
                                                                      });
                                                                      _model.updated =
                                                                          await ShippingTable()
                                                                              .update(
                                                                        data: {
                                                                          'discount_code': _model
                                                                              .discountCode
                                                                              ?.where((e) => e.code == _model.payFieldTextController.text)
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.code,
                                                                          'price':
                                                                              (widget.shipping!.price!) - (_model.discountCode!.where((e) => e.code == _model.textController1.text).toList().firstOrNull!.discountValue!),
                                                                        },
                                                                        matchingRows:
                                                                            (rows) =>
                                                                                rows.eqOrNull(
                                                                          'id',
                                                                          widget
                                                                              .shipping
                                                                              ?.id,
                                                                        ),
                                                                        returnRows:
                                                                            true,
                                                                      );
                                                                      await DiscountCodesTable()
                                                                          .update(
                                                                        data: {
                                                                          'used_count':
                                                                              (_model.discountCode!.where((e) => e.code == _model.textController1.text).toList().firstOrNull!.usedCount!) + 1,
                                                                        },
                                                                        matchingRows:
                                                                            (rows) =>
                                                                                rows.eqOrNull(
                                                                          'id',
                                                                          _model
                                                                              .discountCode
                                                                              ?.where((e) => e.code == _model.payFieldTextController.text)
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.id,
                                                                        ),
                                                                      );
                                                                      await Future
                                                                          .delayed(
                                                                        Duration(
                                                                          milliseconds:
                                                                              500,
                                                                        ),
                                                                      );

                                                                      context
                                                                          .pushNamed(
                                                                        ShippingAccWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'shipping':
                                                                              serializeParam(
                                                                            widget.shipping,
                                                                            ParamType.SupabaseRow,
                                                                          ),
                                                                          'pay':
                                                                              serializeParam(
                                                                            widget.pay,
                                                                            ParamType.bool,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
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
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Container(
                                                                                height: MediaQuery.sizeOf(context).height * 0.32,
                                                                                child: DialogWidget(
                                                                                  title: FFLocalizations.of(context).getVariableText(
                                                                                    arText: 'تم',
                                                                                    enText: 'Completed',
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

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 12.0)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '4nt09rsp' /* أدخل معرف عملية الدفع */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLargeFamily,
                                                          color:
                                                              Color(0xFF1D4847),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleLargeIsCustom,
                                                        ),
                                                  ),
                                                ]
                                                    .divide(
                                                        SizedBox(width: 16.0))
                                                    .addToStart(
                                                        SizedBox(width: 4.0))
                                                    .addToEnd(
                                                        SizedBox(width: 4.0)),
                                              ),
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 0.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Container(
                                                  height: 60.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .payFieldTextController,
                                                                  focusNode: _model
                                                                      .payFieldFocusNode,
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                        ),
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'sx3vsasw' /* أدخل معرف عملية الدفع */,
                                                                    ),
                                                                    hintStyle: FlutterFlowTheme.of(
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
                                                                              14.0),
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
                                                                              14.0),
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
                                                                              14.0),
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
                                                                              14.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    contentPadding:
                                                                        EdgeInsets.all(
                                                                            16.0),
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
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  cursorColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  validator: _model
                                                                      .payFieldTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Builder(
                                                            builder:
                                                                (context) =>
                                                                    Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderRadius:
                                                                    12.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor: Color(
                                                                    0xFF2D5050),
                                                                icon: Icon(
                                                                  Icons
                                                                      .check_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  if (_model.payFieldTextController
                                                                              .text !=
                                                                          '') {
                                                                    await ShippingTable()
                                                                        .update(
                                                                      data: {
                                                                        'price': FFAppState()
                                                                            .price
                                                                            .toDouble(),
                                                                        'payment': /* NOT RECOMMENDED */
                                                                            _model.payFieldTextController.text ==
                                                                                'true',
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eqOrNull(
                                                                        'id',
                                                                        widget
                                                                            .shipping
                                                                            ?.id,
                                                                      ),
                                                                    );
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
                                                                                  arText: 'رقم عملية التحويل',
                                                                                  enText: 'Transfer transaction number',
                                                                                ),
                                                                                text: FFLocalizations.of(context).getVariableText(
                                                                                  arText: 'شكراً .. سيتم التواصل من قبل فريقنا',
                                                                                  enText: 'Thank you. Our team will contact you.',
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

                                                                    await NotificationsTable()
                                                                        .insert({
                                                                      'user_id':
                                                                          FFAppState()
                                                                              .user
                                                                              .id,
                                                                      'body': FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        arText:
                                                                            'تم استلام الدفع جاري معالجة الطلب',
                                                                        enText:
                                                                            'Payment received. Order processing.',
                                                                      ),
                                                                      'title': FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        arText:
                                                                            'إشعار الدفع',
                                                                        enText:
                                                                            'Payment notification',
                                                                      ),
                                                                      'service':
                                                                          'trip',
                                                                    });

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
                                                                              height: MediaQuery.sizeOf(context).height * 0.36,
                                                                              child: DialogWidget(
                                                                                title: FFLocalizations.of(context).getVariableText(
                                                                                  arText: 'حقل فارغ',
                                                                                  enText: 'Empty field',
                                                                                ),
                                                                                text: FFLocalizations.of(context).getVariableText(
                                                                                  arText: 'يجب إدخال معرف عملية الدفع لتأكيد الشحن',
                                                                                  enText: 'A payment transaction ID must be entered to confirm shipment.',
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

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 12.0)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(height: 12.0))
                                          .addToStart(SizedBox(height: 4.0))
                                          .addToEnd(SizedBox(height: 12.0)),
                                    ),
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                    iconColor:
                                        FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    Stack(
                      alignment: AlignmentDirectional(-0.0, 0.0),
                      children: [
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '384zj7c4' /* سيتم اقتطاع الأجور في حال التر... */,
                                ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                              AutoSizeText(
                                FFLocalizations.of(context).getText(
                                  'g3z0zsml' /* لسنا مسؤولين عن محتويات الشحنة... */,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                minFontSize: 10.0,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodySmallFamily,
                                      color: Color(0xC4EE4444),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodySmallIsCustom,
                                    ),
                              ),
                            ]
                                .addToStart(SizedBox(height: 4.0))
                                .addToEnd(SizedBox(height: 4.0)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(
                          builder: (context) => FFButtonWidget(
                            onPressed: () async {
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
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.62,
                                        child: DialogWidget(
                                          title: FFLocalizations.of(context)
                                              .getVariableText(
                                            arText: 'إلغاء الشحنة',
                                            enText: 'Cancel shipment',
                                          ),
                                          text: FFLocalizations.of(context)
                                              .getVariableText(
                                            arText:
                                                '**هل أنت متأكد من إلغاء الشحنة؟**  في حال كانت الشحنة في المركز ولم يتم شحنها، سيتم رد تكلفة الشحن بعد خصم أجرة المندوب.  أما إذا تم شحنها، فلا يمكن استرداد أي مبالغ، وسيتم تحصيل أجور الشحن العكسي قبل إرجاع الشحنة.',
                                            enText:
                                                '**Are you sure you want to cancel the shipment?** If the shipment is at the center and has not yet been shipped, the shipping cost will be refunded after deducting the courier\'s fee. However, if it has already been shipped, no refunds are possible, and return shipping fees will be charged before the shipment can be returned.',
                                          ),
                                          confirm: FFLocalizations.of(context)
                                              .getVariableText(
                                            arText: 'تأكيد',
                                            enText: 'Confirm',
                                          ),
                                          dismessVis: true,
                                          dismess: FFLocalizations.of(context)
                                              .getVariableText(
                                            arText: 'تجاهل',
                                            enText: 'Ignore',
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) =>
                                  safeSetState(() => _model.dialog = value));

                              if (_model.dialog == true) {
                                await ShippingTable().delete(
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    widget.shipping?.id,
                                  ),
                                );

                                context.pushNamed(HomePageWidget.routeName);
                              }

                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'drh8l5ca' /* إلغاء الشحنة */,
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.46,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context).error,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .titleSmallIsCustom,
                                  ),
                              elevation: 1.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            if (widget.shipping?.tracking == true)
                              FFButtonWidget(
                                onPressed: (widget.shipping?.tracking != true)
                                    ? null
                                    : () async {
                                        if (widget.shipping?.tracking !=
                                            true) {
                                          context.pushNamed(
                                              HomePageWidget.routeName);
                                        } else {
                                          context.pushNamed(
                                            ShipmentTrackingWidget.routeName,
                                            queryParameters: {
                                              'shipmentID': serializeParam(
                                                widget.shipping?.id,
                                                ParamType.int,
                                              ),
                                              'time': serializeParam(
                                                widget.shipping?.deliveryDate,
                                                ParamType.DateTime,
                                              ),
                                            }.withoutNulls,
                                          );
                                        }
                                      },
                                text: FFLocalizations.of(context).getText(
                                  'iou11fvo' /* تتبع الشحنة */,
                                ),
                                options: FFButtonOptions(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.46,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF1D4847),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleSmallIsCustom,
                                      ),
                                  elevation: 1.0,
                                  borderRadius: BorderRadius.circular(16.0),
                                  disabledColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  disabledTextColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            if (widget.shipping?.tracking != true)
                              FFButtonWidget(
                                onPressed: () async {
                                  if (widget.shipping?.tracking != true) {
                                    context.pushNamed(HomePageWidget.routeName);
                                  } else {
                                    context.pushNamed(
                                      ShipmentTrackingWidget.routeName,
                                      queryParameters: {
                                        'shipmentID': serializeParam(
                                          widget.shipping?.id,
                                          ParamType.int,
                                        ),
                                        'time': serializeParam(
                                          widget.shipping?.deliveryDate,
                                          ParamType.DateTime,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
                                },
                                text: FFLocalizations.of(context).getText(
                                  'rt3rq6li' /* الرئيسية */,
                                ),
                                options: FFButtonOptions(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.46,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF1D4847),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleSmallIsCustom,
                                      ),
                                  elevation: 1.0,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ]
                      .divide(SizedBox(height: 12.0))
                      .addToStart(SizedBox(height: 12.0))
                      .addToEnd(SizedBox(height: 16.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
