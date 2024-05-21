import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Driver extends StatefulWidget {
  const Driver({super.key});

  @override
  State<Driver> createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  bool _isInArea = false;

  double targetLatitude = 9.56177312816305;
  double targetLongitude = 44.064824627050506;
  double targetRadius = 5; // (area | Distance) meters

  // Permissions
  Future<void> _requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  double? lat, log, distances;

  Future<bool> _isDeviceInArea() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    print((position.latitude, position.longitude));

    double distance = Geolocator.bearingBetween(
      position.latitude,
      position.longitude,
      targetLatitude,
      targetLongitude,
    );

    lat = position.latitude;
    log = position.longitude;
    // distances = distance;

    print((distance, targetRadius, distance <= targetRadius));

    return distance <= targetRadius;
  }

  Future<void> _checkLocation() async {
    await _requestPermission();

    bool isInArea = await _isDeviceInArea();

    _isInArea = isInArea;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _checkLocation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('location Testing'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            if (_isInArea) Text('Latitude: $lat, Longitude: $log'),
            Visibility(
              visible: _isInArea,
              replacement: const CircularProgressIndicator(),
              child: (_isInArea
                  ? ElevatedButton(
                      onPressed: () {
                        // Your button action
                      },
                      child: Text('You are in the area! $_isInArea'),
                    )
                  : Text('You are not in the area. $_isInArea')),
            ),
          ],
        ),
      ),
    );
  }
}
