import 'dart:convert';

import 'package:bank_sha/models/payment-method_model.dart';
import 'package:bank_sha/services/auth_service.dart';
import 'package:http/http.dart' as http;

class PaymentMethodService {
  String baseUrl = 'https://bwabank.my.id/api';

  Future<List<PaymentMethodModel>> getPaymentMethod() async {
    try {
      final token = await AuthService().getToken();
      final response = await http.get(
        Uri.parse('$baseUrl/payment_methods'),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200) {
        return List<PaymentMethodModel>.from(jsonDecode(response.body).map(
          (paymentMethod) => PaymentMethodModel.fromJson(paymentMethod),
        )).toList();
      } else {
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
