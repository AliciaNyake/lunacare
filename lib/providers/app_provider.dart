import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/cycle_model.dart';
import '../services/api_service.dart';

class AppProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();

  UserModel? user;
  CycleModel? cycle;
  bool isLoading = false;
  bool isDarkMode = false;

  Future<void> loadData() async {
    isLoading = true;
    notifyListeners();

    user = await apiService.getUser();
    cycle = await apiService.getCycle();

    isLoading = false;
    notifyListeners();
  }

  void toggleTheme(bool value) {
    isDarkMode = value;
    notifyListeners();
  }
}