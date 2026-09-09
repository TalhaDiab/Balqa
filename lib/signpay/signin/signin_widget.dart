import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/zcomponents/dialog/dialog_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'signin_model.dart';
export 'signin_model.dart';

class SigninWidget extends StatefulWidget {
  const SigninWidget({super.key});

  static String routeName = 'signin';
  static String routePath = 'signin';

  @override
  State<SigninWidget> createState() => _SigninWidgetState();
}

class _SigninWidgetState extends State<SigninWidget> {
  late SigninModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SigninModel());

    _model.phoneNumberFieldTextController ??= TextEditingController();
    _model.phoneNumberFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 6,
              child: Container(
                width: 100.0,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Logo_transparent-2.png',
                              height: 141.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '5lsqzgcb' /* تسجيل الدخول */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .displaySmallFamily,
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 34.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .displaySmallIsCustom,
                              ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            14.0, 0.0, 14.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    14.0, 0.0, 14.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'w1r5un00' /* رقم الهاتف */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyLargeFamily,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyLargeIsCustom,
                                      ),
                                ),
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Container(
                                height: 56.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 0.1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 8.0, 6.0),
                                          child: TextFormField(
                                            controller: _model
                                                .phoneNumberFieldTextController,
                                            focusNode: _model
                                                .phoneNumberFieldFocusNode,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMediumIsCustom,
                                                      ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'clzf9auu' /* رقم الهاتف */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMediumIsCustom,
                                                      ),
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                            maxLength: valueOrDefault<int>(
                                              functions.numberLength(
                                                  FFAppState().CountryValue),
                                              9,
                                            ),
                                            buildCounter: (context,
                                                    {required currentLength,
                                                    required isFocused,
                                                    maxLength}) =>
                                                null,
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            validator: _model
                                                .phoneNumberFieldTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 0.0, 2.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if ((_model.phoneNumberFieldTextController
                                                    .text !=
                                                '') ||
                                        (_model.phoneNumberFieldTextController
                                                .text ==
                                            '9988007766')) {
                                      _model.user =
                                          await UsersTable().queryRows(
                                        queryFn: (q) => q.eqOrNull(
                                          'phone',
                                          '${valueOrDefault<String>(
                                            functions.dialCode(
                                                functions.dialCode(
                                                    FFAppState().CountryValue)),
                                            '+963',
                                          )}${_model.phoneNumberFieldTextController.text}',
                                        ),
                                      );
                                      if (_model.user!.length > 0) {
                                        FFAppState().updateUserStruct(
                                          (e) => e
                                            ..phone = '${valueOrDefault<String>(
                                              functions.dialCode(functions
                                                  .dialCode(FFAppState()
                                                      .CountryValue)),
                                              '+963',
                                            )}${_model.phoneNumberFieldTextController.text}'
                                            ..name =
                                                _model.user?.firstOrNull?.name,
                                        );
                                        FFAppState().otp =
                                            random_data.randomString(
                                          6,
                                          6,
                                          false,
                                          false,
                                          true,
                                        );
                                        _model.otp = await OtpCall.call(
                                          phone: '${valueOrDefault<String>(
                                            functions.dialCode(
                                                functions.dialCode(
                                                    FFAppState().CountryValue)),
                                            '+963',
                                          )}${_model.phoneNumberFieldTextController.text}',
                                          code: FFAppState().otp,
                                        );

                                        if ((_model.otp?.succeeded ?? true)) {
                                          await UsersTable().update(
                                            data: {
                                              'phone':
                                                  '${valueOrDefault<String>(
                                                functions.dialCode(functions
                                                    .dialCode(FFAppState()
                                                        .CountryValue)),
                                                '+963',
                                              )}${_model.phoneNumberFieldTextController.text}',
                                              'password': FFAppState().otp,
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              _model.user?.firstOrNull?.id,
                                            ),
                                          );

                                          context.pushNamed(
                                            CodeWidget.routeName,
                                            queryParameters: {
                                              'phone': serializeParam(
                                                FFAppState().user.phone,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Container(
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.36,
                                                    child: DialogWidget(
                                                      title: FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        arText: 'خطأ',
                                                        enText: 'Error',
                                                      ),
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        arText:
                                                            'يرجى إدخال رقم الهاتف مع رمز الدولة بشكل صحيح',
                                                        enText:
                                                            'Please enter your phone number with the country code correctly.',
                                                      ),
                                                      confirm:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                        arText: 'حسناً',
                                                        enText: 'OK',
                                                      ),
                                                      dismessVis: false,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.32,
                                                  child: DialogWidget(
                                                    title: FFLocalizations.of(
                                                            context)
                                                        .getVariableText(
                                                      arText: 'خطأ',
                                                      enText: 'Error',
                                                    ),
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getVariableText(
                                                      arText:
                                                          'لم نعثر على سجل مطابق للمستخدم',
                                                      enText:
                                                          'We found no record matching the user.',
                                                    ),
                                                    confirm: FFLocalizations.of(
                                                            context)
                                                        .getVariableText(
                                                      arText: 'إنشاء حساب',
                                                      enText: 'Sign Up',
                                                    ),
                                                    dismessVis: true,
                                                    dismess: FFLocalizations.of(
                                                            context)
                                                        .getVariableText(
                                                      arText: 'تعديل الرقم',
                                                      enText:
                                                          'Edit phone number',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(
                                            () => _model.signUp = value));

                                        if (_model.signUp == true) {
                                          context.pushNamed(
                                              SignupWidget.routeName);
                                        } else {
                                          Navigator.pop(context);
                                        }
                                      }
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(dialogContext)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.36,
                                                child: DialogWidget(
                                                  title: FFLocalizations.of(
                                                          context)
                                                      .getVariableText(
                                                    arText: 'خطأ',
                                                    enText: 'Error',
                                                  ),
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getVariableText(
                                                    arText:
                                                        'تأكد من الموافقة على الشروط وإدخال الاسم ورقم الهاتف بشكل صحيح',
                                                    enText:
                                                        'Make sure you agree to the terms and enter your name and phone number correctly.',
                                                  ),
                                                  confirm: FFLocalizations.of(
                                                          context)
                                                      .getVariableText(
                                                    arText: 'حسناً',
                                                    enText: 'OK',
                                                  ),
                                                  dismessVis: false,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'leinpddf' /* تسجيل الدخول */,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 56.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleSmallIsCustom,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 8.0)),
                        ),
                      ),
                    ),
                    Container(
                      width: 100.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
