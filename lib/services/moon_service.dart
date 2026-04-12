import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'models/cycle_model.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //  Supabase
  await Supabase.initialize(
    url: 'TON_SUPABASE_URL',
    anonKey: 'TON_SUPABASE_ANON_KEY',
  );

  //  Hive
  await Hive.initFlutter();
  Hive.registerAdapter(CycleModelAdapter());
  await Hive.openBox<CycleModel>('cycles');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LunaCare',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}