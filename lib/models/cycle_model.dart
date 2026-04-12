import 'package:hive/hive.dart';

part 'cycle_model.g.dart';

@HiveType(typeId: 0)
class CycleModel {
  @HiveField(0)
  final String date;

  @HiveField(1)
  final String flux;

  @HiveField(2)
  final String humeur;

  @HiveField(3)
  final double temperature;

  @HiveField(4)
  final double poids;

  @HiveField(5)
  final double hydratation;

  CycleModel({
    required this.date,
    required this.flux,
    required this.humeur,
    required this.temperature,
    required this.poids,
    required this.hydratation,
  });
}