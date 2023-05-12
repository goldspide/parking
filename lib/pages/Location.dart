import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

// ignore: camel_case_types
class _locationState extends State<location> {

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const Polyline _polyline = Polyline(
      polylineId: PolylineId("line"),
      points: [
        LatLng(4.083417233359129, 9.780615054481263),
        LatLng(4.091559623636986, 9.773841900128769),
      ],
      width: 5);

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(4.083417233359129, 9.780615054481263),
    zoom: 18.4746,
  );
  static final Marker _marker1 = Marker(
      markerId: const MarkerId("1"),
      infoWindow: const InfoWindow(title: 'Parking Simon Desire'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: const LatLng(4.099005404455831, 9.737600732103177));

  //
  static final Marker _marker2 = Marker(
      markerId: const MarkerId("2"),
      infoWindow:
          const InfoWindow(title: 'PARKING KOTTO CARREFOUR DES IMMEUBLES'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(4.101744956047995, 9.74927370548773));

  static final Marker _marker3 = Marker(
      markerId: const MarkerId("3"),
      infoWindow: const InfoWindow(title: 'Car park'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(4.0859586849853216, 9.704641129531337));

  static final Marker _marker4 = Marker(
      markerId: const MarkerId("4"),
      infoWindow: const InfoWindow(title: 'Faucon Services'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(4.058562208940004, 9.76849916039977));

  static final Marker _marker5 = Marker(
      markerId: const MarkerId("5"),
      infoWindow: const InfoWindow(title: 'CParking communal payant'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(4.101711235391284, 9.737600113205367));

  static final Marker _marker6 = Marker(
      markerId: const MarkerId("6"),
      infoWindow:
          const InfoWindow(title: 'PARKING KOTTO CARREFOUR DES IMMEUBLES'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(4.109244954134458, 9.746526504617085));

  static final Marker _marker7 = Marker(
      markerId: const MarkerId("7"),
      infoWindow: const InfoWindow(title: 'Total Bonaberi 1 - Douala 4'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(4.059247132195609, 9.763692641947308));

  static final Marker _marker8 = Marker(
      markerId: const MarkerId("8"),
      infoWindow: const InfoWindow(title: 'Parking Bicec'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(4.056507435687909, 9.68884828318753));

  static final Marker _marker9 = Marker(
      markerId: const MarkerId("9"),
      infoWindow: const InfoWindow(
          title: 'PARKING LE PAVILLON D\'ELISEE AU COMPTE SCL BEEDI'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(4.122004523609447, 9.737024883238682));

  static final Marker _marker10 = Marker(
      markerId: const MarkerId("10"),
      infoWindow: const InfoWindow(title: 'Bonabéri Car Park'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(4.152138200984723, 9.654627424053604));

  static final Marker _marker11 = Marker(
      markerId: const MarkerId("11"),
      infoWindow: const InfoWindow(title: 'Parking Auto Nyenty'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(4.168574267900823, 9.624415022352412));

  static final Marker _marker12 = Marker(
      markerId: const MarkerId("12"),
      infoWindow: const InfoWindow(title: 'Parking Bolloré'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(4.130222912880054, 9.679346661809129));

  static final Marker _marker13 = Marker(
      markerId: const MarkerId("13"),
      infoWindow:
          const InfoWindow(title: 'UB Central Administration Parking Lot'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(4.190488489014508, 9.27010594785658));

  static final Marker _marker14 = Marker(
      markerId: const MarkerId("14"),
      infoWindow: const InfoWindow(
          title: 'Parking Ecole Nationale Supérieure Polytechnique de Douala'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(4.138441217027009, 9.811182596505251));

  static final Marker _marker15 = Marker(
      markerId: const MarkerId("15"),
      infoWindow: const InfoWindow(title: 'Parking confiance'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(4.017897629445661, 9.789209940722564));

  static const CameraPosition _position = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(4.083512969406955, 9.780113457002757),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    // final currentPosition = Provider.of<Position>(context);
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.06,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              initialCameraPosition: _position,
              mapType: MapType.normal,
              markers: {
                _marker1,
                _marker2,
                _marker3,
                _marker4,
                _marker5,
                _marker6,
                _marker7,
                _marker8,
                _marker9,
                _marker10,
                _marker11,
                _marker12,
                _marker13,
                _marker14,
                _marker15
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:park/components/screen_buttom.dart';
//
// class MapSample extends StatefulWidget {
//   const MapSample({Key? key}) : super(key: key);
//
//   @override
//   State<MapSample> createState() => MapSampleState();
// }
//
// class MapSampleState extends State<MapSample> {
//   final Completer<GoogleMapController> _controller =
//   Completer<GoogleMapController>();
//
//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );
//
//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           GoogleMap(
//             mapType: MapType.hybrid,
//             initialCameraPosition: _kGooglePlex,
//             onMapCreated: (GoogleMapController controller) {
//               _controller.complete(controller);
//             },
//           ),
//           // floatingActionButton: FloatingActionButton.extended(
//           //   onPressed: _goToTheLake,
//           //   label: const Text('To the lake!'),
//           //   icon: const Icon(Icons.directions_boat),
//           // ),
//         ],
//       ),
//
//     );
//   }
//
//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }
