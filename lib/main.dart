import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/cycle_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(CycleModelAdapter());
  await Hive.openBox<CycleModel>('cycles');

  await Supabase.initialize(
    url: 'TON_URL',
    anonKey: 'TON_ANON_KEY',
  );

  runApp(const LunaCareApp());
}

class LunaCareApp extends StatelessWidget {
  const LunaCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LunaCare',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}