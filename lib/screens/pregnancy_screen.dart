import 'package:flutter/material.dart';

class PregnancyScreen extends StatefulWidget {
  const PregnancyScreen({super.key});

  @override
  State<PregnancyScreen> createState() => _PregnancyScreenState();
}

class _PregnancyScreenState extends State<PregnancyScreen> {
  DateTime? pregnancyStartDate;

  int get pregnancyWeeks {
    if (pregnancyStartDate == null) return 0;
    final difference = DateTime.now().difference(pregnancyStartDate!);
    return (difference.inDays / 7).floor();
  }

  Future<void> pickPregnancyDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        pregnancyStartDate = pickedDate;
      });
    }
  }

  String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suivi de grossesse'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: pickPregnancyDate,
              child: const Text('Choisir la date de début'),
            ),
            const SizedBox(height: 20),
            if (pregnancyStartDate != null)
              Text("Date : ${formatDate(pregnancyStartDate!)}"),
            const SizedBox(height: 20),
            if (pregnancyStartDate != null)
              Text("Semaine : $pregnancyWeeks"),
          ],
        ),
      ),
    );
  }
}