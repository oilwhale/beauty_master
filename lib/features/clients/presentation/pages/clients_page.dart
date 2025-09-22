import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../core/di/injection.dart';
import '../../../../core/database/database.dart';
import '../../../../core/theme/modern_decorations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import 'client_detail_page.dart';

/// Enterprise Clients Page - Conscious Minimalism Design
/// Progressive Disclosure + Strategic Glassmorphism + Emotional Intelligence
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

  // Enterprise Animation Controllers
  late AnimationController _heroAnimationController;
  late AnimationController _listAnimationController;
  late AnimationController _fabAnimationController;
  late AnimationController _searchAnimationController;

  // Conscious Animation System
  late Animation<double> _heroScaleAnimation;
  late Animation<Offset> _heroSlideAnimation;
  late Animation<double> _listFadeAnimation;
  late Animation<double> _fabRotationAnimation;
  late Animation<double> _searchFocusAnimation;

  @override
  void initState() {
    super.initState();
    _initializeEnterpriseAnimations();
    _loadClientsWithIntelligence();
  }

  void _initializeEnterpriseAnimations() {
    // Hero Section Animations - Emotional Entry
    _heroAnimationController = AnimationController(
      duration: AppConstants.animationSlow,
      vsync: this,
    );

    _heroScaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _heroAnimationController,
      curve: Curves.easeOutBack,
    ));

    _heroSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _heroAnimationController,
      curve: Curves.easeOutCubic,
    ));

    // List Animations - Progressive Disclosure
    _listAnimationController = AnimationController(
      duration: AppConstants.animationMedium,
      vsync: this,
    );

    _listFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _listAnimationController,
      curve: Curves.easeOut,
    ));

    // FAB Animations - Intelligent Interaction
    _fabAnimationController = AnimationController(
      duration: AppConstants.animationFast,
      vsync: this,
    );

    _fabRotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.125, // 45 degrees
    ).animate(CurvedAnimation(
      parent: _fabAnimationController,
      curve: Curves.elasticOut,
    ));

    // Search Animations - Focused Attention
    _searchAnimationController = AnimationController(
      duration: AppConstants.animationStandard,
      vsync: this,
    );

    _searchFocusAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
    ).animate(CurvedAnimation(
      parent: _searchAnimationController,
      curve: Curves.easeInOut,
    ));

    // Start entrance animations
    _heroAnimationController.forward();
  }

  @override
  void dispose() {
    _searchTimer?.cancel();
    _heroAnimationController.dispose();
    _listAnimationController.dispose();
    _fabAnimationController.dispose();
    _searchAnimationController.dispose();
    super.dispose();
  }

  Future<void> _loadClientsWithIntelligence() async {
    setState(() => _isLoading = true);

    try {
      await Future.delayed(AppConstants.animationFast); // Smooth loading
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

      // Progressive Disclosure Animation
      _listAnimationController.forward();
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        _showEnterpriseSnackBar('Ошибка загрузки: $e', isError: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface0,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildEnterpriseAppBar(),
          SliverToBoxAdapter(child: _buildHeroSection()),
          SliverToBoxAdapter(child: _buildIntelligentSearch()),
          _buildClientsContent(),
        ],
      ),
      floatingActionButton: _buildQuantumFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  // =====================================================================
  // ENTERPRISE APP BAR - Glass Navigation Header
  // =====================================================================

  Widget _buildEnterpriseAppBar() {
    return SliverAppBar(
      expandedHeight: 0,
      floating: true,
      pinned: false,
      snap: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: AppConstants.glassBlurNavigation,
            sigmaY: AppConstants.glassBlurNavigation,
          ),
          child: Container(
            decoration: ModernDecorations.navigationGlass,
          ),
        ),
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  // =====================================================================
  // HERO SECTION - Emotional Intelligence Design
  // =====================================================================

  Widget _buildHeroSection() {
    return AnimatedBuilder(
      animation: _heroAnimationController,
      builder: (context, child) {
        return SlideTransition(
          position: _heroSlideAnimation,
          child: ScaleTransition(
            scale: _heroScaleAnimation,
            child: Container(
              margin: EdgeInsets.all(AppConstants.spaceLarge),
              child: ModernDecorations.createGlassContainer(
                borderRadius: AppConstants.radiusXLarge,
                blurRadius: AppConstants.glassBlurCard,
                padding: EdgeInsets.all(AppConstants.spaceLarge),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Main Title with Progressive Disclosure
                          Text(
                            'Клиенты',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  color: AppColors.textPrimary,
                                  fontWeight: AppConstants.fontWeightBold,
                                  letterSpacing: -0.5,
                                ),
                          ),
                          SizedBox(height: AppConstants.spaceMicro),

                          // Subtitle with Intelligence
                          Text(
                            'Управление отношениями',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  color: AppColors.textSecondary,
                                  fontWeight: AppConstants.fontWeightRegular,
                                ),
                          ),
                        ],
                      ),
                    ),

                    // Quantum Statistics Badge
                    _buildQuantumStatsBadge(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildQuantumStatsBadge() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.spaceMedium,
        vertical: AppConstants.spaceSmall,
      ),
      decoration: ModernDecorations.createBrandDecoration(
        borderRadius: AppConstants.radiusLarge,
        elevation: AppConstants.elevation2,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${_clients.length}',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.textInverse,
                  fontWeight: AppConstants.fontWeightBold,
                ),
          ),
          Text(
            'клиентов',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.textInverse.withValues(alpha: 0.9),
                  fontWeight: AppConstants.fontWeightMedium,
                ),
          ),
        ],
      ),
    );
  }

  // =====================================================================
  // INTELLIGENT SEARCH - Focus-Aware Interface
  // =====================================================================

  Widget _buildIntelligentSearch() {
    return AnimatedBuilder(
      animation: _searchFocusAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _searchFocusAnimation.value,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: AppConstants.spaceLarge,
              vertical: AppConstants.spaceSmall,
            ),
            child: ModernDecorations.createGlassContainer(
              borderRadius: AppConstants.radiusLarge,
              blurRadius: AppConstants.glassBlurCard,
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.spaceMicro,
                vertical: AppConstants.spaceMicro,
              ),
              child: TextField(
                onChanged: _handleSearchWithIntelligence,
                onTap: () => _searchAnimationController.forward(),
                onSubmitted: (_) => _searchAnimationController.reverse(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textPrimary,
                    ),
                decoration: InputDecoration(
                  hintText: 'Поиск клиентов...',
                  hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textQuaternary,
                      ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: AppColors.quantumCore,
                    size: AppConstants.iconMedium,
                  ),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          onPressed: _clearSearchWithAnimation,
                          icon: Icon(
                            Icons.clear_rounded,
                            color: AppColors.textTertiary,
                            size: AppConstants.iconSmall,
                          ),
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: AppConstants.spaceMedium,
                    vertical: AppConstants.spaceMedium,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleSearchWithIntelligence(String value) {
    _searchTimer?.cancel();
    _searchTimer = Timer(AppConstants.searchDebounceDelay, () {
      setState(() => _searchQuery = value);
      _loadClientsWithIntelligence();
    });
  }

  void _clearSearchWithAnimation() {
    setState(() => _searchQuery = '');
    _loadClientsWithIntelligence();
    _searchAnimationController.reverse();
  }

  // =====================================================================
  // CLIENTS CONTENT - Progressive Disclosure
  // =====================================================================

  Widget _buildClientsContent() {
    if (_isLoading) {
      return SliverToBoxAdapter(child: _buildConsciousLoadingState());
    }

    if (_clients.isEmpty) {
      return SliverToBoxAdapter(child: _buildEmptyState());
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return AnimatedBuilder(
            animation: _listFadeAnimation,
            builder: (context, child) {
              // Staggered animation for each item
              final itemDelay = index * 0.1;
              final progress =
                  (_listFadeAnimation.value - itemDelay).clamp(0.0, 1.0);

              return Opacity(
                opacity: progress,
                child: Transform.translate(
                  offset: Offset(0, (1 - progress) * 20),
                  child: _buildOrganicClientCard(_clients[index], index),
                ),
              );
            },
          );
        },
        childCount: _clients.length,
      ),
    );
  }

  Widget _buildConsciousLoadingState() {
    return Container(
      height: 300,
      margin: EdgeInsets.all(AppConstants.spaceLarge),
      child: ModernDecorations.createGlassContainer(
        borderRadius: AppConstants.radiusXLarge,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Quantum Loading Indicator
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.quantumCore),
                strokeWidth: 3.0,
              ),
            ),
            SizedBox(height: AppConstants.spaceLarge),

            Text(
              'Загрузка клиентов...',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      margin: EdgeInsets.all(AppConstants.spaceLarge),
      child: ModernDecorations.createGlassContainer(
        borderRadius: AppConstants.radiusXLarge,
        padding: EdgeInsets.all(AppConstants.spaceXLarge),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Organic Icon Container
            Container(
              width: 80,
              height: 80,
              decoration: ModernDecorations.organicAvatar,
              child: Icon(
                Icons.people_outline_rounded,
                color: AppColors.quantumCore,
                size: AppConstants.iconXLarge,
              ),
            ),
            SizedBox(height: AppConstants.spaceLarge),

            Text(
              _searchQuery.isEmpty ? 'Пока нет клиентов' : 'Клиенты не найдены',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: AppConstants.fontWeightSemiBold,
                  ),
            ),
            SizedBox(height: AppConstants.spaceSmall),

            Text(
              _searchQuery.isEmpty
                  ? 'Добавьте первого клиента\nи начните строить отношения'
                  : 'Попробуйте изменить\nпоисковой запрос',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
            ),

            if (_searchQuery.isEmpty) ...[
              SizedBox(height: AppConstants.spaceLarge),
              _buildQuantumButton(
                'Добавить клиента',
                Icons.add_rounded,
                () => _showEnterpriseAddDialog(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // =====================================================================
  // ORGANIC CLIENT CARDS - Natural Beauty
  // =====================================================================

  Widget _buildOrganicClientCard(Client client, int index) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppConstants.spaceLarge,
        vertical: AppConstants.spaceSmall,
      ),
      child: Hero(
        tag: 'client_${client.id}',
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _navigateToClientDetailWithAnimation(client),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppConstants.radiusXLarge),
              topRight: Radius.circular(AppConstants.radiusSmall),
              bottomLeft: Radius.circular(AppConstants.radiusSmall),
              bottomRight: Radius.circular(AppConstants.radiusXLarge),
            ),
            child: Container(
              decoration: ModernDecorations.organicCard,
              padding: EdgeInsets.all(AppConstants.spaceMedium),
              child: Row(
                children: [
                  _buildOrganicAvatar(client),
                  SizedBox(width: AppConstants.spaceMedium),
                  Expanded(child: _buildClientInfo(client)),
                  _buildStatusBadge(client.status),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrganicAvatar(Client client) {
    return Container(
      width: 56,
      height: 56,
      decoration: ModernDecorations.organicAvatar,
      child: Center(
        child: Text(
          _getInitials(client.name),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.quantumCore,
                fontWeight: AppConstants.fontWeightBold,
              ),
        ),
      ),
    );
  }

  Widget _buildClientInfo(Client client) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          client.name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: AppConstants.fontWeightSemiBold,
              ),
        ),
        if (client.phone != null) ...[
          SizedBox(height: AppConstants.spaceMicro),
          Text(
            client.phone!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
          ),
        ],
        if (client.email != null) ...[
          SizedBox(height: AppConstants.spaceMicro / 2),
          Text(
            client.email!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textTertiary,
                ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }

  Widget _buildStatusBadge(String status) {
    final statusData = _getStatusData(status);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.spaceSmall,
        vertical: AppConstants.spaceMicro,
      ),
      decoration: BoxDecoration(
        color: statusData['backgroundColor'],
        borderRadius: BorderRadius.circular(AppConstants.radiusXLarge),
        border: Border.all(
          color: statusData['borderColor'],
          width: 1.0,
        ),
      ),
      child: Text(
        statusData['name'],
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: statusData['textColor'],
              fontWeight: AppConstants.fontWeightSemiBold,
            ),
      ),
    );
  }

  // =====================================================================
  // QUANTUM FAB - Intelligent Floating Action
  // =====================================================================

  Widget _buildQuantumFAB() {
    return AnimatedBuilder(
      animation: _fabRotationAnimation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _fabRotationAnimation.value * 2 * 3.14159,
          child: FloatingActionButton(
            onPressed: () {
              _fabAnimationController.forward().then((_) {
                _fabAnimationController.reverse();
              });
              _showEnterpriseAddDialog();
            },
            backgroundColor: AppColors.floatingGlass,
            elevation: AppConstants.elevation3,
            child: Container(
              decoration: ModernDecorations.floatingGlass,
              child: Icon(
                Icons.add_rounded,
                color: AppColors.textInverse,
                size: AppConstants.iconLarge,
              ),
            ),
          ),
        );
      },
    );
  }

  // =====================================================================
  // ENTERPRISE DIALOGS - Modal Excellence
  // =====================================================================

  void _showEnterpriseAddDialog() {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();

    showDialog(
      context: context,
      barrierColor: AppColors.enterpriseBlack.withValues(alpha: 0.6),
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: ModernDecorations.createGlassContainer(
          borderRadius: AppConstants.radiusXLarge,
          blurRadius: AppConstants.glassBlurModal,
          backgroundColor: AppColors.modalGlass,
          padding: EdgeInsets.all(AppConstants.spaceLarge),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Dialog Header
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(AppConstants.spaceSmall),
                    decoration: ModernDecorations.createBrandDecoration(
                      borderRadius: AppConstants.radiusMedium,
                    ),
                    child: Icon(
                      Icons.person_add_rounded,
                      color: AppColors.textInverse,
                      size: AppConstants.iconMedium,
                    ),
                  ),
                  SizedBox(width: AppConstants.spaceMedium),
                  Expanded(
                    child: Text(
                      'Новый клиент',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: AppConstants.fontWeightSemiBold,
                              ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppConstants.spaceLarge),

              // Input Fields
              _buildEnterpriseTextField(
                controller: nameController,
                label: 'Имя клиента',
                icon: Icons.person_outline_rounded,
                isRequired: true,
              ),
              SizedBox(height: AppConstants.spaceMedium),

              _buildEnterpriseTextField(
                controller: phoneController,
                label: 'Телефон',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: AppConstants.spaceMedium),

              _buildEnterpriseTextField(
                controller: emailController,
                label: 'Email (опционально)',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: AppConstants.spaceXLarge),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: _buildQuantumOutlineButton(
                      'Отмена',
                      () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: AppConstants.spaceMedium),
                  Expanded(
                    child: _buildQuantumButton(
                      'Создать',
                      Icons.check_rounded,
                      () => _createClientWithIntelligence(
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

  Widget _buildEnterpriseTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isRequired = false,
    TextInputType? keyboardType,
  }) {
    return Container(
      decoration: ModernDecorations.createSurfaceDecoration(
        elevation: AppConstants.elevation1,
        borderRadius: AppConstants.radiusMedium,
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.textPrimary,
            ),
        decoration: InputDecoration(
          labelText: isRequired ? '$label *' : label,
          labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
          prefixIcon: Icon(
            icon,
            color: AppColors.quantumCore,
            size: AppConstants.iconSmall,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(AppConstants.spaceMedium),
        ),
      ),
    );
  }

  Widget _buildQuantumButton(String text, IconData icon, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.spaceMedium,
            vertical: AppConstants.spaceSmall,
          ),
          decoration: ModernDecorations.createBrandDecoration(
            borderRadius: AppConstants.radiusMedium,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: AppColors.textInverse,
                size: AppConstants.iconSmall,
              ),
              SizedBox(width: AppConstants.spaceSmall),
              Text(
                text,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.textInverse,
                      fontWeight: AppConstants.fontWeightSemiBold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuantumOutlineButton(String text, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.spaceMedium,
            vertical: AppConstants.spaceSmall,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.quantumCore,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          ),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.quantumCore,
                    fontWeight: AppConstants.fontWeightSemiBold,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  // =====================================================================
  // NAVIGATION & LOGIC - Intelligent Interactions
  // =====================================================================

  Future<void> _navigateToClientDetailWithAnimation(Client client) async {
    final result = await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ClientDetailPage(clientId: client.id),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOutCubic,
            )),
            child: child,
          );
        },
        transitionDuration: AppConstants.animationSlow,
      ),
    );

    if (result == true || result == null) {
      _loadClientsWithIntelligence();
    }
  }

  Future<void> _createClientWithIntelligence(
    String name,
    String phone,
    String email,
  ) async {
    if (name.trim().isEmpty) {
      _showEnterpriseSnackBar('Введите имя клиента', isError: true);
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
        _loadClientsWithIntelligence();
        _showEnterpriseSnackBar('Клиент успешно добавлен!', isError: false);

        // Haptic feedback for success
        HapticFeedback.lightImpact();
      }
    } catch (e) {
      if (mounted) {
        _showEnterpriseSnackBar('Ошибка: $e', isError: true);
      }
    }
  }

  void _showEnterpriseSnackBar(String message, {required bool isError}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Container(
              padding: EdgeInsets.all(AppConstants.spaceSmall),
              decoration: BoxDecoration(
                color: isError ? AppColors.errorCore : AppColors.successCore,
                borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
              ),
              child: Icon(
                isError
                    ? Icons.error_outline_rounded
                    : Icons.check_circle_outline_rounded,
                color: AppColors.textInverse,
                size: AppConstants.iconSmall,
              ),
            ),
            SizedBox(width: AppConstants.spaceSmall),
            Expanded(
              child: Text(
                message,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textInverse,
                      fontWeight: AppConstants.fontWeightMedium,
                    ),
              ),
            ),
          ],
        ),
        backgroundColor: isError
            ? AppColors.errorCore.withValues(alpha: 0.9)
            : AppColors.successCore.withValues(alpha: 0.9),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        ),
        margin: EdgeInsets.all(AppConstants.spaceMedium),
        elevation: AppConstants.elevation3,
        duration: Duration(milliseconds: 3000),
      ),
    );
  }

  // =====================================================================
  // UTILITY METHODS - Helper Functions
  // =====================================================================

  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  Map<String, dynamic> _getStatusData(String status) {
    switch (status.toLowerCase()) {
      case 'new':
        return {
          'name': 'Новый',
          'backgroundColor': AppColors.successLight,
          'borderColor': AppColors.successCore.withValues(alpha: 0.3),
          'textColor': AppColors.successCore,
        };
      case 'vip':
        return {
          'name': 'VIP',
          'backgroundColor': AppColors.premiumGold.withValues(alpha: 0.1),
          'borderColor': AppColors.premiumGold.withValues(alpha: 0.3),
          'textColor': AppColors.premiumGold,
        };
      default:
        return {
          'name': 'Постоянный',
          'backgroundColor': AppColors.infoLight,
          'borderColor': AppColors.infoCore.withValues(alpha: 0.3),
          'textColor': AppColors.infoCore,
        };
    }
  }
}
