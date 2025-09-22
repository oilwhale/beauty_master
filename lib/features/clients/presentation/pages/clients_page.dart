import 'dart:async';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../core/di/injection.dart';
import '../../../../core/database/database.dart';
import '../../../../core/theme/modern_decorations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import 'client_detail_page.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage>
    with TickerProviderStateMixin {
  final AppDatabase _database = getIt<AppDatabase>();
  List<Client> _clients = [];
  bool _isLoading = true;
  String _searchQuery = '';
  Timer? _searchTimer;

  // Анимации для breathing эффектов
  late AnimationController _breathingController;
  late AnimationController _searchController;
  late AnimationController _fabController;

  late Animation<double> _breathingAnimation;
  late Animation<double> _searchAnimation;
  late Animation<double> _fabAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _loadClients();
  }

  void _initAnimations() {
    // Breathing анимация для карточек
    _breathingController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _breathingAnimation = Tween<double>(
      begin: 0.95,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _breathingController,
      curve: Curves.easeInOut,
    ));
    _breathingController.repeat(reverse: true);

    // Анимация поиска
    _searchController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _searchAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _searchController,
      curve: Curves.easeOut,
    ));

    // FAB анимация
    _fabController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _fabAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _fabController,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _searchTimer?.cancel();
    _breathingController.dispose();
    _searchController.dispose();
    _fabController.dispose();
    super.dispose();
  }

  Future<void> _loadClients() async {
    setState(() => _isLoading = true);
    try {
      final allClients = await _database.getAllClients();

      List<Client> filteredClients;
      if (_searchQuery.isEmpty) {
        filteredClients = allClients;
      } else {
        final searchLower = _searchQuery.toLowerCase();
        filteredClients = allClients.where((client) {
          final nameLower = client.name.toLowerCase();
          final phoneLower = (client.phone ?? '').toLowerCase();
          return nameLower.contains(searchLower) ||
              phoneLower.contains(searchLower);
        }).toList();
      }

      setState(() {
        _clients = filteredClients;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        _showSnackBar('Ошибка загрузки: $e', isError: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundMain,
      body: SafeArea(
        child: Column(
          children: [
            _buildStunningHeader(),
            _buildNeomorphicSearchBar(),
            Expanded(
              child: _isLoading ? _buildLoadingState() : _buildClientsList(),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildLiquidFAB(),
    );
  }

  /// Потрясающий header с градиентом и статистикой
  Widget _buildStunningHeader() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: LiquidContainer(
        gradient: AppColors.liquidPrimary,
        borderRadius: 24,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Клиенты',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Управление базой клиентов',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            // Статистический badge
            AnimatedBuilder(
              animation: _breathingAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _breathingAnimation.value,
                  child: NeomorphicContainer(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    borderRadius: 20,
                    decoration: ModernDecorations.customNeomorphic(
                      color: AppColors.surfaceMain,
                      borderRadius: 20,
                      shadowIntensity: 0.8,
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${_clients.length}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primaryMain,
                          ),
                        ),
                        Text(
                          'клиентов',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Неоморфный search bar с внутренними тенями
  Widget _buildNeomorphicSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: NeomorphicContainer(
        isInset: true,
        borderRadius: 20,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Поиск клиентов...',
            hintStyle: TextStyle(
              color: AppColors.textTertiary,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: AnimatedBuilder(
              animation: _searchAnimation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _searchAnimation.value * 0.1,
                  child: Icon(
                    Icons.search_rounded,
                    color: AppColors.primaryMain,
                    size: 22,
                  ),
                );
              },
            ),
            suffixIcon: _searchQuery.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      setState(() => _searchQuery = '');
                      _loadClients();
                    },
                    icon: Icon(
                      Icons.clear_rounded,
                      color: AppColors.textTertiary,
                      size: 20,
                    ),
                  )
                : null,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
          onChanged: (value) {
            _searchController.forward();
            _searchTimer?.cancel();
            _searchTimer = Timer(const Duration(milliseconds: 500), () {
              setState(() => _searchQuery = value);
              _loadClients();
              _searchController.reverse();
            });
          },
        ),
      ),
    );
  }

  /// Состояние загрузки с breathing эффектом
  Widget _buildLoadingState() {
    return Center(
      child: AnimatedBuilder(
        animation: _breathingAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _breathingAnimation.value,
            child: NeomorphicContainer(
              padding: const EdgeInsets.all(32),
              borderRadius: 24,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: AppColors.liquidPrimary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(
                      Icons.people_outline_rounded,
                      color: AppColors.textPrimary,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Загрузка клиентов...',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Список клиентов с organic карточками
  Widget _buildClientsList() {
    if (_clients.isEmpty) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: _loadClients,
      backgroundColor: AppColors.surfaceMain,
      color: AppColors.primaryMain,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _clients.length,
        itemBuilder: (context, index) {
          final client = _clients[index];
          return _buildOrganicClientCard(client, index);
        },
      ),
    );
  }

  /// Organic карточка клиента с breathing эффектом
  Widget _buildOrganicClientCard(Client client, int index) {
    return AnimatedBuilder(
      animation: _breathingAnimation,
      builder: (context, child) {
        // Каждая карточка дышит с небольшой задержкой
        final delayedScale = 1.0 + ((_breathingAnimation.value - 1.0) * 0.3);

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Transform.scale(
            scale: delayedScale,
            child: Hero(
              tag: 'client_${client.id}',
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: () => _navigateToClientDetail(client),
                  child: Container(
                    decoration: ModernDecorations.organicClientCard,
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(24),
                        topRight: const Radius.circular(8),
                        bottomLeft: const Radius.circular(8),
                        bottomRight: const Radius.circular(24),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(24),
                          topRight: const Radius.circular(8),
                          bottomLeft: const Radius.circular(8),
                          bottomRight: const Radius.circular(24),
                        ),
                        onTap: () => _navigateToClientDetail(client),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              _buildOrganicAvatar(client),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildClientInfo(client),
                              ),
                              _buildStatusBadge(client.status),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Organic аватар с градиентом
  Widget _buildOrganicAvatar(Client client) {
    return Container(
      width: 56,
      height: 56,
      decoration: ModernDecorations.organicAvatar,
      child: Center(
        child: Text(
          _getInitials(client.name),
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  /// Информация о клиенте
  Widget _buildClientInfo(Client client) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          client.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        if (client.phone != null) ...[
          const SizedBox(height: 4),
          Text(
            client.phone!,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
          ),
        ],
        if (client.email != null) ...[
          const SizedBox(height: 2),
          Text(
            client.email!,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textTertiary,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }

  /// Status badge с пастельными цветами
  Widget _buildStatusBadge(String status) {
    final statusData = _getStatusData(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: statusData['color'],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: statusData['borderColor'],
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: statusData['shadowColor'],
            offset: const Offset(0, 2),
            blurRadius: 6,
            spreadRadius: -1,
          ),
        ],
      ),
      child: Text(
        statusData['name'],
        style: TextStyle(
          color: statusData['textColor'],
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  /// Empty state с призывом к действию
  Widget _buildEmptyState() {
    return Center(
      child: NeomorphicContainer(
        padding: const EdgeInsets.all(32),
        borderRadius: 24,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: AppColors.liquidSecondary,
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Icon(
                Icons.people_outline_rounded,
                color: AppColors.textPrimary,
                size: 40,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              _searchQuery.isEmpty ? 'Нет клиентов' : 'Клиенты не найдены',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _searchQuery.isEmpty
                  ? 'Добавьте первого клиента\nи начните работу'
                  : 'Попробуйте изменить\nпоисковой запрос',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
            if (_searchQuery.isEmpty) ...[
              const SizedBox(height: 24),
              _buildGradientButton(
                'Добавить клиента',
                Icons.add_rounded,
                () => _showAddClientDialog(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Liquid floating action button
  Widget _buildLiquidFAB() {
    return AnimatedBuilder(
      animation: _fabAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _fabAnimation.value,
          child: Container(
            width: 64,
            height: 64,
            decoration: ModernDecorations.floatingButton,
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(32),
              child: InkWell(
                borderRadius: BorderRadius.circular(32),
                onTap: () {
                  _fabController.forward().then((_) {
                    _fabController.reverse();
                  });
                  _showAddClientDialog();
                },
                child: const Icon(
                  Icons.add_rounded,
                  color: AppColors.textPrimary,
                  size: 28,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Градиентная кнопка
  Widget _buildGradientButton(String text, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: ModernDecorations.liquidButton,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.textPrimary, size: 20),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===== ДИАЛОГИ И МОДАЛЬНЫЕ ОКНА =====

  /// Диалог добавления клиента с liquid дизайном
  void _showAddClientDialog() {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();

    showDialog(
      context: context,
      barrierColor: AppColors.shadowMedium.withValues(alpha: 0.6),
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: NeomorphicContainer(
          padding: const EdgeInsets.all(24),
          borderRadius: 24,
          decoration: ModernDecorations.customNeomorphic(
            color: AppColors.surfaceMain,
            borderRadius: 24,
            shadowIntensity: 1.2,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: AppColors.liquidPrimary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.person_add_rounded,
                      color: AppColors.textPrimary,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      'Новый клиент',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Поля ввода
              _buildNeomorphicTextField(
                controller: nameController,
                label: 'Имя клиента',
                icon: Icons.person_outline_rounded,
                isRequired: true,
              ),
              const SizedBox(height: 16),
              _buildNeomorphicTextField(
                controller: phoneController,
                label: 'Телефон',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              _buildNeomorphicTextField(
                controller: emailController,
                label: 'Email (опционально)',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 32),

              // Кнопки
              Row(
                children: [
                  Expanded(
                    child: _buildOutlineButton(
                      'Отмена',
                      () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildGradientButton(
                      'Создать',
                      Icons.check_rounded,
                      () => _createClient(
                        nameController.text,
                        phoneController.text,
                        emailController.text,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Неоморфное текстовое поле
  Widget _buildNeomorphicTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isRequired = false,
    TextInputType? keyboardType,
  }) {
    return NeomorphicContainer(
      isInset: true,
      borderRadius: 16,
      padding: const EdgeInsets.all(4),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: isRequired ? '$label *' : label,
          labelStyle: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: Icon(
            icon,
            color: AppColors.primaryMain,
            size: 20,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  /// Outline кнопка
  Widget _buildOutlineButton(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryMain.withValues(alpha: 0.6),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.primaryMain,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  // ===== ЛОГИКА И УТИЛИТЫ =====

  /// Переход на детальную страницу клиента
  Future<void> _navigateToClientDetail(Client client) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ClientDetailPage(clientId: client.id),
      ),
    );

    // Обновляем список после возвращения с детальной страницы
    if (result == true || result == null) {
      _loadClients();
    }
  }

  /// Создание клиента
  Future<void> _createClient(String name, String phone, String email) async {
    if (name.trim().isEmpty) {
      _showSnackBar('Введите имя клиента', isError: true);
      return;
    }

    try {
      await _database.createClient(
        ClientsCompanion.insert(
          name: name.trim(),
          phone: phone.trim().isEmpty
              ? const drift.Value.absent()
              : drift.Value(phone.trim()),
          email: email.trim().isEmpty
              ? const drift.Value.absent()
              : drift.Value(email.trim()),
        ),
      );

      if (mounted) {
        Navigator.pop(context);
        _loadClients();
        _showSnackBar('Клиент успешно добавлен!', isError: false);
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar('Ошибка: $e', isError: true);
      }
    }
  }

  /// Показать snackbar с liquid дизайном
  void _showSnackBar(String message, {required bool isError}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color:
                    isError ? AppColors.errorAccent : AppColors.successAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                isError
                    ? Icons.error_outline_rounded
                    : Icons.check_circle_outline_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: isError ? AppColors.error : AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  // ===== УТИЛИТАРНЫЕ МЕТОДЫ =====

  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.isEmpty) return '';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  Map<String, dynamic> _getStatusData(String status) {
    switch (status) {
      case 'new':
        return {
          'name': 'Новый',
          'color': AppColors.success,
          'borderColor': AppColors.successAccent.withValues(alpha: 0.3),
          'shadowColor': AppColors.successAccent.withValues(alpha: 0.2),
          'textColor': AppColors.successAccent,
        };
      case 'vip':
        return {
          'name': 'VIP',
          'color': AppColors.accentMain,
          'borderColor': AppColors.accentWarm.withValues(alpha: 0.3),
          'shadowColor': AppColors.accentWarm.withValues(alpha: 0.2),
          'textColor': AppColors.accentWarm,
        };
      default:
        return {
          'name': 'Постоянный',
          'color': AppColors.info,
          'borderColor': AppColors.infoAccent.withValues(alpha: 0.3),
          'shadowColor': AppColors.infoAccent.withValues(alpha: 0.2),
          'textColor': AppColors.infoAccent,
        };
    }
  }
}
