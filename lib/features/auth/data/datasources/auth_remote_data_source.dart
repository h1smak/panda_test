import 'dart:convert';
import 'package:http/http.dart' as http;

import 'auth_data_source.dart';

class AuthRemoteDataSource implements AuthDataSource {
  final String baseUrl;

  AuthRemoteDataSource({required this.baseUrl});

  @override
  Future<Map<String, dynamic>> login(String username) async {
    final response = await http.post(
      Uri.parse('$baseUrl/userauth'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Login failed: ${response.body}');
    }
  }
}
