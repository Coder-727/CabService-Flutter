import 'package:flutter/material.dart';
// import 'driver_service.dart';

class DriverListPage extends StatefulWidget {
  @override
  _DriverListPageState createState() => _DriverListPageState();
}

class _DriverListPageState extends State<DriverListPage> {
  // final DriverService _driverService = DriverService();
  late Future<List<dynamic>> _drivers;

  @override
  void initState() {
    super.initState();
    // _drivers = _driverService.fetchDrivers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drivers'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _drivers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No drivers found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final driver = snapshot.data![index];
                return ListTile(
                  title: Text(driver['name']),
                  subtitle: Text(driver['car_model']),
                );
              },
            );
          }
        },
      ),
    );
  }
}
