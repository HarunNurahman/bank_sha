import 'dart:convert';

import 'package:bank_sha/models/tip_model.dart';
import 'package:bank_sha/services/auth_service.dart';
import 'package:http/http.dart' as http;

class TipService {
  String baseUrl = 'https://bwabank.my.id/api';

  Future<List<TipModel>> getTips() async {
    try {
      final token = await AuthService().getToken();
      final response = await http.get(
        Uri.parse('$baseUrl/tips'),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200) {
        return List<TipModel>.from(
          jsonDecode(response.body)['data'].map(
            (tip) => TipModel.fromJson(tip),
          ),
        ).toList();
      }

      throw jsonDecode(response.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
