class CycleModel {
  final DateTime startDate;
  final int cycleLength;
  final int periodLength;
  final String symptoms;

  CycleModel({
    required this.startDate,
    required this.cycleLength,
    required this.periodLength,
    required this.symptoms,
  });

  DateTime get nextPeriodDate {
    return startDate.add(Duration(days: cycleLength));
  }
}