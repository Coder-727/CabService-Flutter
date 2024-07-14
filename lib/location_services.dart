import 'dart:convert';
import 'package:http/http.dart' as http;

class LocationServices {
  static const String baseUrl = 'http://10.0.2.2:8000';

  Future<Map<String, dynamic>> fetchLastLocation() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/location/last/'));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load last location: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to load last location: $e');
    }
  }


   Future<void> addLocation(Map<String, dynamic> locationData) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/location/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(locationData),
      );

      if (response.statusCode != 201) {
        throw Exception('Failed to add location: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to add location: $e');
    }
  }

  Future<void> updateLocation(int id, Map<String, dynamic> locationData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/location/$id/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(locationData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update location');
    }
  }

  Future<void> deleteLocation(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/location/$id/'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete location');
    }
  }
}
