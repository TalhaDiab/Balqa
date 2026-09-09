import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'card_shipping_model.dart';
export 'card_shipping_model.dart';

class CardShippingWidget extends StatefulWidget {
  const CardShippingWidget({
    super.key,
    required this.recipent,
    required this.from,
    required this.to,
    required this.price,
    required this.state,
    required this.oppositePay,
    int? status,
    required this.size,
    required this.shipping,
    required this.otlob,
    required this.id,
    required this.time,
    required this.pay,
  }) : this.status = status ?? 1;

  final String? recipent;
  final String? from;
  final String? to;
  final double? price;
  final String? state;
  final bool? oppositePay;
  final int status;
  final String? size;
  final ShippingRow? shipping;
  final bool? otlob;
  final int? id;
  final DateTime? time;
  final bool? pay;

  @override
  State<CardShippingWidget> createState() => _CardShippingWidgetState();
}

class _CardShippingWidgetState extends State<CardShippingWidget> {
  late CardShippingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardShippingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          ShippingAccWidget.routeName,
          queryParameters: {
            'shipping': serializeParam(
              widget.shipping,
              ParamType.SupabaseRow,
            ),
            'pay': serializeParam(
              widget.pay,
              ParamType.bool,
            ),
          }.withoutNulls,
        );
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: FlutterFlowTheme.of(context).secondaryBackground,
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 0.0,
                color: FlutterFlowTheme.of(context).alternate,
                offset: Offset(
                  0.0,
                  1.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 16.0,
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.25,
                                height: 25.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.size,
                                      'شحنة ورقية',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.notoKufiArabic(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                              ),
                              if (widget.otlob == false)
                                Icon(
                                  Icons.arrow_forward,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 16.0,
                                ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.25,
                                height: 25.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: Text(
                                    widget.otlob == false
                                        ? widget.recipent!
                                        : ' ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.notoKufiArabic(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                          Container(
                            height: 25.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                () {
                                  if (widget.status == 1) {
                                    return FlutterFlowTheme.of(context).success;
                                  } else if (widget.state == '0') {
                                    return FlutterFlowTheme.of(context).primary;
                                  } else {
                                    return FlutterFlowTheme.of(context).error;
                                  }
                                }(),
                                FlutterFlowTheme.of(context).primary,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.boxOpen,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 14.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: Text(
                                    () {
                                      if (widget.shipping?.status == 0) {
                                        return FFLocalizations.of(context)
                                            .getVariableText(
                                          arText: 'قيد المعالجة',
                                          enText: 'In processing',
                                        );
                                      } else if (widget.shipping?.status ==
                                          1) {
                                        return FFLocalizations.of(context)
                                            .getVariableText(
                                          arText: 'تم التسليم',
                                          enText: 'Delivered',
                                        );
                                      } else if (widget.shipping?.status ==
                                          3) {
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
                              ]
                                  .divide(SizedBox(width: 4.0))
                                  .addToStart(SizedBox(width: 8.0))
                                  .addToEnd(SizedBox(width: 8.0)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 16.0,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 4.0),
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          widget.from,
                                          'حمص',
                                        ),
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'q36i6io5' /*  -  */,
                                        ),
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          widget.to,
                                          'دمشق',
                                        ),
                                        style: TextStyle(),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.notoKufiArabic(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                          Container(
                            height: 25.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                () {
                                  if (widget.oppositePay == true) {
                                    return FlutterFlowTheme.of(context).success;
                                  } else if (widget.otlob == true) {
                                    return FlutterFlowTheme.of(context).warning;
                                  } else {
                                    return FlutterFlowTheme.of(context).primary;
                                  }
                                }(),
                                FlutterFlowTheme.of(context).primary,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.paid_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 16.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: Text(
                                    () {
                                      if (widget.oppositePay == true) {
                                        return FFLocalizations.of(context)
                                            .getVariableText(
                                          arText: 'ضد الدفع',
                                          enText: 'Against payment',
                                        );
                                      } else if (widget.otlob == true) {
                                        return FFLocalizations.of(context)
                                            .getVariableText(
                                          arText: 'اطلبلي',
                                          enText: 'Order',
                                        );
                                      } else {
                                        return FFLocalizations.of(context)
                                            .getVariableText(
                                          arText: 'شحنة عادية',
                                          enText: 'Ordinary',
                                        );
                                      }
                                    }(),
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
                              ]
                                  .divide(SizedBox(width: 4.0))
                                  .addToStart(SizedBox(width: 8.0))
                                  .addToEnd(SizedBox(width: 8.0)),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 4.0)),
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
