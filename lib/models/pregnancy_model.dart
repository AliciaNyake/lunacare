class PregnancyModel {
  final String id;
  final DateTime startDate;

  PregnancyModel({
    required this.id,
    required this.startDate,
  });

  int get weeks {
    final diff = DateTime.now().difference(startDate);
    return (diff.inDays / 7).floor();
  }

  factory PregnancyModel.fromJson(Map<String, dynamic> json) {
    return PregnancyModel(
      id: json['id'],
      startDate: DateTime.parse(json['startDate']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'startDate': startDate.toIso8601String(),
  };
}