// cab_services.dart

import 'dart:convert';
import 'package:cab_cris/cab_model_page.dart';
import 'package:http/http.dart' as http;

class CabService {
  static const String baseUrl = 'http://10.0.2.2:8000';

  Future<List<Cab>> fetchCabs() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/cabs/'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        print(data);
        List<Cab> cabs = data.map((json) => Cab.fromMap(json)).toList();
        return cabs;
      } else {
        throw Exception(
            'Failed to load cabs: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to load cabs: $e');
    }
  }

  Future<void> addCab(Map<String, dynamic> cabData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/cabs/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(cabData),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add cab');
    }
  }

  Future<void> updateCab(int id, Map<String, dynamic> cabData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/cabs/$id/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(cabData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update cab');
    }
  }

  Future<void> deleteCab(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/cabs/$id/'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete cab');
    }
  }


Future<void> updateCabAvailableSeats(String cabNumber, int newAvailableSeats) async {
  try {
    final Uri url = Uri.parse('$baseUrl/cabs/?cabNumber=$cabNumber');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('Received data from server: $data');

      if (data.isNotEmpty) {
        print('Received data from server');

        // Assuming cabNumber is unique and there's only one result
        int cabId = data[0]['id']; // Extract cabId from the first result
        int? currentAvailableSeats = data[0]['availableSeats'] as int?;
        print('Cab ID: $cabId');
        print('Current available seats: $currentAvailableSeats');

        // Prepare updated data to send back to the server
        Map<String, dynamic> updateData = {
          'availableSeats': newAvailableSeats,
          'start': data[0]['start'],
          'destination': data[0]['destination'],
          'driver': data[0]['driver'], // Assuming driver is provided as an ID or object
          'startTime': data[0]['startTime'],
          'date': data[0]['date'],
        };

        // Send a PUT request to update the cab information
        final updateResponse = await http.put(
          Uri.parse('$baseUrl/cabs/$cabId/'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(updateData),
        );

        // Check if the update was successful
        if (updateResponse.statusCode == 200) {
          print('Updated available seats successfully');
        } else {
          print('Failed to update available seats. Status code: ${updateResponse.statusCode}');
          print('Response body: ${updateResponse.body}');
          throw Exception('Failed to update available seats');
        }
      } else {
        print('No data found for cabNumber: $cabNumber');
        throw Exception('No data found for cabNumber: $cabNumber');
      }
    } else {
      print('Failed to fetch cab. Status code: ${response.statusCode}');
      throw Exception('Failed to fetch cab');
    }
  } catch (e) {
    print('Error updating cab: $e');
    throw Exception('Failed to update available seats');
  }
}



// Future<void> updateCabAvailableSeats(String cabNumber, int newAvailableSeats) async {
//     try {
//       final Uri url = Uri.parse('$baseUrl/cabs/?cabNumber=$cabNumber');
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
             
      
//         if (data.isNotEmpty) {
//           print('Received data from server');
//           int cabId = data.first['id'];
//           print('Received data from server before: $cabId');
//           int? currentAvailableSeats = data.first['availableSeats'] as int?;
//           print('Received data from server after: $currentAvailableSeats');
//           if (currentAvailableSeats != null) {
//             print('Current available seats: $currentAvailableSeats');

//             Map<String, dynamic> updateData = {
//               'availableSeats': newAvailableSeats,
//             };

//             final updateResponse = await http.put(
//               Uri.parse('$baseUrl/cabs/$cabId/'),
//               headers: {'Content-Type': 'application/json'},
//               body: jsonEncode(updateData),
//             );

//             if (updateResponse.statusCode == 200) {
//               print('Updated available seats successfully');
//             } else {
//               print('Failed to update available seats. Status code: ${updateResponse.statusCode}');
//               throw Exception('Failed to update available seats');
//             }
//           } else {
//             print('Current available seats is null or not an integer');
//             throw Exception('Current available seats is null or not an integer');
//           }
//         } else {
//           print('No data found for cabNumber: $cabNumber');
//           throw Exception('No data found for cabNumber: $cabNumber');
//         }
//       } else {
//         print('Failed to fetch cab. Status code: ${response.statusCode}');
//         throw Exception('Failed to fetch cab');
//       }
//     } catch (e) {
//       print('Error updating cab: $e');
//       throw Exception('Failed to update available seats');
//     }
//   }
}

