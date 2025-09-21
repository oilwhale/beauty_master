import 'package:flutter/material.dart';

import 'features/clients/presentation/pages/clients_page.dart';
import 'features/calendar/presentation/pages/calendar_page.dart';
import 'features/business/presentation/pages/business_page.dart';
import 'features/settings/presentation/pages/settings_page.dart';
import 'features/dashboard/presentation/pages/dashboard_page.dart';
import 'core/theme/glass_decorations.dart';
import 'core/constants/app_colors.dart';

/// Основная навигация приложения с Bottom Navigation Bar
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  /// Страницы приложения
  final List<Widget> _pages = [
    const DashboardPage(),
    const CalendarPage(),
    const ClientsPage(),
    const BusinessPage(),
    const SettingsPage(),
  ];

  /// Данные для навигационных элементов
  final List<NavigationItem> _navigationItems = [
    NavigationItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: 'Главная',
    ),
    NavigationItem(
      icon: Icons.calendar_today_outlined,
      activeIcon: Icons.calendar_today,
      label: 'Календарь',
    ),
    NavigationItem(
      icon: Icons.people_outline,
      activeIcon: Icons.people,
      label: 'Клиенты',
    ),
    NavigationItem(
      icon: Icons.business_center_outlined,
      activeIcon: Icons.business_center,
      label: 'Бизнес',
    ),
    NavigationItem(
      icon: Icons.settings_outlined,
      activeIcon: Icons.settings,
      label: 'Настройки',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: GlassDecorations.glassNavBar,
      child: ClipRRect(
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: AppColors.primaryMain,
          unselectedItemColor: AppColors.textSecondary,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          items: _navigationItems.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final isSelected = _currentIndex == index;

            return BottomNavigationBarItem(
              icon: _buildNavIcon(
                isSelected ? item.activeIcon : item.icon,
                isSelected,
              ),
              label: item.label,
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(8),
      decoration: isSelected
          ? BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryMain.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            )
          : null,
      child: Icon(
        icon,
        size: 24,
        color: isSelected ? Colors.white : AppColors.textSecondary,
      ),
    );
  }
}

/// Модель для элемента навигации
class NavigationItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  NavigationItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}
