import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'doc_model.dart';
export 'doc_model.dart';

class DocWidget extends StatefulWidget {
  const DocWidget({super.key});

  @override
  State<DocWidget> createState() => _DocWidgetState();
}

class _DocWidgetState extends State<DocWidget> {
  late DocModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DocModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.network(
      'https://dimg.dreamflow.cloud/v1/lottie/shopping+bags+and+delivery+truck+animation',
      width: 100.0,
      height: 180.0,
      fit: BoxFit.contain,
      animate: true,
    );
  }
}
