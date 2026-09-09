import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'empty_shipping_model.dart';
export 'empty_shipping_model.dart';

class EmptyShippingWidget extends StatefulWidget {
  const EmptyShippingWidget({super.key});

  @override
  State<EmptyShippingWidget> createState() => _EmptyShippingWidgetState();
}

class _EmptyShippingWidgetState extends State<EmptyShippingWidget> {
  late EmptyShippingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyShippingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SvgPicture.asset(
                'assets/images/undraw_empty-mailbox_ef0e.svg',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            FFLocalizations.of(context).getText(
              't9a7j5dj' /* لسا ما جربت الشحن معنا؟ */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                ),
          ),
        ].divide(SizedBox(height: 32.0)),
      ),
    );
  }
}
