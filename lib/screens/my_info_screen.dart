import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MyInfoScreen extends StatelessWidget {
  const MyInfoScreen({super.key});

  Widget buildField(String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
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

  Widget buildSmallButton(String text, BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          if (text == 'Annuler') {
            Navigator.pop(context);
          }
        },
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infos du jour'),
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
              buildField('Date'),
              buildField('Humeur(s)'),
              buildField('Symptômes'),
              buildField('Règles : oui / non'),
              buildField('Si oui : flux'),
              buildField('Contraception question'),
              buildField('Si oui : type'),
              buildField('Digestion'),
              buildField('Activité physique'),
              buildField('Test ovulation / grossesse'),
              const Spacer(),
              Row(
                children: [
                  buildSmallButton('Annuler', context),
                  const SizedBox(width: 10),
                  buildSmallButton('Entrer', context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}