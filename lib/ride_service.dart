import 'dart:convert';
import 'package:cab_cris/cab_model_page.dart';
import 'package:http/http.dart' as http;

class RideService {
  static const String baseUrl = 'http://10.0.2.2:8000';

  Future<List<Cab>> fetchRides() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/rides/'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Cab> cabs = data.map((json) => Cab.fromMap(json)).toList();
        return cabs;
      } else {
        throw Exception('Failed to load rides: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to load rides: $e');
    }
  }

  Future<void> addRide(Map<String, dynamic> rideData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/rides/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(rideData),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add ride');
    }
  }

  Future<void> updateRide(int id, Map<String, dynamic> rideData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/rides/$id/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(rideData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update ride');
    }
  }

  Future<void> deleteRide(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/rides/$id/'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete ride');
    }
  }
}
