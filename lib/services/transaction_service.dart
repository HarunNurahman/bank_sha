import 'dart:convert';

import 'package:bank_sha/models/topup_model.dart';
import 'package:bank_sha/models/transfer_model.dart';
import 'package:bank_sha/services/auth_service.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  String baseUrl = 'https://bwabank.my.id/api';

  Future<String> topup(TopUpModel data) async {
    try {
      final token = await AuthService().getToken();
      final response = await http.post(
        Uri.parse('$baseUrl/top_ups'),
        headers: {'Authorization': token},
        body: data.toJson(),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body)['redirect_url'];
      }

      throw jsonDecode(response.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> transfer(TransferModel data) async {
    try {
      final token = await AuthService().getToken();
      final response = await http.post(
        Uri.parse('$baseUrl/transfers'),
        headers: {'Authorization': token},
        body: data.toJson(),
      );

      if (response.statusCode != 200) {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
