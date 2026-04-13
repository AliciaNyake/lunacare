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

        // Charge les données au démarrage
        Future.microtask(() {
            Provider.of<AppProvider>(context, listen: false).loadAppData();
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
                : provider.errorMessage != null
                ? Center(child: Text(provider.errorMessage!))
                : Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text('Nom : ${provider.currentUser?.name ?? "---"}'),
                        Text('Email : ${provider.currentUser?.email ?? "---"}'),
                        const SizedBox(height: 20),
                        Text(
                            'Début cycle : ${provider.currentCycle?.startDate.toString() ?? "---"}',
                        ),
                        Text(
                            'Durée cycle : ${provider.currentCycle?.cycleLength ?? 0} jours',
                        ),
                    ],
                ),
            ),
        );
    }
}