import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'empty_tickets_model.dart';
export 'empty_tickets_model.dart';

class EmptyTicketsWidget extends StatefulWidget {
  const EmptyTicketsWidget({super.key});

  @override
  State<EmptyTicketsWidget> createState() => _EmptyTicketsWidgetState();
}

class _EmptyTicketsWidgetState extends State<EmptyTicketsWidget> {
  late EmptyTicketsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyTicketsModel());

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
                'assets/images/undraw_travel-destination_d2a9.svg',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Text(
            FFLocalizations.of(context).getText(
              'b3s2qeu2' /* عم تتعذب بالسفر وما حجزت؟ */,
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
