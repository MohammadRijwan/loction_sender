// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
//
// class LocationSender extends StatefulWidget {
//   const LocationSender({super.key});
//
//   @override
//   _LocationSenderState createState() => _LocationSenderState();
// }
//
// class _LocationSenderState extends State<LocationSender> {
//   final String url =
//       'https://webhook.site/610b1344-1ac2-42cf-8c7b-30752f36ce97';
//   final FlutterBackgroundService _service = FlutterBackgroundService();
//
//   @override
//   void initState() {
//     super.initState();
//     _service.startService();
//     _service.onDataReceived.listen((event) {
//       if (event?["action"] == "start") {
//         _startLocationService();
//       }
//     });
//   }
//
//   onStart() {
//     _service.startService();
//   }
//
//   Future<void> _startLocationService() async {
//     await Geolocator.requestPermission();
//     await Geolocator.checkPermission();
//
//     Geolocator.getPositionStream(
//             locationSettings:
//                 const LocationSettings(accuracy: LocationAccuracy.high))
//         .listen((position) {
//       final lat = position.latitude;
//       final lng = position.longitude;
//
//       http.post(Uri.parse(url),
//           headers: {'Content-Type': 'application/json'},
//           body: '{"lat": "$lat", "lng": "$lng"}');
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Location Sender'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('Start Location Service'),
//           onPressed: () {
//             _service.sendData({
//               "action": "start",
//             });
//           },
//         ),
//       ),
//     );
//   }
// }
