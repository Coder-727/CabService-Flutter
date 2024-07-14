import 'package:flutter/material.dart';
import 'package:cab_cris/booking_confirm_page.dart';
import 'package:cab_cris/user_cab_tracking_page.dart';
import 'package:cab_cris/cab_services.dart';
import 'package:cab_cris/cab_model_page.dart'; // Import your Cab model definition here

class CabBookingPage extends StatelessWidget {
  final Cab cab;

  CabBookingPage({Key? key, required this.cab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cab Booking...',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Review Your booking details',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Text(
                  'Date: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cab.date,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Text(
                  'Time: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cab.startTime,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Text(
                  'Cab Number: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cab.cabNumber,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Text(
                  'Driver: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cab.driverName,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${cab.start}------>',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cab.destination,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                int updatedAvailableSeats = cab.availableSeats - 1;
                try {
                  await CabService().updateCabAvailableSeats(
                      cab.cabNumber, updatedAvailableSeats);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const BookingConfirmPage()));
                } catch (e) {
                  print('Error updating cab: $e');
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Confirm'),
            ),
          ),
          const Spacer(),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UserCabTrackingPage()));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Track'),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
