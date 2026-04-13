import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/cycle_model.dart';
import '../models/pregnancy_model.dart';

class AppProvider extends ChangeNotifier {
  UserModel? user;
  CycleModel? cycle;
  PregnancyModel? pregnancy;

  void setUser(UserModel newUser) {
    user = newUser;
    notifyListeners();
  }

  void setCycle(CycleModel newCycle) {
    cycle = newCycle;
    notifyListeners();
  }

  void setPregnancy(PregnancyModel newPregnancy) {
    pregnancy = newPregnancy;
    notifyListeners();
  }

  void clearAllData() {
    user = null;
    cycle = null;
    pregnancy = null;
    notifyListeners();
  }
}