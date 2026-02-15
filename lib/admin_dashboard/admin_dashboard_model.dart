import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'admin_dashboard_widget.dart' show AdminDashboardWidget;
import 'package:flutter/material.dart';

class AdminDashboardModel extends FlutterFlowModel<AdminDashboardWidget> {
  /// State fields for stateful widgets in this page.

  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;

  /// Filter by Role: 'all' | 'user' | 'coach' | 'admin'
  String filterRole = 'all';

  /// Filter by Status: 'all' | 'active' | 'inactive'
  String filterStatus = 'all';

  /// Pagination: current page (0-based)
  int currentPage = 0;
  static const int pageSize = 5;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFocusNode?.dispose();
    searchTextController?.dispose();
  }
}
