import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  double lat, long, zoom;
  String city;
  MapPage(
      {Key? key,
      required this.city,
      required this.lat,
      required this.long,
      required this.zoom})
      : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  MapType mapType = MapType.normal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Lieu de culte - ${widget.city}",
        ),
      ),
      body: GoogleMap(
        mapType: mapType,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.lat, widget.long),
          zoom: widget.zoom,
        ),
        markers: Set.of([
          Marker(
            markerId: MarkerId("VBA"),
            position: LatLng(widget.lat, widget.long),
            infoWindow: InfoWindow(
              title: "EJCSEV",
              snippet: "${widget.city}",
            ),
          ),
        ]),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
