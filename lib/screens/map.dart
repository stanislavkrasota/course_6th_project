import 'package:course_6th_project/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  MapScreen({
    super.key,
    this.locations = const [],
    this.isSelected = true,
  });

  final List<PlaceLocation> locations;
  bool isSelected;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  PlaceLocation? location;
  LatLng? _pickedlocation;

  @override
  void initState() {
    super.initState();
    if (widget.locations.isEmpty) {
      location = PlaceLocation(
        latitude: 40.718217,
        longitude: -73.998284,
        address: '',
      );
    } else {
      location = widget.locations[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isSelected ? 'Pick your location' : 'Your Location'),
        actions: [
          if (widget.isSelected)
            IconButton(
              onPressed: () {
                Navigator.of(context).pop(_pickedlocation);
              },
              icon: const Icon(Icons.save),
            ),
        ],
      ),
      body: GoogleMap(
        onTap: !widget.isSelected
            ? null
            : (position) {
                setState(() {
                  _pickedlocation = position;
                });
              },
        initialCameraPosition: CameraPosition(
          target: LatLng(
            location?.latitude ?? 40.718217,
            location?.longitude ?? -73.998284,
          ),
          zoom: 16,
        ),
        markers: _pickedlocation == null && widget.isSelected
            ? {}
            : {
                Marker(
                  markerId: const MarkerId('m1'),
                  position: _pickedlocation ??
                      LatLng(
                        location?.latitude ?? 40.718217,
                        location?.longitude ?? -73.998284,
                      ),
                ),
              },
      ),
    );
  }
}
