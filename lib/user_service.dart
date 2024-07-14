import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static const String baseUrl = 'http://10.0.2.2:8000';

  Future<List<dynamic>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users/'));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load users: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }

 
  Future<Map<String, dynamic>> fetchCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String? sessionId = prefs.getString('session_id'); // Assuming session ID is stored

    if (sessionId == null) {
      throw Exception('User not authenticated');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/users/current/'),
      headers: {
        'Cookie': 'sessionid=$sessionId',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load user data: ${response.reasonPhrase}');
    }
  }

  Future<void> addUser(Map<String, dynamic> userData) async {
    dynamic json=jsonEncode(userData);
    print(json);
    final response = await http.post(
      Uri.parse('$baseUrl/users/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add user');
    }
  }

  Future<void> updateUser(int id, Map<String, dynamic> userData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/users/$id/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user');
    }
  }

  Future<void> deleteUser(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/users/$id/'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete user');
    }
  }
}
