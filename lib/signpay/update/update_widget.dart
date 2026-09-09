import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'update_model.dart';
export 'update_model.dart';

/// Design a premium, modern Material 3 update component for a mobile app.
///
/// The component appears as a centered modal/bottom sheet with rounded 28px
/// corners, soft elevation, and generous spacing.
/// At the top, display a friendly illustration representing a new app update
/// (cloud download, rocket launch, or app upgrade) using a clean flat style
/// with subtle gradients.
/// Below the illustration:
/// Title
/// "يتوفر إصدار جديد"
/// Description
/// "قم بتحديث التطبيق للاستفادة من أحدث الميزات، وتحسين الأداء، وإصلاح
/// الأخطاء لضمان أفضل تجربة استخدام."
/// Add a small version badge:
/// الإصدار الجديد v2.4.0
/// Display three compact feature chips:
/// أداء أسرع
/// إصلاحات وتحسينات
/// ميزات جديدة
/// At the bottom place two large Material 3 buttons:
/// Primary Filled Button
/// "تحديث عبر Google Play"
/// with Google Play icon.
/// Secondary Filled Tonal Button
/// "تحديث عبر App Store"
/// with Apple icon.
/// Add a subtle text button underneath:
/// "لاحقًا"
/// Design requirements:
/// Material 3
/// Arabic RTL
/// Premium fintech quality
/// 24px outer padding
/// 16px spacing between sections
/// Rounded buttons (18–20px radius)
/// Large touch targets (56px height)
/// Soft shadows only
/// Elegant typography hierarchy
/// Minimal, clean, trustworthy appearance
/// Responsive for all screen sizes
/// Smooth entrance animation (Fade + Slide Up)
/// Button press animation with subtle scale effect
/// Illustration occupies about 35% of the component height
/// Use modern, calming colors with excellent accessibility and contrast.
/// The overall feeling should be polished, premium, and comparable to Google
/// Wallet, Uber, or Airbnb update dialogs.
class UpdateWidget extends StatefulWidget {
  const UpdateWidget({
    super.key,
    String? version,
    required this.play,
    required this.app,
  }) : this.version = version ?? '';

  final String version;
  final String? play;
  final String? app;

  @override
  State<UpdateWidget> createState() => _UpdateWidgetState();
}

class _UpdateWidgetState extends State<UpdateWidget> {
  late UpdateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 580.0,
      constraints: BoxConstraints(
        maxWidth: 480.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.0),
          topRight: Radius.circular(28.0),
        ),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 40.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(9999.0),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Logo_transparent-2.png',
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'a6f37tkx' /* تحديث جديد متوفر */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).headlineMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                    ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'qkoq1mkl' /* نسخة جديدة من تطبيق بَلقاء لوج... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                    ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'at7z6r8q' /* تحسينات على الأداء وإصلاح بعض ... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                    ),
              ),
              if (isAndroid)
                FFButtonWidget(
                  onPressed: () async {
                    await launchURL(widget.play!);
                  },
                  text: FFLocalizations.of(context).getText(
                    'jhescxrj' /* التحديث من متجر Play */,
                  ),
                  icon: FaIcon(
                    FontAwesomeIcons.googlePlay,
                    size: 36.0,
                  ),
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    height: 80.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                    iconPadding: EdgeInsets.all(16.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: Colors.white,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).titleSmallIsCustom,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              if (isiOS)
                FFButtonWidget(
                  onPressed: () async {
                    await launchURL(widget.app!);
                  },
                  text: FFLocalizations.of(context).getText(
                    'juaaeatd' /* التحديث من App Store */,
                  ),
                  icon: FaIcon(
                    FontAwesomeIcons.appStoreIos,
                    size: 36.0,
                  ),
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    height: 80.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                    iconPadding: EdgeInsets.all(16.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: Colors.white,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).titleSmallIsCustom,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
