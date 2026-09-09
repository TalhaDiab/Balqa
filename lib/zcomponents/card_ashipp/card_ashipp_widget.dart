import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'card_ashipp_model.dart';
export 'card_ashipp_model.dart';

class CardAshippWidget extends StatefulWidget {
  const CardAshippWidget({
    super.key,
    required this.sizes,
    required this.prices,
    required this.kmPrice,
    required this.cityList,
    required this.ltlng,
    required this.branches,
    required this.dollar,
    required this.euro,
    required this.pay,
    required this.categories,
    required this.currency,
    required this.cityListAR,
  });

  final List<String>? sizes;
  final List<double>? prices;
  final int? kmPrice;
  final List<String>? cityList;
  final List<String>? ltlng;
  final List<String>? branches;
  final List<double>? dollar;
  final List<double>? euro;
  final bool? pay;
  final List<String>? categories;
  final List<String>? currency;
  final List<String>? cityListAR;

  @override
  State<CardAshippWidget> createState() => _CardAshippWidgetState();
}

class _CardAshippWidgetState extends State<CardAshippWidget> {
  late CardAshippModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardAshippModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: FlutterFlowTheme.of(context).secondaryBackground,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          width: double.infinity,
          height: 120.0,
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
          ),
          child: Stack(
            alignment: AlignmentDirectional(-0.0, 1.0),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  'https://i.pinimg.com/1200x/e2/0a/d6/e20ad6b5e3af1dca0807ef3f95731eef.jpg',
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 12.0,
                            sigmaY: 12.0,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed(
                                    OrderWidget.routeName,
                                    queryParameters: {
                                      'sizes': serializeParam(
                                        widget.sizes,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                      'prices': serializeParam(
                                        widget.prices,
                                        ParamType.double,
                                        isList: true,
                                      ),
                                      'kmPrice': serializeParam(
                                        widget.kmPrice,
                                        ParamType.int,
                                      ),
                                      'ltlng': serializeParam(
                                        widget.ltlng,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                      'branches': serializeParam(
                                        widget.branches,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                      'dollar': serializeParam(
                                        widget.dollar,
                                        ParamType.double,
                                        isList: true,
                                      ),
                                      'euro': serializeParam(
                                        widget.euro,
                                        ParamType.double,
                                        isList: true,
                                      ),
                                      'gover': serializeParam(
                                        widget.cityList,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                      'pay': serializeParam(
                                        widget.pay,
                                        ParamType.bool,
                                      ),
                                      'category': serializeParam(
                                        widget.categories,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                      'currency': serializeParam(
                                        widget.currency,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                      'cityList': serializeParam(
                                        widget.cityListAR,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                text: FFLocalizations.of(context).getText(
                                  'tdforovm' /* خدمة اطلبلي من المحافظات */,
                                ),
                                icon: Icon(
                                  Icons.arrow_forward,
                                  size: 18.0,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconAlignment: IconAlignment.end,
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleSmallIsCustom,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
