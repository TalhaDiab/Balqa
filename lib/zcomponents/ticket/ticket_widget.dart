import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'ticket_model.dart';
export 'ticket_model.dart';

class TicketWidget extends StatefulWidget {
  const TicketWidget({
    super.key,
    int? state,
    this.from,
    this.to,
    this.fromS,
    this.toS,
    this.time,
    this.price,
    this.seats,
    required this.booking,
  }) : this.state = state ?? 0;

  final int state;
  final String? from;
  final String? to;
  final String? fromS;
  final String? toS;
  final DateTime? time;
  final int? price;
  final int? seats;
  final BookingsRow? booking;

  @override
  State<TicketWidget> createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
  late TicketModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TicketModel());

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
        if (widget.state == 0) {
          context.pushNamed(
            TripPayWidget.routeName,
            queryParameters: {
              'status': serializeParam(
                widget.booking?.status,
                ParamType.int,
              ),
              'bookingRow': serializeParam(
                widget.booking,
                ParamType.SupabaseRow,
              ),
            }.withoutNulls,
          );
        } else if (widget.state == 1) {
          context.pushNamed(
            TripPayWidget.routeName,
            queryParameters: {
              'status': serializeParam(
                widget.booking?.status,
                ParamType.int,
              ),
              'bookingRow': serializeParam(
                widget.booking,
                ParamType.SupabaseRow,
              ),
            }.withoutNulls,
          );
        } else if (widget.state == 2) {
          context.pushNamed(
            TrackingWidget.routeName,
            queryParameters: {
              'tripID': serializeParam(
                widget.booking?.tripId,
                ParamType.String,
              ),
              'booking': serializeParam(
                widget.booking?.id,
                ParamType.int,
              ),
            }.withoutNulls,
          );
        }
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: FlutterFlowTheme.of(context).secondaryBackground,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 12.0,
                color: Color(0x34000000),
                offset: Offset(
                  -2.0,
                  5.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 12.0, 6.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: valueOrDefault<String>(
                                widget.from,
                                'حمص',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'qhpj900v' /*  -  */,
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
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                      ),
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: valueOrDefault<String>(
                                widget.fromS,
                                'دوار النخلة ',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .labelMediumIsCustom,
                                  ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'jsmdibim' /*  -  */,
                              ),
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: valueOrDefault<String>(
                                widget.toS,
                                'جسر الحرية',
                              ),
                              style: TextStyle(),
                            )
                          ],
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .labelMediumIsCustom,
                              ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    widget.seats?.toString(),
                                    '4',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelSmallFamily,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelSmallIsCustom,
                                      ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '4m93s014' /*  ركاب */,
                                  ),
                                  style: TextStyle(),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelSmallFamily,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .labelSmallIsCustom,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            () {
                              if (widget.state == 0) {
                                return FlutterFlowTheme.of(context).warning;
                              } else if (widget.state == 1) {
                                return FlutterFlowTheme.of(context).tertiary;
                              } else if (widget.state == 2) {
                                return FlutterFlowTheme.of(context).secondary;
                              } else {
                                return FlutterFlowTheme.of(context).primary;
                              }
                            }(),
                            FlutterFlowTheme.of(context).accent2,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              6.0, 3.0, 6.0, 3.0),
                          child: Text(
                            valueOrDefault<String>(
                              () {
                                if (widget.state == 0) {
                                  return FFLocalizations.of(context)
                                      .getVariableText(
                                    arText: 'انتظار',
                                    enText: 'waiting',
                                  );
                                } else if (widget.state == 1) {
                                  return FFLocalizations.of(context)
                                      .getVariableText(
                                    arText: 'تم التثبيت',
                                    enText: 'Confirmed',
                                  );
                                } else if (widget.state == 2) {
                                  return FFLocalizations.of(context)
                                      .getVariableText(
                                    arText: 'في الطريق',
                                    enText: 'on way',
                                  );
                                } else {
                                  return FFLocalizations.of(context)
                                      .getVariableText(
                                    arText: 'منتهية',
                                    enText: 'Finished',
                                  );
                                }
                              }(),
                              'مثبت',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .labelSmallIsCustom,
                                ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    widget.price?.toString(),
                                    '750',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineSmallFamily,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .headlineSmallIsCustom,
                                      ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '8wcvo7t9' /*  ل.س */,
                                  ),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineSmallFamily,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .headlineSmallIsCustom,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Text(
                          valueOrDefault<String>(
                            dateTimeFormat(
                              "M/d h:mm a",
                              widget.time,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            '7/14 2:05 AM',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineSmallFamily,
                                fontSize: 14.0,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .headlineSmallIsCustom,
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
