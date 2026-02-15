import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'admin_dashboard_model.dart';
export 'admin_dashboard_model.dart';

/// Mock user row for the table
class _MockUser {
  final String id;
  final String name;
  final String email;
  final String role; // 'user' | 'coach' | 'admin'
  final String status; // 'active' | 'inactive'
  final DateTime joined;

  _MockUser({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.status,
    required this.joined,
  });

  String get initials {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts[0].isNotEmpty ? parts[0][0].toUpperCase() : '?';
    return (parts.first[0] + parts.last[0]).toUpperCase();
  }
}

class AdminDashboardWidget extends StatefulWidget {
  const AdminDashboardWidget({super.key});

  static String routeName = 'AdminDashboard';
  static String routePath = '/admin-dashboard';

  @override
  State<AdminDashboardWidget> createState() => _AdminDashboardWidgetState();
}

class _AdminDashboardWidgetState extends State<AdminDashboardWidget> {
  late AdminDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  static const Color _bg = Color(0xFFF8FAFC);
  static const Color _teal = Color(0xFF14B8A6);
  static const Color _violet = Color(0xFF7C3AED);
  static const Color _cardBg = Colors.white;
  static const Color _blue = Color(0xFF3B82F6);
  static const Color _green = Color(0xFF22C55E);
  static const Color _cyan = Color(0xFF06B6D4);
  static const Color _red = Color(0xFFEF4444);
  static const Color _yellow = Color(0xFFEAB308);

