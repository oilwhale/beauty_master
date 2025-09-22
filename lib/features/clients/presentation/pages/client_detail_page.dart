import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../core/di/injection.dart';
import '../../../../core/database/database.dart';
import '../../../../core/utils/extensions.dart';

class ClientDetailPage extends StatefulWidget {
  final int clientId;

  const ClientDetailPage({
    super.key,
    required this.clientId,
  });

  @override
  State<ClientDetailPage> createState() => _ClientDetailPageState();
}

class _ClientDetailPageState extends State<ClientDetailPage>
    with TickerProviderStateMixin {
  final AppDatabase _database = getIt<AppDatabase>();
  final ImagePicker _imagePicker = ImagePicker();

  // State
  Client? _client;
  bool _isLoading = true;
  List<Appointment> _appointments = [];
  Map<String, dynamic> _statistics = {};
  Timer? _autoSaveTimer;
  bool _showSaveButton = false;

  // Inline editing state
  bool _isEditingName = false;
  bool _isEditingPhone = false;
  bool _isEditingEmail = false;
  bool _isEditingNotes = false;

  // Text controllers for inline editing
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _notesController;

  // Tab Controller
  late TabController _tabController;

  // Animations
  late AnimationController _saveAnimationController;
  late Animation<double> _saveAnimation;

  // Colors (minimalist palette)
  static const Color _primaryColor = Color(0xFF8B5CF6);
  static const Color _textPrimary = Color(0xFF111827);
  static const Color _textSecondary = Color(0xFF374151);
  static const Color _textTertiary = Color(0xFF6B7280);
  static const Color _backgroundWhite = Color(0xFFFFFFFF);
  static const Color _dividerColor = Color(0xFFF3F4F6);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _initAnimations();
    _initTextControllers();
    _loadClientData();
  }

  void _initTextControllers() {
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _notesController = TextEditingController();
  }

  void _initAnimations() {
    _saveAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _saveAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _saveAnimationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _autoSaveTimer?.cancel();
    _tabController.dispose();
    _saveAnimationController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _loadClientData() async {
    try {
      // Load client
      final client = await _database.getClientById(widget.clientId);
      if (client == null) {
        if (mounted) Navigator.pop(context);
        return;
      }

      // Load appointments
      final appointments = await _database.getAppointmentsByRange(
        DateTime.now().subtract(const Duration(days: 365)),
        DateTime.now(),
      );

      final clientAppointments =
          appointments.where((a) => a.clientId == widget.clientId).toList();

      // Calculate statistics
      final stats = _calculateStatistics(clientAppointments);

      setState(() {
        _client = client;
        _appointments = clientAppointments;
        _statistics = stats;
        _isLoading = false;
      });

      // Update text controllers with client data
      _nameController.text = client.name;
      _phoneController.text = client.phone ?? '';
      _emailController.text = client.email ?? '';
      _notesController.text = client.notes ?? '';
    } catch (e) {
      setState(() => _isLoading = false);
      _showErrorSnackBar('Ошибка загрузки данных');
    }
  }

  Map<String, dynamic> _calculateStatistics(List<Appointment> appointments) {
    if (appointments.isEmpty) {
      return {
        'totalVisits': 0,
        'avgCheck': 0.0,
        'totalSpent': 0.0,
        'daysSinceLastVisit': 0,
      };
    }

    final completedAppointments =
        appointments.where((a) => a.status == 'completed').toList();

    final totalSpent = completedAppointments
        .map((a) => a.totalPrice ?? 0.0)
        .fold(0.0, (sum, price) => sum + price);

    final avgCheck = completedAppointments.isNotEmpty
        ? totalSpent / completedAppointments.length
        : 0.0;

    final lastVisit = completedAppointments.isNotEmpty
        ? completedAppointments
            .map((a) => a.date)
            .reduce((a, b) => a.isAfter(b) ? a : b)
        : DateTime.now();

    final daysSinceLastVisit = DateTime.now().difference(lastVisit).inDays;

    return {
      'totalVisits': completedAppointments.length,
      'avgCheck': avgCheck,
      'totalSpent': totalSpent,
      'daysSinceLastVisit': daysSinceLastVisit,
    };
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return _buildLoadingScreen();
    }

    return Scaffold(
      backgroundColor: _backgroundWhite,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeroSection(),
            _buildTabBar(),
            Expanded(child: _buildTabContent()),
            _buildQuickActions(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: _backgroundWhite,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          color: _textPrimary,
          size: 20,
        ),
      ),
      actions: [
        if (_showSaveButton)
          AnimatedBuilder(
            animation: _saveAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _saveAnimation.value,
                child: Transform.scale(
                  scale: 0.8 + (_saveAnimation.value * 0.2),
                  child: Container(
                    margin: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.green.withOpacity(0.2)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 14,
                          color: Colors.green[600],
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Сохранено',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.green[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }

  Widget _buildLoadingScreen() {
    return Scaffold(
      backgroundColor: _backgroundWhite,
      body: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(_primaryColor),
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Avatar and Name
          Row(
            children: [
              _buildAvatar(),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEditableName(),
                    const SizedBox(height: 8),
                    _buildStatusBadge(),
                    const SizedBox(height: 4),
                    Text(
                      _getLastVisitText(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: _textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildNextAppointmentCard(),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: 96,
        height: 96,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: _primaryColor.withOpacity(0.1),
          border: Border.all(color: _primaryColor.withOpacity(0.2), width: 2),
        ),
        child: _client?.photoPath != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.file(
                  File(_client!.photoPath!),
                  fit: BoxFit.cover,
                ),
              )
            : Center(
                child: Text(
                  _getInitials(_client?.name ?? ''),
                  style: const TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.w700,
                    color: _primaryColor,
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildEditableName() {
    if (_isEditingName) {
      return TextField(
        controller: _nameController,
        autofocus: true,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: _textPrimary,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
        onSubmitted: (value) => _saveName(value),
        onTapOutside: (_) => _saveName(_nameController.text),
      );
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          _isEditingName = true;
        });
      },
      child: Text(
        _client?.name ?? '',
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: _textPrimary,
        ),
      ),
    );
  }

  Widget _buildStatusBadge() {
    final status = _client?.status ?? 'regular';
    final statusData = _getStatusData(status);

    return GestureDetector(
      onTap: _showStatusDialog,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: statusData['color'].withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: statusData['color'].withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              statusData['name'],
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: statusData['color'],
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.keyboard_arrow_down,
              size: 14,
              color: statusData['color'],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextAppointmentCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _dividerColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.schedule_outlined,
            color: _textTertiary,
            size: 20,
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              'След. запись: Не запланирована',
              style: TextStyle(
                fontSize: 14,
                color: _textTertiary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {
              // TODO: Implement schedule appointment
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              'Записать',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: _primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: _dividerColor, width: 1),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: _primaryColor,
        unselectedLabelColor: _textTertiary,
        indicatorColor: _primaryColor,
        indicatorWeight: 2,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        tabs: const [
          Tab(text: 'Обзор'),
          Tab(text: 'Контакты'),
          Tab(text: 'История'),
          Tab(text: 'Еще'),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    return TabBarView(
      controller: _tabController,
      children: [
        _buildOverviewTab(),
        _buildContactsTab(),
        _buildHistoryTab(),
        _buildMoreTab(),
      ],
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildKeyMetrics(),
          const SizedBox(height: 24),
          _buildQuickNotes(),
        ],
      ),
    );
  }

  Widget _buildKeyMetrics() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ключевые показатели',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildMetricCard(
                '${_statistics['totalVisits']}',
                'визитов',
                Icons.calendar_today_outlined,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildMetricCard(
                '${_statistics['daysSinceLastVisit']} дней',
                'назад',
                Icons.access_time_outlined,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildMetricCard(
                '${(_statistics['totalSpent'] ?? 0.0).toInt()}₽',
                'всего потрачено',
                Icons.account_balance_wallet_outlined,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildMetricCard(
                '${(_statistics['avgCheck'] ?? 0.0).toInt()}₽',
                'средний чек',
                Icons.payment_outlined,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMetricCard(String value, String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _backgroundWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20,
            color: _textTertiary,
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: _textPrimary,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: _textTertiary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickNotes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Заметки',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        if (_isEditingNotes)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _backgroundWhite,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _primaryColor),
            ),
            child: TextField(
              controller: _notesController,
              autofocus: true,
              maxLines: 5,
              style: const TextStyle(
                fontSize: 14,
                color: _textSecondary,
                height: 1.5,
              ),
              decoration: const InputDecoration(
                hintText: 'Введите заметки о клиенте...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              onSubmitted: (value) => _saveNotes(value),
              onTapOutside: (_) => _saveNotes(_notesController.text),
            ),
          )
        else
          GestureDetector(
            onTap: () {
              setState(() {
                _isEditingNotes = true;
              });
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _backgroundWhite,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _dividerColor),
              ),
              child: Text(
                _client?.notes?.isNotEmpty == true
                    ? _client!.notes!
                    : 'Тап для добавления заметки...',
                style: TextStyle(
                  fontSize: 14,
                  color: _client?.notes?.isNotEmpty == true
                      ? _textSecondary
                      : _textTertiary,
                  height: 1.5,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildContactsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContactMethods(),
          const SizedBox(height: 24),
          _buildBirthdaySection(),
          const SizedBox(height: 24),
          _buildTagsSection(),
        ],
      ),
    );
  }

  Widget _buildContactMethods() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Способы связи',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        _buildEditableContactRow(
          Icons.phone_outlined,
          'Телефон',
          _client?.phone ?? 'Не указан',
          _isEditingPhone,
          _phoneController,
          () => _makeCall(_client?.phone ?? ''),
          () => _sendSMS(_client?.phone ?? ''),
          ['Позвонить', 'SMS'],
          _savePhone,
        ),
        const SizedBox(height: 12),
        _buildEditableContactRow(
          Icons.email_outlined,
          'Email',
          _client?.email ?? 'Не указан',
          _isEditingEmail,
          _emailController,
          () => _sendEmail(_client?.email ?? ''),
          null,
          ['Написать'],
          _saveEmail,
        ),
      ],
    );
  }

  Widget _buildEditableContactRow(
    IconData icon,
    String label,
    String value,
    bool isEditing,
    TextEditingController controller,
    VoidCallback? onPrimaryAction,
    VoidCallback? onSecondaryAction,
    List<String> actionLabels,
    Function(String) onSave,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _backgroundWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _dividerColor),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: _textTertiary),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: _textTertiary,
                  ),
                ),
                const SizedBox(height: 2),
                if (isEditing)
                  TextField(
                    controller: controller,
                    autofocus: true,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: _textPrimary,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    onSubmitted: onSave,
                    onTapOutside: (_) => onSave(controller.text),
                  )
                else
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (label == 'Телефон')
                          _isEditingPhone = true;
                        else if (label == 'Email') _isEditingEmail = true;
                      });
                    },
                    child: Text(
                      value,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: _textPrimary,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Row(
            children: [
              if (onPrimaryAction != null)
                _buildActionButton(actionLabels[0], onPrimaryAction),
              if (onSecondaryAction != null) ...[
                const SizedBox(width: 8),
                _buildActionButton(actionLabels[1], onSecondaryAction),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: _primaryColor,
        ),
      ),
    );
  }

  Widget _buildBirthdaySection() {
    final birthday = _client?.birthday;
    String birthdayText = 'Не указан';
    String daysText = '';

    if (birthday != null) {
      birthdayText = birthday.formattedDate;
      final daysUntil = _getDaysUntilBirthday(birthday);

      if (daysUntil == 0) {
        daysText = '🎉 Сегодня!';
      } else if (daysUntil == 1) {
        daysText = '🎂 Завтра!';
      } else if (daysUntil <= 30) {
        daysText = '🎂 Через $daysUntil дней';
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'День рождения',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: _pickBirthday,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _backgroundWhite,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _dividerColor),
            ),
            child: Row(
              children: [
                Icon(Icons.cake_outlined, size: 20, color: _textTertiary),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        birthdayText,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: _textPrimary,
                        ),
                      ),
                      if (daysText.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          daysText,
                          style: const TextStyle(
                            fontSize: 14,
                            color: _primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Icon(Icons.edit_outlined, size: 16, color: _textTertiary),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTagsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Теги',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildTag('Пунктуальный'),
            _buildTag('Дружелюбный'),
            _buildAddTagButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildTag(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _primaryColor.withOpacity(0.3)),
      ),
      child: Text(
        tag,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: _primaryColor,
        ),
      ),
    );
  }

  Widget _buildAddTagButton() {
    return GestureDetector(
      onTap: () {
        // TODO: Implement add tag
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: _dividerColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, size: 14, color: _textTertiary),
            const SizedBox(width: 4),
            Text(
              'Добавить',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: _textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTrendChart(),
          const SizedBox(height: 24),
          _buildRecentAppointments(),
        ],
      ),
    );
  }

  Widget _buildTrendChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Активность за 6 месяцев',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: _backgroundWhite,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: _dividerColor),
          ),
          child: Column(
            children: [
              const Text(
                'Визиты за период: ▁▃▅▇▅▃▁',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: _textSecondary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Стабильная активность каждые 2 недели',
                style: TextStyle(
                  fontSize: 14,
                  color: _textTertiary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecentAppointments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Последние визиты',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: _textPrimary,
              ),
            ),
            Text(
              '${_appointments.take(5).length} из ${_appointments.length}',
              style: const TextStyle(
                fontSize: 14,
                color: _textTertiary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (_appointments.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: _backgroundWhite,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _dividerColor),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.event_busy_outlined,
                  size: 48,
                  color: _textTertiary,
                ),
                const SizedBox(height: 16),
                Text(
                  'Пока нет записей',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: _textTertiary,
                  ),
                ),
              ],
            ),
          )
        else
          ..._appointments
              .take(5)
              .map((appointment) => _buildAppointmentCard(appointment))
              .toList(),
        if (_appointments.length > 5) ...[
          const SizedBox(height: 16),
          Center(
            child: TextButton(
              onPressed: () {
                // TODO: Show all appointments
              },
              child: Text(
                'Показать все записи (${_appointments.length})',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _primaryColor,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildAppointmentCard(Appointment appointment) {
    final statusIcon = _getAppointmentStatusIcon(appointment.status);
    final statusColor = _getAppointmentStatusColor(appointment.status);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _backgroundWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _dividerColor),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              statusIcon,
              size: 20,
              color: statusColor,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      appointment.date.formattedDate,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: _textPrimary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      appointment.startTime.formattedTime,
                      style: const TextStyle(
                        fontSize: 14,
                        color: _textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Услуга • ${appointment.totalPrice?.formattedPrice ?? "0 ₽"}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: _textTertiary,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            size: 20,
            color: _textTertiary,
          ),
        ],
      ),
    );
  }

  Widget _buildMoreTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPhotoGallerySection(),
          const SizedBox(height: 32),
          _buildDetailedNotesSection(),
          const SizedBox(height: 32),
          _buildAdvancedOptionsSection(),
        ],
      ),
    );
  }

  Widget _buildPhotoGallerySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Фотогалерея',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: _textPrimary,
              ),
            ),
            IconButton(
              onPressed: _addPhoto,
              icon: const Icon(
                Icons.add_photo_alternate_outlined,
                color: _primaryColor,
                size: 24,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: _dividerColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: _dividerColor, style: BorderStyle.solid),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.photo_library_outlined,
                size: 48,
                color: _textTertiary,
              ),
              const SizedBox(height: 8),
              Text(
                'Фотографии работ будут здесь',
                style: TextStyle(
                  fontSize: 14,
                  color: _textTertiary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailedNotesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Подробные заметки',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onDoubleTap: () => _showDetailedNotesDialog(),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 120),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _backgroundWhite,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _dividerColor),
            ),
            child: Text(
              _client?.notes?.isNotEmpty == true
                  ? _client!.notes!
                  : 'Двойной тап для добавления подробных заметок...\n\n• Предпочтения в услугах\n• Аллергии и противопоказания\n• Особенности характера\n• История болезни',
              style: TextStyle(
                fontSize: 14,
                color: _client?.notes?.isNotEmpty == true
                    ? _textSecondary
                    : _textTertiary,
                height: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAdvancedOptionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Дополнительные опции',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        _buildAdvancedOption(
          Icons.swap_horiz_outlined,
          'Изменить статус клиента',
          'Новый, Постоянный или VIP',
          () => _showStatusDialog(),
        ),
        const SizedBox(height: 12),
        _buildAdvancedOption(
          Icons.download_outlined,
          'Экспорт данных клиента',
          'Сохранить информацию в файл',
          () => _exportClientData(),
        ),
        const SizedBox(height: 12),
        _buildAdvancedOption(
          Icons.delete_outline,
          'Удалить клиента',
          'Безвозвратно удалить из базы',
          () => _showDeleteDialog(),
          isDestructive: true,
        ),
      ],
    );
  }

  Widget _buildAdvancedOption(
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap, {
    bool isDestructive = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color:
              isDestructive ? Colors.red.withOpacity(0.05) : _backgroundWhite,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDestructive ? Colors.red.withOpacity(0.2) : _dividerColor,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: isDestructive ? Colors.red : _textTertiary,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isDestructive ? Colors.red : _textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDestructive
                          ? Colors.red.withOpacity(0.7)
                          : _textTertiary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 20,
              color: isDestructive ? Colors.red : _textTertiary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Container(
      decoration: const BoxDecoration(
        color: _backgroundWhite,
        border: Border(
          top: BorderSide(color: _dividerColor, width: 1),
        ),
      ),
      child: SafeArea(
        child: Container(
          height: 64,
          child: Row(
            children: [
              Expanded(
                child: _buildQuickActionButton(
                  Icons.phone_outlined,
                  'Позвонить',
                  () => _makeCall(_client?.phone ?? ''),
                ),
              ),
              Container(width: 1, color: _dividerColor),
              Expanded(
                child: _buildQuickActionButton(
                  Icons.message_outlined,
                  'SMS',
                  () => _sendSMS(_client?.phone ?? ''),
                ),
              ),
              Container(width: 1, color: _dividerColor),
              Expanded(
                child: _buildQuickActionButton(
                  Icons.add_circle_outline,
                  'Новая запись',
                  () {
                    // TODO: Implement new appointment functionality
                    _showSuccessSnackBar(
                        'Функция создания записи будет реализована');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionButton(
    IconData icon,
    String label,
    VoidCallback onPressed,
  ) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 64,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: _primaryColor),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: _primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===== UTILITY METHODS =====

  String _getInitials(String name) {
    if (name.isEmpty) return '?';
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts[0].isNotEmpty ? parts[0][0].toUpperCase() : '?';
  }

  String _getLastVisitText() {
    final days = _statistics['daysSinceLastVisit'] ?? 0;
    if (days == 0) return 'Был сегодня';
    if (days == 1) return 'Был вчера';
    return 'Последний визит: $days дней назад';
  }

  int _getDaysUntilBirthday(DateTime birthday) {
    final now = DateTime.now();
    final thisYear = DateTime(now.year, birthday.month, birthday.day);
    final nextYear = DateTime(now.year + 1, birthday.month, birthday.day);

    if (thisYear.isAfter(now)) {
      return thisYear.difference(now).inDays;
    } else {
      return nextYear.difference(now).inDays;
    }
  }

  Map<String, dynamic> _getStatusData(String status) {
    switch (status.toLowerCase()) {
      case 'new':
        return {
          'name': 'Новый',
          'color': Colors.green,
        };
      case 'vip':
        return {
          'name': 'VIP',
          'color': Colors.orange,
        };
      default:
        return {
          'name': 'Постоянный',
          'color': Colors.blue,
        };
    }
  }

  IconData _getAppointmentStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Icons.check_circle_outlined;
      case 'cancelled':
        return Icons.cancel_outlined;
      case 'scheduled':
        return Icons.schedule_outlined;
      default:
        return Icons.help_outline;
    }
  }

  Color _getAppointmentStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      case 'scheduled':
        return Colors.orange;
      default:
        return _textTertiary;
    }
  }

  // ===== ACTION METHODS =====

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 85,
      );

      if (image != null && _client != null) {
        final updatedClient = _client!.copyWith(
          photoPath: drift.Value(image.path),
          updatedAt: DateTime.now(),
        );

        await _database.updateClient(updatedClient);
        setState(() => _client = updatedClient);

        _showSaveAnimation();
        HapticFeedback.lightImpact();
      }
    } catch (e) {
      _showErrorSnackBar('Ошибка загрузки фото');
    }
  }

  Future<void> _pickBirthday() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _client?.birthday ?? DateTime(1990),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: _primaryColor,
              onPrimary: Colors.white,
              surface: _backgroundWhite,
              onSurface: _textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && _client != null) {
      final updatedClient = _client!.copyWith(
        birthday: drift.Value(picked),
        updatedAt: DateTime.now(),
      );

      await _database.updateClient(updatedClient);
      setState(() => _client = updatedClient);

      _showSaveAnimation();
      HapticFeedback.lightImpact();
    }
  }

  void _showStatusDialog() {
    final statusOptions = ['new', 'regular', 'vip'];
    final statusNames = ['Новый', 'Постоянный', 'VIP'];
    final currentIndex = statusOptions.indexOf(_client?.status ?? 'regular');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: _backgroundWhite,
        title: const Text(
          'Статус клиента',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: _textPrimary,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: statusOptions.asMap().entries.map((entry) {
            final index = entry.key;
            final name = statusNames[index];

            return RadioListTile<int>(
              value: index,
              groupValue: currentIndex,
              title: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  color: _textPrimary,
                ),
              ),
              activeColor: _primaryColor,
              onChanged: (value) async {
                if (value != null && _client != null) {
                  final updatedClient = _client!.copyWith(
                    status: statusOptions[value],
                    updatedAt: DateTime.now(),
                  );

                  await _database.updateClient(updatedClient);
                  setState(() => _client = updatedClient);

                  _showSaveAnimation();
                  HapticFeedback.lightImpact();
                }
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showNotesDialog() {
    final controller = TextEditingController(text: _client?.notes ?? '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: _backgroundWhite,
        title: const Text(
          'Заметки',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: _textPrimary,
          ),
        ),
        content: TextField(
          controller: controller,
          autofocus: true,
          maxLines: 5,
          style: const TextStyle(
            fontSize: 16,
            color: _textPrimary,
          ),
          decoration: InputDecoration(
            hintText: 'Введите заметки о клиенте...',
            hintStyle: TextStyle(color: _textTertiary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: _dividerColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: _primaryColor),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Отмена',
              style: TextStyle(color: _textTertiary),
            ),
          ),
          TextButton(
            onPressed: () async {
              if (_client != null) {
                final updatedClient = _client!.copyWith(
                  notes: drift.Value(controller.text.trim()),
                  updatedAt: DateTime.now(),
                );

                await _database.updateClient(updatedClient);
                setState(() => _client = updatedClient);

                _showSaveAnimation();
                HapticFeedback.lightImpact();
              }
              Navigator.pop(context);
            },
            child: const Text(
              'Сохранить',
              style: TextStyle(
                color: _primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDetailedNotesDialog() => _showNotesDialog();

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: _backgroundWhite,
        title: const Text(
          'Удалить клиента?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
        ),
        content: const Text(
          'Это действие нельзя отменить. Все данные клиента будут удалены безвозвратно.',
          style: TextStyle(
            fontSize: 16,
            color: _textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Отмена',
              style: TextStyle(color: _textTertiary),
            ),
          ),
          TextButton(
            onPressed: () async {
              if (_client != null) {
                await _database.deleteClient(_client!.id);
                Navigator.pop(context); // Close dialog
                Navigator.pop(context); // Go back to clients list
              }
            },
            child: const Text(
              'Удалить',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _makeCall(String phone) async {
    if (phone.isEmpty) return;
    final Uri phoneUri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  Future<void> _sendSMS(String phone) async {
    if (phone.isEmpty) return;
    final Uri smsUri = Uri(scheme: 'sms', path: phone);
    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    }
  }

  Future<void> _sendEmail(String email) async {
    if (email.isEmpty) return;
    final Uri emailUri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  Future<void> _addPhoto() async {
    // TODO: Implement photo adding functionality
    _showSuccessSnackBar('Функция добавления фото будет реализована');
  }

  void _exportClientData() {
    // TODO: Implement export functionality
    _showSuccessSnackBar('Экспорт данных будет реализован');
  }

  void _showSaveAnimation() {
    setState(() {
      _showSaveButton = true;
    });

    _saveAnimationController.forward().then((_) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          _saveAnimationController.reverse().then((_) {
            if (mounted) {
              setState(() {
                _showSaveButton = false;
              });
            }
          });
        }
      });
    });
  }

  Future<void> _saveName(String value) async {
    if (value.trim().isNotEmpty && _client != null) {
      final updatedClient = _client!.copyWith(
        name: value.trim(),
        updatedAt: DateTime.now(),
      );

      await _database.updateClient(updatedClient);
      setState(() {
        _client = updatedClient;
        _isEditingName = false;
      });

      _showSaveAnimation();
      HapticFeedback.lightImpact();
    } else {
      setState(() {
        _isEditingName = false;
      });
    }
  }

  Future<void> _savePhone(String value) async {
    if (_client != null) {
      final updatedClient = _client!.copyWith(
        phone: value.trim().isEmpty
            ? const drift.Value.absent()
            : drift.Value(value.trim()),
        updatedAt: DateTime.now(),
      );

      await _database.updateClient(updatedClient);
      setState(() {
        _client = updatedClient;
        _isEditingPhone = false;
      });

      _showSaveAnimation();
      HapticFeedback.lightImpact();
    } else {
      setState(() {
        _isEditingPhone = false;
      });
    }
  }

  Future<void> _saveEmail(String value) async {
    if (_client != null) {
      final updatedClient = _client!.copyWith(
        email: value.trim().isEmpty
            ? const drift.Value.absent()
            : drift.Value(value.trim()),
        updatedAt: DateTime.now(),
      );

      await _database.updateClient(updatedClient);
      setState(() {
        _client = updatedClient;
        _isEditingEmail = false;
      });

      _showSaveAnimation();
      HapticFeedback.lightImpact();
    } else {
      setState(() {
        _isEditingEmail = false;
      });
    }
  }

  Future<void> _saveNotes(String value) async {
    if (_client != null) {
      final updatedClient = _client!.copyWith(
        notes: value.trim().isEmpty
            ? const drift.Value.absent()
            : drift.Value(value.trim()),
        updatedAt: DateTime.now(),
      );

      await _database.updateClient(updatedClient);
      setState(() {
        _client = updatedClient;
        _isEditingNotes = false;
      });

      _showSaveAnimation();
      HapticFeedback.lightImpact();
    } else {
      setState(() {
        _isEditingNotes = false;
      });
    }
  }

  void _showErrorSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  void _showSuccessSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
