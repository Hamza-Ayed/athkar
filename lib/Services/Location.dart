import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;
  Future<Object> getCurrentLocation() async {
    try {
      GeolocationStatus geolocationStatus =
          await Geolocator().checkGeolocationPermissionStatus();
      if (geolocationStatus == false) {
        return const Text('you will activate GPS ');
      }
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
    return Location;
//    return longitude;
  }
}
