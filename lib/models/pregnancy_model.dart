class PregnancyModel {
  final DateTime startDate;
  final String notes;
  final double weight;

  PregnancyModel({
    required this.startDate,
    required this.notes,
    required this.weight,
  });

  int get pregnancyWeeks {
    final difference = DateTime.now().difference(startDate);
    return (difference.inDays / 7).floor();
  }
}