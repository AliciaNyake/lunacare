class CycleLogicService {

  ///  Calculer la durée moyenne du cycle
  int calculateAverageCycle(List<DateTime> dates) {
    if (dates.length < 2) return 28; // valeur par défaut

    List<int> cycles = [];

    for (int i = 1; i < dates.length; i++) {
      int diff = dates[i].difference(dates[i - 1]).inDays;
      cycles.add(diff);
    }

    int sum = cycles.reduce((a, b) => a + b);
    return (sum / cycles.length).round();
  }

  ///  Prédire les prochaines règles
  DateTime predictNextPeriod(List<DateTime> dates) {
    if (dates.isEmpty) return DateTime.now();

    int avgCycle = calculateAverageCycle(dates);
    DateTime lastPeriod = dates.last;

    return lastPeriod.add(Duration(days: avgCycle));
  }

  ///  Estimer l’ovulation
  DateTime estimateOvulation(List<DateTime> dates) {
    DateTime nextPeriod = predictNextPeriod(dates);

    // ovulation ~14 jours avant règles
    return nextPeriod.subtract(Duration(days: 14));
  }

  ///  Phase actuelle du cycle
  String getCyclePhase(DateTime today, List<DateTime> dates) {
    DateTime nextPeriod = predictNextPeriod(dates);
    DateTime ovulation = estimateOvulation(dates);

    if (today.isBefore(ovulation.subtract(Duration(days: 3)))) {
      return "Phase folliculaire";
    } else if (today.isAfter(ovulation.subtract(Duration(days: 3))) &&
        today.isBefore(ovulation.add(Duration(days: 1)))) {
      return "Ovulation";
    } else if (today.isAfter(ovulation)) {
      return "Phase lutéale";
    } else {
      return "Règles";
    }
  }
  Map<String, dynamic> getCycleInfo(List<DateTime> dates) {
    final nextPeriod = predictNextPeriod(dates);
    final ovulation = estimateOvulation(dates);
    final phase = getCyclePhase(DateTime.now(), dates);
    final avgCycle = calculateAverageCycle(dates);

    return {
      "nextPeriod": nextPeriod,
      "ovulation": ovulation,
      "phase": phase,
      "averageCycle": avgCycle,
      "totalCycles": dates.length,
    };
  }

}