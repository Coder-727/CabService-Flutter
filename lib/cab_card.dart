import 'package:flutter/material.dart';

class CabCard extends StatelessWidget {
  const CabCard({
    Key? key,
    required this.cabNumber,
    required this.start,
    required this.destination,
    required this.availableSeats,
    required this.driverName,
    required this.startTime,
    required this.date,
  }) : super(key: key);

  final String cabNumber;
  final String start;
  final String destination;
  final int availableSeats;
  final String driverName;
  final String startTime;
  final String date;

  @override
  Widget build(BuildContext context) {
    bool isAtoB = start == 'A' && destination == 'B';
    Color backgroundColor = isAtoB ? Colors.blue.shade100 : Colors.white;
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date: $date',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Cab Number: $cabNumber',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Driver: $driverName',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Starting: $start',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Destination: $destination',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Available Seats: $availableSeats',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Start Time: $startTime',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Image.asset(
                'assets/images/cab.webp',
                height: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
