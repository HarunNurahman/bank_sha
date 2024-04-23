import 'dart:convert';

import 'package:bank_sha/models/sign-in_model.dart';
import 'package:bank_sha/models/sign-up_model.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

  Future<UserModel> signUp(SignUpModel data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        body: data.toJson(),
      );

      if (response.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(response.body));
        user = user.copyWith(password: data.password);

        await storeCredentials(user);

        return user;
      } else {
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signIn(SignInModel data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        body: data.toJson(),
      );

      if (response.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(response.body));
        user = user.copyWith(password: data.password);

        await storeCredentials(user);

        return user;
      } else {
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> storeCredentials(UserModel user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: user.token);
      await storage.write(key: 'email', value: user.email);
      await storage.write(key: 'password', value: user.password);
    } catch (e) {
      rethrow;
    }
  }

  Future<SignInModel> getCredential() async {
    try {
      const storage = FlutterSecureStorage();
      Map<String, String> value = await storage.readAll();

      if (value['email'] == null || value['password'] == null) {
        throw 'authenticated';
      } else {
        final SignInModel data = SignInModel(
          email: value['email'],
          password: value['password'],
        );

        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async {
    String token = '';

    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'token');

    if (value != null) {
      token = 'Bearer $value';
    }

    return token;
  }

  Future<void> clearCredential() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }
}
