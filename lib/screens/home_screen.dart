import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<AppProvider>(context, listen: false).loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('LunaCare'),
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nom : ${provider.user?.name ?? "---"}'),
            Text('Email : ${provider.user?.email ?? "---"}'),
            const SizedBox(height: 20),
            Text(
              'Début cycle : ${provider.cycle?.startDate.toString() ?? "---"}',
            ),
            Text(
              'Durée cycle : ${provider.cycle?.cycleLength ?? 0} jours',
            ),
          ],
        ),
      ),
    );
  }
}