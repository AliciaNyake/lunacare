import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import '../models/cycle_model.dart';

class ApiService {
  static const baseUrl = "http://localhost:3000";

  Future<UserModel?> getUser() async {
    final res = await http.get(Uri.parse('$baseUrl/user'));

    if (res.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(res.body));
    }
    return null;
  }

  Future<CycleModel?> getCycle() async {
    final res = await http.get(Uri.parse('$baseUrl/cycle'));

    if (res.statusCode == 200) {
      return CycleModel.fromJson(jsonDecode(res.body));
    }
    return null;
  }
}