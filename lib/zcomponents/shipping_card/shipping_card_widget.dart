import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'shipping_card_model.dart';
export 'shipping_card_model.dart';

class ShippingCardWidget extends StatefulWidget {
  const ShippingCardWidget({
    super.key,
    required this.from,
    required this.to,
    required this.date,
    required this.up,
    required this.down,
    required this.ticketID,
    required this.barcode,
    required this.state,
    required this.phone,
    required this.size,
    required this.price,
    this.commision,
    required this.oppositePay,
    required this.recipent,
    required this.contents,
    this.amount,
    bool? otlob,
  }) : this.otlob = otlob ?? false;

  final String? from;
  final String? to;
  final DateTime? date;
  final String? up;
  final String? down;
  final int? ticketID;
  final String? barcode;
  final int? state;
  final String? phone;
  final String? size;
  final double? price;
  final double? commision;
  final bool? oppositePay;
  final String? recipent;
  final String? contents;
  final double? amount;
  final bool otlob;

  @override
  State<ShippingCardWidget> createState() => _ShippingCardWidgetState();
}

class _ShippingCardWidgetState extends State<ShippingCardWidget> {
  late ShippingCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShippingCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: FlutterFlowTheme.of(context).secondaryBackground,
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.88,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    widget.recipent,
                                    'موسى العمر',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyLargeFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.5,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyLargeIsCustom,
                                      ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyLargeFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyLargeIsCustom,
                                  ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: 25.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    () {
                                      if (widget.state == 1) {
                                        return FlutterFlowTheme.of(context)
                                            .success;
                                      } else if (widget.state == 0) {
                                        return FlutterFlowTheme.of(context)
                                            .primary;
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .primary;
                                      }
                                    }(),
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 2.0, 8.0, 0.0),
                                  child: Text(
                                    () {
                                      if (widget.state == 0) {
                                        return FFLocalizations.of(context)
                                            .getVariableText(
                                          arText: 'قيد المعالجة',
                                          enText: 'In processing',
                                        );
                                      } else if (widget.state == 1) {
                                        return FFLocalizations.of(context)
                                            .getVariableText(
                                          arText: 'تم التسليم',
                                          enText: 'Delivered',
                                        );
                                      } else if (widget.state == 3) {
                                        return FFLocalizations.of(context)
                                            .getVariableText(
                                          arText: 'مرفوضة',
                                          enText: 'Rejected',
                                        );
                                      } else {
                                        return FFLocalizations.of(context)
                                            .getVariableText(
                                          arText: 'مرتجع',
                                          enText: 'Return',
                                        );
                                      }
                                    }(),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 25.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    widget.oppositePay == false
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context).primary,
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 2.0, 8.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      () {
                                        if ((widget.oppositePay == false) &&
                                            (widget.otlob == false)) {
                                          return FFLocalizations.of(context)
                                              .getVariableText(
                                            arText: 'شحنة عادية',
                                            enText: 'Ordinary',
                                          );
                                        } else if ((widget.oppositePay ==
                                                true) &&
                                            (widget.otlob == false)) {
                                          return FFLocalizations.of(context)
                                              .getVariableText(
                                            arText: 'ضد الدفع',
                                            enText: 'Against payment',
                                          );
                                        } else {
                                          return FFLocalizations.of(context)
                                              .getVariableText(
                                            arText: 'اطلبلي',
                                            enText: 'Order',
                                          );
                                        }
                                      }(),
                                      'ضد الدفع',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.88,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.size,
                                  'شحنة ورقية',
                                ),
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
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: dateTimeFormat(
                                        "d/M/y",
                                        widget.date,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0,
                                      ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(width: 7.0)),
                          ),
                          if (widget.oppositePay == true)
                            RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'f74zoz1l' /* المبلغ:  */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                  TextSpan(
                                    text: valueOrDefault<String>(
                                      widget.amount?.toString(),
                                      '250',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      '2c2xgops' /*  $ */,
                                    ),
                                    style: TextStyle(),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      '3n9oo2g8' /*  -  */,
                                    ),
                                    style: TextStyle(),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      '8yoys5z6' /* العمولة:  */,
                                    ),
                                    style: TextStyle(),
                                  ),
                                  TextSpan(
                                    text: valueOrDefault<String>(
                                      widget.commision?.toString(),
                                      '3',
                                    ),
                                    style: TextStyle(),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'lrd4k65s' /*  $ */,
                                    ),
                                    style: TextStyle(),
                                  )
                                ],
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
                            ),
                          RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'w5ln57n6' /* الأجور:   */,
                                  ),
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    widget.price?.toString(),
                                    '250',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'q976h0h3' /*   ل.س */,
                                  ),
                                  style: TextStyle(),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(height: 6.0)),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.88,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.up,
                                  'دوار الكاردينيا',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget.down,
                                  'بيلدكس',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyLargeFamily,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 14.0,
                                      letterSpacing: 0.5,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyLargeIsCustom,
                                    ),
                              ),
                            ].divide(SizedBox(height: 6.0)),
                          ),
                        ],
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 6.0))
                      .addToStart(SizedBox(height: 12.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    BarcodeWidget(
                      data: widget.barcode!,
                      barcode: Barcode.qrCode(),
                      width: 150.0,
                      height: 150.0,
                      color: FlutterFlowTheme.of(context).primary,
                      backgroundColor: Colors.transparent,
                      errorBuilder: (_context, _error) => SizedBox(
                        width: 150.0,
                        height: 150.0,
                      ),
                      drawText: false,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'e89fdft7' /* يرجى إظهار البوليصة الالكتروني... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'n3ltd6eh' /* رقم البوليصة:  */,
                                ),
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
                              TextSpan(
                                text: valueOrDefault<String>(
                                  widget.barcode,
                                  '56454876',
                                ),
                                style: TextStyle(),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ].divide(SizedBox(height: 8.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.contents,
                          ' محتويات الشحنة',
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).primary,
                              letterSpacing: 0.5,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
