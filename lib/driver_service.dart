// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class DriverService {
//   static const String baseUrl = 'http://10.0.2.2:8000';

//   Future<List<dynamic>> fetchDrivers() async {
//     try {
//       final response = await http.get(Uri.parse('$baseUrl/drivers/'));

//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       } else {
//         throw Exception('Failed to load drivers: ${response.statusCode} ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load drivers: $e');
//     }
//   }

//   Future<void> addDriver(Map<String, dynamic> driverData) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/drivers/'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(driverData),
//     );

//     if (response.statusCode != 201) {
//       throw Exception('Failed to add driver');
//     }
//   }

//   Future<void> updateDriver(int id, Map<String, dynamic> driverData) async {
//     final response = await http.put(
//       Uri.parse('$baseUrl/drivers/$id/'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(driverData),
//     );

//     if (response.statusCode != 200) {
//       throw Exception('Failed to update driver');
//     }
//   }

//   Future<void> deleteDriver(int id) async {
//     final response = await http.delete(Uri.parse('$baseUrl/drivers/$id/'));

//     if (response.statusCode != 204) {
//       throw Exception('Failed to delete driver');
//     }
//   }
// }
