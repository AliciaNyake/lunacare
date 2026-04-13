import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/cycle_model.dart';
import '../models/pregnancy_model.dart';
import '../services/auth_service.dart';
import '../services/cycle_service.dart';
import '../services/moon_service.dart';
import '../services/stats_service.dart';

class AppProvider extends ChangeNotifier {
  final AuthService authService = AuthService();
  final CycleService cycleService = CycleService();
  final MoonService moonService = MoonService();
  final StatsService statsService = StatsService();

  UserModel? currentUser;
  CycleModel? currentCycle;
  PregnancyModel? currentPregnancy;
  Map<String, dynamic>? moonData;
  Map<String, dynamic>? statsData;

  bool isLoading = false;
  bool isDarkMode = false;
  String? errorMessage;

  Future<void> loadAppData() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      currentUser = await authService.getCurrentUser();
      currentCycle = await cycleService.getCycle();
      currentPregnancy = await cycleService.getPregnancy();
      moonData = await moonService.getMoonInfo();
      statsData = await statsService.getStats();
    } catch (e) {
      errorMessage = 'Erreur de chargement des données';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> saveCycle(DateTime startDate, int cycleLength) async {
    await cycleService.saveCycle(
      startDate: startDate,
      cycleLength: cycleLength,
    );
    currentCycle = await cycleService.getCycle();
    notifyListeners();
  }

  Future<void> savePregnancy(DateTime startDate) async {
    await cycleService.savePregnancy(startDate: startDate);
    currentPregnancy = await cycleService.getPregnancy();
    notifyListeners();
  }

  void toggleTheme(bool value) {
    isDarkMode = value;
    notifyListeners();
  }
}