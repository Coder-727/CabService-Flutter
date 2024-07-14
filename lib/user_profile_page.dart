import 'package:cab_cris/user_personal_details_page.dart';
import 'package:cab_cris/user_ride_history_page.dart';
import 'package:cab_cris/user_settings_page.dart';
import 'package:flutter/material.dart';
class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        Card(
              color: Colors.blue.shade100,
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.blue.shade700),
                title: const Text(
                  'Personal Details',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue.shade700),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UserPersonalDetailsPage()));
                },
              ),
            ),
            Card(
              color: Colors.blue.shade100,
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: ListTile(
                leading: Icon(Icons.history, color: Colors.blue.shade700),
                title: const Text(
                  'Ride History',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue.shade700),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UserRideHistoryPage()));
                },
              ),
            ),
            Card(
              color: Colors.blue.shade100,
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: ListTile(
                leading: Icon(Icons.settings, color: Colors.blue.shade700),
                title: const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue.shade700),
                onTap: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UserSettingsPage()));
                },
              ),
            ),
        
      ],
    );
  }
}