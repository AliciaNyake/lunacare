import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cycle_model.dart';
import '../models/pregnancy_model.dart';

class CycleService {
  static const String baseUrl = 'http://localhost:3000';

  Future<CycleModel?> getCycle() async {
    final response = await http.get(Uri.parse('$baseUrl/cycle'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return CycleModel.fromJson(data);
    }

    return null;
  }

  Future<void> saveCycle({
    required DateTime startDate,
    required int cycleLength,
  }) async {
    await http.post(
      Uri.parse('$baseUrl/cycle'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'startDate': startDate.toIso8601String(),
        'cycleLength': cycleLength,
      }),
    );
  }

  Future<PregnancyModel?> getPregnancy() async {
    final response = await http.get(Uri.parse('$baseUrl/pregnancy'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return PregnancyModel.fromJson(data);
    }

    return null;
  }

  Future<void> savePregnancy({
    required DateTime startDate,
  }) async {
    await http.post(
      Uri.parse('$baseUrl/pregnancy'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'startDate': startDate.toIso8601String(),
      }),
    );
  }
}