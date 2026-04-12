import 'package:hive/hive.dart';
import '../models/cycle_model.dart';

class CycleService {
  late Box<CycleModel> _box;

  Future<void> init() async {
    _box = Hive.box<CycleModel>('cycles');
  }

  Future<void> addCycle(CycleModel cycle) async {
    await _box.add(cycle);
  }

  List<CycleModel> getCycles() {
    return _box.values.toList();
  }

  Future<void> deleteCycle(int index) async {
    await _box.deleteAt(index);
  }

  List<DateTime> getCycleDates() {
    return _box.values
        .map((cycle) => DateTime.parse(cycle.date))
        .toList();
  }
}