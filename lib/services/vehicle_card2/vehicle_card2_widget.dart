import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'vehicle_card2_model.dart';
export 'vehicle_card2_model.dart';

class VehicleCard2Widget extends StatefulWidget {
  const VehicleCard2Widget({
    super.key,
    bool? selected,
    this.icon,
    String? type,
    String? capacity,
  })  : this.selected = selected ?? true,
        this.type = type ?? 'سيارة عادية',
        this.capacity = capacity ?? 'حتى 4 ركاب';

  final bool selected;
  final Widget? icon;
  final String type;
  final String capacity;

  @override
  State<VehicleCard2Widget> createState() => _VehicleCard2WidgetState();
}

class _VehicleCard2WidgetState extends State<VehicleCard2Widget> {
  late VehicleCard2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VehicleCard2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: valueOrDefault<bool>(
                widget.selected,
                true,
              ) ==
              false
          ? 3.0
          : 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            valueOrDefault<bool>(
              widget.selected,
              true,
            )
                ? Color(0x0D1D4847)
                : FlutterFlowTheme.of(context).secondaryBackground,
            Color(0x0D1D4847),
          ),
          borderRadius: BorderRadius.circular(20.0),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: valueOrDefault<Color>(
              valueOrDefault<bool>(
                widget.selected,
                true,
              )
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).secondaryBackground,
              FlutterFlowTheme.of(context).primary,
            ),
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.selected)
                      Icon(
                        Icons.check_circle_rounded,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                    Container(
                      width: 48.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: valueOrDefault<Color>(
                          valueOrDefault<bool>(
                            widget.selected,
                            true,
                          )
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          FlutterFlowTheme.of(context).primary,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                        shape: BoxShape.rectangle,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: widget.icon!,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.type,
                        'سيارة حديثة',
                      ),
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            lineHeight: 1.35,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleMediumIsCustom,
                          ),
                    ),
                    RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              't6k0myae' /* حتى  */,
                            ),
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: valueOrDefault<String>(
                              widget.capacity,
                              '4',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  lineHeight: 1.38,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .labelMediumIsCustom,
                                ),
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'maf4qfjk' /*  ركاب */,
                            ),
                            style: TextStyle(),
                          )
                        ],
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  lineHeight: 1.38,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .labelMediumIsCustom,
                                ),
                      ),
                    ),
                    Text(
                      widget.type == 'سيارة حديثة'
                          ? 'مكيّفة • عائلية'
                          : 'الأمتعة • مجموعات',
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodySmallFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            lineHeight: 1.38,
                            useGoogleFonts:
                                !FlutterFlowTheme.of(context).bodySmallIsCustom,
                          ),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
