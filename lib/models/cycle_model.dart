class CycleModel {
  final String id;
  final DateTime startDate;
  final int cycleLength;

  CycleModel({
    required this.id,
    required this.startDate,
    required this.cycleLength,
  });

  factory CycleModel.fromJson(Map<String, dynamic> json) {
    return CycleModel(
      id: json['id'] ?? '',
      startDate: DateTime.parse(json['startDate']),
      cycleLength: json['cycleLength'] ?? 28,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'startDate': startDate.toIso8601String(),
      'cycleLength': cycleLength,
    };
  }
}