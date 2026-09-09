import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'socialmedia_model.dart';
export 'socialmedia_model.dart';

class SocialmediaWidget extends StatefulWidget {
  const SocialmediaWidget({
    super.key,
    required this.site,
  });

  final String? site;

  @override
  State<SocialmediaWidget> createState() => _SocialmediaWidgetState();
}

class _SocialmediaWidgetState extends State<SocialmediaWidget> {
  late SocialmediaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialmediaModel());

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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            await launchURL('https://www.facebook.com/share/1BVRGh16Gn/');
          },
          child: Container(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FaIcon(
                  FontAwesomeIcons.facebookF,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'q8pqtaqr' /* بلقاء */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            await launchURL(
                'https://www.instagram.com/e_b_i_l_t?igsh=dDIzcmhsOHoza253');
          },
          child: Container(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FaIcon(
                  FontAwesomeIcons.instagram,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'av9angtb' /* balqa.sy */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            await launchURL(widget.site!);
          },
          child: Container(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.web,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'ygjpcwn0' /* balqa.sy */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ),
        ),
      ],
    );
  }
}