  static final List<_MockUser> _mockUsers = [
    _MockUser(
      id: '1',
      name: 'Rania Riahi',
      email: 'rania@example.com',
      role: 'admin',
      status: 'active',
      joined: DateTime(2026, 2, 10),
    ),
    _MockUser(
      id: '2',
      name: 'Ahmed Coach',
      email: 'ahmed.coach@example.com',
      role: 'coach',
      status: 'active',
      joined: DateTime(2026, 2, 12),
    ),
    _MockUser(
      id: '3',
      name: 'Sara User',
      email: 'sara@example.com',
      role: 'user',
      status: 'inactive',
      joined: DateTime(2026, 2, 15),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminDashboardModel());
    _model.searchTextController ??= TextEditingController();
    _model.searchFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  String _formatDate(DateTime d) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[d.month - 1]} ${d.day}, ${d.year}';
  }

  Color _roleColor(String role) {
    switch (role) {
      case 'user': return _green;
      case 'coach': return _cyan;
      case 'admin': return _red;
      default: return Colors.grey;
    }
  }

  Color _avatarColor(String name) {
    final h = name.hashCode.abs() % 360;
    return HSLColor.fromAHSL(1, h.toDouble(), 0.5, 0.5).toColor();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: _bg,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildHeader(context),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildStatsRow(context),
                      const SizedBox(height: 24),
                      _buildSearchFilterCard(context),
                      const SizedBox(height: 24),
                      _buildUserListCard(context),
                      const SizedBox(height: 16),
                      _buildPagination(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: _cardBg,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => scaffoldKey.currentState?.openDrawer(),
            icon: const Icon(Icons.menu, color: Color(0xFF475569), size: 24),
          ),
          Text(
            'Admin Dashboard',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
              font: GoogleFonts.interTight(
                fontWeight: FontWeight.w600,
                fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
              ),
              color: const Color(0xFF1E293B),
              letterSpacing: 0,
            ),
          ),
          _buildProfileDropdown(context),
        ],
      ),
    );
  }

  Widget _buildProfileDropdown(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      offset: const Offset(0, 48),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: _teal,
              child: Text(
                'HH',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'hiba hiba',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: const Color(0xFF334155),
                letterSpacing: 0,
              ),
            ),
            const SizedBox(width: 4),
            Icon(Icons.arrow_drop_down, color: Color(0xFF64748B), size: 24),
          ],
        ),
      ),
      itemBuilder: (context) => [
        const PopupMenuItem(value: 'profile', child: Text('Profile')),
        const PopupMenuItem(value: 'settings', child: Text('Settings')),
        const PopupMenuItem(value: 'logout', child: Text('Logout')),
      ],
      onSelected: (value) {
        if (value == 'logout') {
          // Mock: could navigate to signin
        }
      },
    );
  }

  Widget _buildStatsRow(BuildContext context) {
    final isNarrow = MediaQuery.sizeOf(context).width < 600;
    const gap = SizedBox(width: 12);
    final cards = [
      _statCard(context, icon: Icons.groups, iconColor: _blue, label: 'Total Users', value: '9 Users'),
      _statCard(context, icon: Icons.person, iconColor: _green, label: 'Regular Users', value: '5 Users'),
      _statCard(context, icon: Icons.person_outline, iconColor: _cyan, label: 'Coaches', value: '2'),
      _statCard(context, icon: Icons.shield, iconColor: _red, label: 'Admins', value: '2'),
    ];
    if (isNarrow) {
      return Column(
        children: [
          Row(children: [Expanded(child: cards[0]), gap, Expanded(child: cards[1])]),
          const SizedBox(height: 16),
          Row(children: [Expanded(child: cards[2]), gap, Expanded(child: cards[3])]),
        ],
      );
    }
    return Row(
      children: [
        Expanded(child: cards[0]),
        gap,
        Expanded(child: cards[1]),
        gap,
        Expanded(child: cards[2]),
        gap,
        Expanded(child: cards[3]),
      ],
    );
  }

  Widget _statCard(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: _cardBg,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    value,
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                      font: GoogleFonts.interTight(
                        fontWeight: FontWeight.bold,
                        fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      ),
                      color: const Color(0xFF1E293B),
                      letterSpacing: 0,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    label,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                      font: GoogleFonts.inter(
                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                      ),
                      color: const Color(0xFF64748B),
                      letterSpacing: 0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchFilterCard(BuildContext context) {
    final isNarrow = MediaQuery.sizeOf(context).width < 600;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.filter_list, color: _teal, size: 22),
              const SizedBox(width: 8),
              Text(
                'Search & Filter',
                style: FlutterFlowTheme.of(context).titleMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.w600,
                    fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                  ),
                  color: const Color(0xFF1E293B),
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (isNarrow) ...[
            TextFormField(
              controller: _model.searchTextController,
              focusNode: _model.searchFocusNode,
              decoration: InputDecoration(
                hintText: 'Search by name or email...',
                hintStyle: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                filled: true,
                fillColor: _bg,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFE2E8F0)),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: FFButtonWidget(
                onPressed: () {},
                text: 'Search',
                options: FFButtonOptions(
                  height: 44,
                  color: _violet,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ] else
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: _model.searchTextController,
                    focusNode: _model.searchFocusNode,
                    decoration: InputDecoration(
                      hintText: 'Search by name or email...',
                      hintStyle: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                      filled: true,
                      fillColor: _bg,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xFFE2E8F0)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                FFButtonWidget(
                  onPressed: () {},
                  text: 'Search',
                  options: FFButtonOptions(
                    height: 48,
                    color: _violet,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              SizedBox(
                width: isNarrow ? double.infinity : 180,
                child: DropdownButtonFormField<String>(
                  value: _model.filterRole,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: _bg,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'all', child: Text('All Roles')),
                    DropdownMenuItem(value: 'user', child: Text('User')),
                    DropdownMenuItem(value: 'coach', child: Text('Coach')),
                    DropdownMenuItem(value: 'admin', child: Text('Admin')),
                  ],
                  onChanged: (v) => setState(() => _model.filterRole = v ?? 'all'),
                ),
              ),
              SizedBox(
                width: isNarrow ? double.infinity : 140,
                child: DropdownButtonFormField<String>(
                  value: _model.filterStatus,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: _bg,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'all', child: Text('All Status')),
                    DropdownMenuItem(value: 'active', child: Text('Active')),
                    DropdownMenuItem(value: 'inactive', child: Text('Inactive')),
                  ],
                  onChanged: (v) => setState(() => _model.filterStatus = v ?? 'all'),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  setState(() {
                    _model.filterRole = 'all';
                    _model.filterStatus = 'all';
                    _model.searchTextController?.clear();
                  });
                },
                icon: const Icon(Icons.refresh, size: 18, color: Color(0xFF64748B)),
                label: const Text('Reset'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF64748B),
                  side: const BorderSide(color: Color(0xFFE2E8F0)),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              FFButtonWidget(
                onPressed: () {},
                text: 'Add User',
                icon: const Icon(Icons.add, size: 20, color: Colors.white),
                options: FFButtonOptions(
                  height: 44,
                  color: _green,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserListCard(BuildContext context) {
    final isNarrow = MediaQuery.sizeOf(context).width < 800;
    return Container(
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'User List',
              style: FlutterFlowTheme.of(context).titleMedium.override(
                font: GoogleFonts.interTight(
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                ),
                color: const Color(0xFF1E293B),
                letterSpacing: 0,
              ),
            ),
          ),
          if (isNarrow)
            ..._mockUsers.map((u) => _buildUserListTile(u))
          else
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: WidgetStateProperty.all(const Color(0xFFF8FAFC)),
                columns: const [
                  DataColumn(label: Text('Avatar')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('Role')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Joined')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: _mockUsers.map((u) => DataRow(
                  cells: [
                    DataCell(CircleAvatar(
                      radius: 18,
                      backgroundColor: _avatarColor(u.name),
                      child: Text(
                        u.initials,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    )),
                    DataCell(Text(u.name)),
                    DataCell(Text(u.email)),
                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: _roleColor(u.role).withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          u.role.toUpperCase(),
                          style: TextStyle(
                            color: _roleColor(u.role),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: (u.status == 'active' ? _green : _yellow).withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          u.status == 'active' ? 'Active' : 'Inactive',
                          style: TextStyle(
                            color: u.status == 'active' ? _green : _yellow,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    DataCell(Text(_formatDate(u.joined))),
                    DataCell(Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.visibility_outlined, size: 20, color: Color(0xFF64748B)),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit_outlined, size: 20, color: Color(0xFF64748B)),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_outline, size: 20, color: Color(0xFFEF4444)),
                          onPressed: () {},
                        ),
                      ],
                    )),
                  ],
                )),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildUserListTile(_MockUser u) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _bg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: _avatarColor(u.name),
                  child: Text(
                    u.initials,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        u.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E293B),
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        u.email,
                        style: const TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.visibility_outlined, size: 20, color: Color(0xFF64748B)),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit_outlined, size: 20, color: Color(0xFF64748B)),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, size: 20, color: Color(0xFFEF4444)),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: _roleColor(u.role).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    u.role.toUpperCase(),
                    style: TextStyle(
                      color: _roleColor(u.role),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: (u.status == 'active' ? _green : _yellow).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    u.status == 'active' ? 'Active' : 'Inactive',
                    style: TextStyle(
                      color: u.status == 'active' ? _green : _yellow,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
                Text(
                  _formatDate(u.joined),
                  style: const TextStyle(color: Color(0xFF64748B), fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPagination(BuildContext context) {
    final totalPages = (_mockUsers.length / AdminDashboardModel.pageSize).ceil().clamp(1, 999);
    final page = _model.currentPage.clamp(0, totalPages - 1);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: page > 0
              ? () => setState(() => _model.currentPage = page - 1)
              : null,
          icon: const Icon(Icons.chevron_left),
          color: _teal,
        ),
        const SizedBox(width: 8),
        Text(
          'Page ${page + 1} of $totalPages',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
            font: GoogleFonts.inter(
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
            color: const Color(0xFF64748B),
            letterSpacing: 0,
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: page < totalPages - 1
              ? () => setState(() => _model.currentPage = page + 1)
              : null,
          icon: const Icon(Icons.chevron_right),
          color: _teal,
        ),
      ],
    );
  }
}
