import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'https://bwabank.my.id/api';

  Future<bool> checkEmail(String email) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/is-email-exist'),
        body: {'email': email},
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body)['is_email_exist'];
      } else {
        return jsonDecode(response.body)['errors'];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
