import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _startLocationService();
  runApp(MyApp());
}

Future<void> _startLocationService() async {
  await Geolocator.requestPermission();
  await Geolocator.checkPermission();

  Geolocator.getPositionStream(
          locationSettings:
              const LocationSettings(accuracy: LocationAccuracy.high))
      .listen((position) {
    final lat = position.latitude;
    final lng = position.longitude;

    http.post(
        Uri.parse('https://webhook.site/610b1344-1ac2-42cf-8c7b-30752f36ce97'),
        headers: {'Content-Type': 'application/json'},
        body: '{"sender": "Mohammad Rijwan","lat": "$lat", "lng": "$lng"}');
  });
}

class MyApp extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Background Location'),
        ),
        body: const Center(
          child: Text('Location sending in background...'),
        ),
      ),
    );
  }
}
