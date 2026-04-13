import 'dart:convert';
import 'package:http/http.dart' as http;

class MoonService {
  static const String baseUrl = 'http://localhost:3000';

  Future<Map<String, dynamic>?> getMoonInfo() async {
    final response = await http.get(Uri.parse('$baseUrl/moon'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    }

    return null;
  }
}