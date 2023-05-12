import 'package:geolocator/geolocator.dart';

class GeolocatorService{
  Future<Position> getLocation() async {
    var geolocator = Geolocator();
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high,);

  }

}