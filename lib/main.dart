import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
CameraPosition  initialCameraPosition =CameraPosition(
  target: LatLng(30.0444,31.2357),
  tilt: 90,
  zoom: 4,
  bearing: 90,

);
class _MyHomePageState extends State<MyHomePage> {

Set<Marker> myMarkers = {
  Marker(
      markerId: MarkerId("l1"),
      position: LatLng(
          initialCameraPosition.target.longitude,
          initialCameraPosition.target.latitude
      )
  ),
  Marker(
      markerId: MarkerId("l2"),
      position: LatLng(
          initialCameraPosition.target.longitude,
          initialCameraPosition.target.latitude
      )
  )
};


late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
       onMapCreated: (controller){
        googleMapController = controller;
       },
        markers: myMarkers,
        onTap: (LatLng current){
          setState(() {
          myMarkers.add(Marker(markerId: MarkerId("l2"),
          position: LatLng(current.latitude, current.longitude),
          ));
        });
    }

    ));
  }
}
