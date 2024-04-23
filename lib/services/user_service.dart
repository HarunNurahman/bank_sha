import 'dart:convert';

import 'package:bank_sha/models/user-edit_model.dart';
import 'package:bank_sha/services/auth_service.dart';
import 'package:http/http.dart' as http;

class UserService {
  String baseUrl = 'https://bwabank.my.id/api';

  Future<void> updateUser(UserEditModel data) async {
    try {
      final token = await AuthService().getToken();
      final response = await http.put(
        Uri.parse('$baseUrl/users'),
        body: data.toJson(),
        headers: {'Authorization': token},
      );

      if (response.statusCode != 200) {
        throw (jsonDecode(response.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
