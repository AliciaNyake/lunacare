import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  Future<String> getAdvice(String phase, String humeur) async {
    final url = Uri.parse("https://api.mistral.ai/v1/chat/completions");

    final response = await http.post(
      url,
      headers: {
        "Authorization": "Bearer NAVL8z7kQO7LEG3yYyCPv7poc9KBp0kQ",
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({
        "model": "open-mistral-7b",
        "messages": [
          {
            "role": "user",
            "content": "Donne un conseil pour une personne en phase $phase avec humeur $humeur"
          }
        ]
      }),
    );

    print("Status: ${response.statusCode}");
    print("Body: ${response.body}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["choices"][0]["message"]["content"];
    } else {
      throw Exception("Erreur API");
    }
  }
}