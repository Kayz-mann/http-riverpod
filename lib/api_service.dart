import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_riverpod/model/create_user_model.dart';
import 'package:http_riverpod/model/user_model.dart';

class ApiService {
  final String baseUrl = "https://reqres.in/api";
  Future<List<User>> fetchUser() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> data = jsonResponse['data'];
      return data.map((item) => User.fromJson(item)).toList();
    } else {
      throw Exception('Failed to Load the user');
    }
  }

  Future<CreateUser> createUser(String name, String job) async {
    final response = await http.post(Uri.parse('$baseUrl/users'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"name": name, "job": job}));

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
      }
      return CreateUser.fromJson(
          jsonEncode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create user');
    }
  }
}
