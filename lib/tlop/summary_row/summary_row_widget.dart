import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'summary_row_model.dart';
export 'summary_row_model.dart';

class SummaryRowWidget extends StatefulWidget {
  const SummaryRowWidget({
    super.key,
    String? label,
    bool? isTotal,
    String? value,
    String? currency,
  })  : this.label = label ?? 'سعر المنتج المتوقع',
        this.isTotal = isTotal ?? false,
        this.value = value ?? '00.00',
        this.currency = currency ?? 'ل.س';

  final String label;
  final bool isTotal;
  final String value;
  final String currency;

  @override
  State<SummaryRowWidget> createState() => _SummaryRowWidgetState();
}

class _SummaryRowWidgetState extends State<SummaryRowWidget> {
  late SummaryRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SummaryRowModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          valueOrDefault<String>(
            widget.label,
            'سعر المنتج المتوقع',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                color: valueOrDefault<Color>(
                  valueOrDefault<bool>(
                    widget.isTotal,
                    false,
                  )
                      ? FlutterFlowTheme.of(context).primaryText
                      : FlutterFlowTheme.of(context).secondaryText,
                  Color(0x00000000),
                ),
                letterSpacing: 0.0,
                lineHeight: 1.47,
                useGoogleFonts:
                    !FlutterFlowTheme.of(context).bodyMediumIsCustom,
              ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              valueOrDefault<String>(
                widget.value,
                '00.00',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: valueOrDefault<Color>(
                      valueOrDefault<bool>(
                        widget.isTotal,
                        false,
                      )
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).primaryText,
                      Color(0x00000000),
                    ),
                    letterSpacing: 0.0,
                    lineHeight: 1.47,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                  ),
            ),
            Text(
              valueOrDefault<String>(
                widget.currency,
                ' ل.س ',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: valueOrDefault<Color>(
                      valueOrDefault<bool>(
                        widget.isTotal,
                        false,
                      )
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).primaryText,
                      Color(0x00000000),
                    ),
                    letterSpacing: 0.0,
                    lineHeight: 1.47,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                  ),
            ),
          ].divide(SizedBox(width: 4.0)),
        ),
      ],
    );
  }
}
