import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double lat;
  double long;

  Future<void> getCurrentLocation() async {
    print('lolo');
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position);
      lat = position.latitude;
      long = position.longitude;
      print(position);
    } catch (e) {
      print(e);
    }
  }
}
