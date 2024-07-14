import 'package:flutter/material.dart';
import 'package:cab_cris/cab_model_page.dart';
import 'package:cab_cris/cab_booking_page.dart';
import 'package:cab_cris/cab_card.dart';
import 'package:cab_cris/cab_services.dart'; // Import RideService

class HomeCabsPage extends StatefulWidget {
  const HomeCabsPage({Key? key});

  @override
  _HomeCabsPageState createState() => _HomeCabsPageState();
}

class _HomeCabsPageState extends State<HomeCabsPage> {
  late Future<List<Cab>> _cabsFuture;

  @override
  void initState() {
    super.initState();
    _cabsFuture = CabService().fetchCabs();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cab>>(
      future: _cabsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final cab = snapshot.data![index];
              return GestureDetector(
                onTap: () async {
                  try {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CabBookingPage(cab: cab),
                      ),
                    );
                    // Refresh the cab list after booking
                    setState(() {
                      _cabsFuture = CabService().fetchCabs();
                    });
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error updating cab: $e')),
                    );
                  }
                },
                child: CabCard(
                  cabNumber: cab.cabNumber,
                  start: cab.start,
                  destination: cab.destination,
                  availableSeats: cab.availableSeats,
                  driverName: cab.driverName,
                  startTime: cab.startTime,
                  date: cab.date,
                ),
              );
            },
          );
        }
      },
    );
  }
}
