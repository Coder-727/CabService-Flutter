import 'dart:async';
import 'package:cab_cris/secrets.dart'; // Ensure this file contains the correct API key
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Location _locationController = Location();
  StreamSubscription<LocationData>? _locationSubscription;

  final Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();

  static const LatLng _pCrisITPI = LatLng(28.6291, 77.2462);
  static const LatLng _pCris = LatLng(28.58729447780037, 77.18507269918517);
  LatLng? _currentP;

  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    getLocationUpdates().then(
      (_) {
        print("Location updates started");
        getPolylinePoints().then((coordinates) {
          if (coordinates.isNotEmpty) {
            print("Coordinates received: $coordinates");
            generatePolyLineFromPoints(coordinates);
          } else {
            print("No coordinates returned from getPolylinePoints");
          }
        }).catchError((error) {
          print("Error getting polyline points: $error");
        });
      },
    );
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentP == null
          ? const Center(
              child: Text("Loading..."),
            )
          : GoogleMap(
              onMapCreated: (GoogleMapController controller) => _mapController.complete(controller),
              initialCameraPosition: CameraPosition(
                target: _pCrisITPI,
                zoom: 13,
              ),
              markers: {
                if (_currentP != null)
                  Marker(
                    markerId: MarkerId("_currentLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _currentP!,
                  ),
                Marker(
                  markerId: MarkerId("_sourceLocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pCrisITPI,
                ),
                Marker(
                  markerId: MarkerId("_destinationLocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pCris,
                ),
              },
              polylines: Set<Polyline>.of(polylines.values),
            ),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(
      target: pos,
      zoom: 13,
    );
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(_newCameraPosition),
    );
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationSubscription = _locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        setState(() {
          _currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(_currentP!);
        });
      }
    });
  }

  Future<List<LatLng>> getPolylinePoints() async {
    print("Fetching polyline points");
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleMapsApiLKey,
      PointLatLng(_pCrisITPI.latitude, _pCrisITPI.longitude),
      PointLatLng(_pCris.latitude, _pCris.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      print("Polyline points fetched: ${result.points.length} points");
      for (PointLatLng point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      print("Error fetching polyline points: ${result.errorMessage}");
    }
    return polylineCoordinates;
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.black,
      points: polylineCoordinates,
      width: 8,
    );
    setState(() {
      polylines[id] = polyline;
    });
  }
}
