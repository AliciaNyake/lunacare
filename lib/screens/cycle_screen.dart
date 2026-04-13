import 'package:flutter/material.dart';

class CycleScreen extends StatefulWidget {
  const CycleScreen({super.key});

  @override
  State<CycleScreen> createState() => _CycleScreenState();
}

class _CycleScreenState extends State<CycleScreen> {
  DateTime? lastPeriodDate;
  int cycleLength = 28;

  DateTime? get nextPeriodDate {
    if (lastPeriodDate == null) return null;
    return lastPeriodDate!.add(Duration(days: cycleLength));
  }

  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        lastPeriodDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suivi du cycle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: pickDate,
              child: const Text('Choisir la date'),
            ),
            const SizedBox(height: 20),
            if (lastPeriodDate != null)
              Text(
                "Dernières règles : ${lastPeriodDate!.day}/${lastPeriodDate!.month}/${lastPeriodDate!.year}",
              ),
            const SizedBox(height: 20),
            if (nextPeriodDate != null)
              Text(
                "Prochaines règles : ${nextPeriodDate!.day}/${nextPeriodDate!.month}/${nextPeriodDate!.year}",
              ),
          ],
        ),
      ),
    );
  }
}