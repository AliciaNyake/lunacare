import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  Widget buildAccountBox(String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppTheme.primaryPurple.withOpacity(0.45),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Center(
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon compte'),
      ),
      body: Center(
        child: Container(
          width: 320,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F1F8),
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Column(
            children: [
              buildAccountBox('Nom utilisatrice'),
              buildAccountBox('Adresse e-mail'),
              buildAccountBox('Connexion / Déconnexion'),
            ],
          ),
        ),
      ),
    );
  }
}