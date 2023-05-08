import 'dart:convert';

import 'package:flutter_ecommerce/const.dart';
import 'package:http/http.dart' as http;

class RemoteAuthService {
  var client = http.Client();

  Future<dynamic> signUp({
    required String email,
    required String password,
  }) async {
    var body = {"username": email, "email": email, "password": password};
    var response = await client.post(
      Uri.parse("$baseUrl/api/auth/local/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    return response;
  }
}
