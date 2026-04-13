import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import '../models/cycle_model.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:3000';

  Future<UserModel?> getUser() async {
    final response = await http.get(Uri.parse('$baseUrl/user'));

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<CycleModel?> getCycle() async {
    final response = await http.get(Uri.parse('$baseUrl/cycle'));

    if (response.statusCode == 200) {
      return CycleModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }
}