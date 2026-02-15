import '/flutter_flow/flutter_flow_util.dart';
import 'test_mentale_widget.dart' show TestMentaleWidget;
import 'package:flutter/material.dart';

class TestMentaleModel extends FlutterFlowModel<TestMentaleWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
