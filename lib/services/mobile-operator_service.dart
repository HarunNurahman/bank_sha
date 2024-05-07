import 'dart:convert';

import 'package:bank_sha/models/mobile-operator_model.dart';
import 'package:bank_sha/services/auth_service.dart';
import 'package:http/http.dart' as http;

class MobileOperatorService {
  String baseUrl = 'https://bwabank.my.id/api';

  Future<List<MobileOperatorModel>> getMobileOperator() async {
    try {
      final token = await AuthService().getToken();
      final response = await http.get(
        Uri.parse('$baseUrl/operator_cards'),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200) {
        return List<MobileOperatorModel>.from(
          jsonDecode(response.body)['data'].map(
            (operatorCard) => MobileOperatorModel.fromJson(operatorCard),
          ),
        ).toList();
      }

      throw jsonDecode(response.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
