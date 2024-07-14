import 'package:cab_cris/global_variables.dart';
import 'package:flutter/material.dart';
class UserRideHistoryPage extends StatelessWidget {
  const UserRideHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride History',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: ListView.builder(
        itemCount: rideHistory.length,
        itemBuilder: (context,index){
          final ride=rideHistory[index];
          return Column(
            children: [
              ListTile(
                leading: const Icon(Icons.local_taxi),
                title: Text('${ride['date'] as String} ${ride['time'] as String}   ${ride['start'] as String}->${ride['destination'] as String}') ,
                trailing: Text('Cab:${ride['cabNumber'] as int}'),
              ),
              const Divider(),
            ],
          );
        }
      ),
    );
  }
}