// lib/features/clients/presentation/pages/clients_page.dart
import 'package:flutter/material.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  'Клиенты',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'CRM система клиентов',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
