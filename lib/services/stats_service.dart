class StatsService {

  ///  Moyenne du cycle
  double getAverageCycle(List<DateTime> dates) {
    if (dates.length < 2) return 28;

    List<int> diffs = [];

    for (int i = 1; i < dates.length; i++) {
      diffs.add(dates[i].difference(dates[i - 1]).inDays);
    }

    return diffs.reduce((a, b) => a + b) / diffs.length;
  }

  ///  Nombre total de cycles enregistrés
  int getTotalCycles(List<DateTime> dates) {
    return dates.length;
  }

  ///  Cycle le plus long
  int getLongestCycle(List<DateTime> dates) {
    if (dates.length < 2) return 0;

    List<int> diffs = [];

    for (int i = 1; i < dates.length; i++) {
      diffs.add(dates[i].difference(dates[i - 1]).inDays);
    }

    return diffs.reduce((a, b) => a > b ? a : b);
  }

  ///  Cycle le plus court
  int getShortestCycle(List<DateTime> dates) {
    if (dates.length < 2) return 0;

    List<int> diffs = [];

    for (int i = 1; i < dates.length; i++) {
      diffs.add(dates[i].difference(dates[i - 1]).inDays);
    }

    return diffs.reduce((a, b) => a < b ? a : b);
  }
}