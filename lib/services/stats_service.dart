import 'dart:convert';
import 'package:http/http.dart' as http;

class StatsService {
  static const String baseUrl = 'http://localhost:3000';

  Future<Map<String, dynamic>?> getStats() async {
    final response = await http.get(Uri.parse('$baseUrl/stats'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    }

    return null;
  }
}