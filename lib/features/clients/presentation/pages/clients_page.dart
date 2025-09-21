import 'dart:async';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../core/di/injection.dart';
import '../../../../core/database/database.dart';
import '../../../../core/theme/glass_decorations.dart';
import '../../../../core/constants/app_colors.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  final AppDatabase _database = getIt<AppDatabase>();
  List<Client> _clients = [];
  bool _isLoading = true;
  String _searchQuery = '';
  Timer? _searchTimer;

  @override
  void initState() {
    super.initState();
    _loadClients();
  }

  @override
  void dispose() {
    _searchTimer?.cancel();
    super.dispose();
  }

  Future<void> _loadClients() async {
    setState(() => _isLoading = true);
    try {
      print('Поиск по запросу: "$_searchQuery"');

      // Получаем всех клиентов и фильтруем в коде Dart
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

      print('Найдено клиентов: ${filteredClients.length}');

      setState(() {
        _clients = filteredClients;
        _isLoading = false;
      });
    } catch (e) {
      print('Ошибка поиска: $e');
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка загрузки: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildSearchBar(),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _buildClientsList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddClientDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text(
            'Клиенты',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: GlassDecorations.glassBase,
            child: Text(
              '${_clients.length}',
              style: const TextStyle(
                color: AppColors.primaryMain,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: GlassDecorations.glassInput,
        child: TextField(
          decoration: const InputDecoration(
            hintText: 'Поиск по имени или телефону...',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          onChanged: (value) {
            _searchTimer?.cancel();
            _searchTimer = Timer(const Duration(milliseconds: 500), () {
              setState(() => _searchQuery = value);
              _loadClients();
            });
          },
        ),
      ),
    );
  }

  Widget _buildClientsList() {
    if (_clients.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.people_outline, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              _searchQuery.isEmpty ? 'Нет клиентов' : 'Клиенты не найдены',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => _showAddClientDialog(),
              child: const Text('Добавить первого клиента'),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadClients,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _clients.length,
        itemBuilder: (context, index) {
          final client = _clients[index];
          return _buildClientCard(client);
        },
      ),
    );
  }

  Widget _buildClientCard(Client client) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: GlassDecorations.glassCard,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: AppColors.primaryMain,
          child: Text(
            _getInitials(client.name),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          client.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (client.phone != null) Text(client.phone!),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: _getStatusColor(client.status),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _getStatusName(client.status),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => _showClientDetails(client),
      ),
    );
  }

  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.isEmpty) return '';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'new':
        return Colors.green;
      case 'vip':
        return AppColors.primaryMain;
      default:
        return Colors.blue;
    }
  }

  String _getStatusName(String status) {
    switch (status) {
      case 'new':
        return 'Новый';
      case 'vip':
        return 'VIP';
      default:
        return 'Постоянный';
    }
  }

  void _showClientDetails(Client client) {
    // TODO: Показать детали клиента
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Детали клиента: ${client.name}')),
    );
  }

  void _showAddClientDialog() {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Новый клиент'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Имя',
                hintText: 'Введите имя клиента',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Телефон',
                hintText: '+7 (xxx) xxx-xx-xx',
              ),
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            onPressed: () => _createClient(
              nameController.text,
              phoneController.text,
            ),
            child: const Text('Сохранить'),
          ),
        ],
      ),
    );
  }

  Future<void> _createClient(String name, String phone) async {
    if (name.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Введите имя клиента')),
      );
      return;
    }

    try {
      await _database.createClient(
        ClientsCompanion.insert(
          name: name.trim(),
          phone: phone.trim().isEmpty
              ? const drift.Value.absent()
              : drift.Value(phone.trim()),
        ),
      );

      if (mounted) {
        Navigator.pop(context);
        _loadClients();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Клиент добавлен')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка: $e')),
        );
      }
    }
  }
}
