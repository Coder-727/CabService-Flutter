import 'package:cab_cris/driver_add_journey.dart';
import 'package:cab_cris/driver_profile_page.dart';
import 'package:cab_cris/location_services.dart';
import 'package:cab_cris/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverHomePage extends StatefulWidget {
  const DriverHomePage({super.key});

  @override
  State<DriverHomePage> createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<DriverHomePage> {
  int currentPage = 0;
  double latitude = 0.0;
  double longitude = 0.0;
  List<Widget> pages = [
    const DriverHomePage(), // Define a new widget to represent the home cabs page content
    const DriverProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    getUserCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Driver Home Page',
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
                child: SizedBox(
                  height: 500,
                  child: MapScreen(
                   
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DriverAddJourney(),
                  ),
                );
              },
              child: const Text('Add Journey'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue.shade100,
        iconSize: 35,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_taxi),
            label: 'Cabs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void normalConfirmationDialog(String confirmationText, String title, String buttonText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/codemelogo.png',
                height: 50.0,
                width: 100.0,
              ),
              const SizedBox(height: 20.0,),
              Text(title, style: TextStyle(fontSize: 20.0),),
              const SizedBox(height: 10.0,),
              Text(
                confirmationText,
              ),
              const SizedBox(height: 20.0,),
              ElevatedButton(
                onPressed: (){
                  if(buttonText == 'Open Settings'){
                    _openLocationSettings(); // Call method to open location settings
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Text(buttonText),
              )
            ],
          ),
        );
      },
    );
  }

  void _openLocationSettings() async {
    const url = 'app-settings:';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void getUserCurrentLocation() async {
  Location location = Location();
  
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      normalConfirmationDialog(
        'Location Is Disabled. App wants to access your location',
        'Please Enable Your Location',
        'Enable Location',
      );
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      normalConfirmationDialog(
        'Denied the location permission. Please go to settings and give access',
        'Location Permission Denied',
        'Open Settings',
      );
      print('Location_Permission_Denied:-');
      return;
    }
  }

  location.onLocationChanged.listen((LocationData currentLocation) async {
    // Handle location updates here.
    print("Location: ${currentLocation.latitude}, ${currentLocation.longitude}");
    setState(() {
      latitude = currentLocation.latitude ?? 0.0;
      longitude = currentLocation.longitude ?? 0.0;
    });

    // Add the location to your backend API
    try {
      await LocationServices().addLocation({
        'latitude': latitude,
        'longitude': longitude,
      });
      print('Location added successfully to API.');
    } catch (e) {
      print('Failed to add location to API: $e');
      // Handle error accordingly
    }
  });
}
}
