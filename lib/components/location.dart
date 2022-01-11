import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location{
  late double latitude;
  late double longitude;
  late LatLng center;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      center = LatLng(latitude, longitude);
    } catch (e) {
      print(e);
      latitude = 45.521563;
      longitude = -122.677433;
      center = LatLng(latitude, longitude);
    }
  }

}