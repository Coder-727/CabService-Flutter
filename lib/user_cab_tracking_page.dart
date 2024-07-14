import 'package:cab_cris/map_screen.dart';
import 'package:flutter/material.dart';
class UserCabTrackingPage extends StatelessWidget {
  const UserCabTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Live Tracking',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: const SizedBox(
                  height: 500,
                  child: MapScreen(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            
          ],
        ),
      ),
      
    );
  }
}